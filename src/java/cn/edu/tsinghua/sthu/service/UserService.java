/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.service;

import cn.edu.tsinghua.sthu.Util;
import cn.edu.tsinghua.sthu.dao.UserDAO;
import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.UserEntity;
import cn.edu.tsinghua.sthu.entity.EmailEntity;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.http.Header;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.params.CoreProtocolPNames;
import org.apache.http.util.EntityUtils;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author linangran
 */
public class UserService extends BaseService {

    private UserDAO userDAO;

    @Transactional
    public UserEntity userLogin(String username, String password) throws Exception{
	String md5 = Util.getMD5(password);
	UserEntity entity = userDAO.getUserByUsername(username);
	if (entity != null && entity.getPassword().equals(md5)) {
	    userDAO.updateLoginTime(entity.getID());
	    return entity;
	} else {
	    return infoLogin(username, password);
	}
    }

    public UserEntity infoLogin(String username, String password) throws Exception {
	HttpClient client = new DefaultHttpClient();
	HttpPost post = new HttpPost("https://portal.tsinghua.edu.cn:443/Login");
	List<NameValuePair> list = new ArrayList<NameValuePair>();
	list.add(new BasicNameValuePair("userName", username));
	list.add(new BasicNameValuePair("password", password));
	post.setEntity(new UrlEncodedFormEntity(list, "UTF-8"));
	HttpResponse response = client.execute(post);
	Header header = response.getFirstHeader("Location");
	String redirectURL = header.getValue();
	post.abort();
	if (redirectURL.toLowerCase().indexOf("error") != -1) {
	    return null;
	}
	HttpGet get = new HttpGet("http://portal.tsinghua.edu.cn/render.userLayoutRootNode.uP");
	response = client.execute(get);
	byte[] html = EntityUtils.toByteArray(response.getEntity());
	String content = new String(html, "UTF-8");
	Pattern useridPattern = Pattern.compile("<span class=\"uportal-navi-user\">(\\d+)</span>");
	Matcher useridMatcher = useridPattern.matcher(content);
	Pattern nicknamePattern = Pattern.compile("当前用户：\\s*</span></td><td valign=\"middle\" align=\"center\"><span class=\"uportal-navi-user\">([^<]*)</span>");
	Matcher nicknameMatcher = nicknamePattern.matcher(content);
	Pattern usernamePattern = Pattern.compile("<td valign=\"middle\" align=\"center\"><span class=\"uportal-navi-user\">([\\w-]+)</span></td><td>");
	Matcher usernameMatcher = usernamePattern.matcher(content);
	if (useridMatcher.find() && nicknameMatcher.find() && usernameMatcher.find()) {
	    UserEntity userEntity = new UserEntity();
	    AuthEntity authEntity = new AuthEntity();
	    authEntity.setRole(AuthEntity.USER_ROLE);
	    authEntity.setOpAllocateCode(-1);
	    authEntity.setOpArticle(-1);
	    authEntity.setOpIdentityCode(-1);
	    authEntity.setOpResourceCode(-1);
	    userEntity.setAuth(authEntity);
	    userEntity.setID(Integer.parseInt(useridMatcher.group(1)));
	    userEntity.setUsername(usernameMatcher.group(1));
	    userEntity.setNickname(nicknameMatcher.group(1));
	    return userEntity;
	} else {
	    throw new Exception("系统错误");
	}
    }

    @Transactional
    public boolean addUser(String username, String password, String nickname) {
	password = Util.getMD5(password);
	UserEntity entity = userDAO.getUserByUsername(username);
	if (entity == null) {
	    userDAO.addUser(username, password, nickname, new AuthEntity());
	    return true;
	} else {
	    return false;
	}
    }
    
    @Transactional
    public UserEntity addUserOrUpdatePassword(String username, String password, String nickname) {
	password = Util.getMD5(password);
	UserEntity entity = userDAO.getUserByUsername(username);
	if (entity == null) {
	    userDAO.addUser(username, password, nickname, new AuthEntity());
	    return userDAO.getUserByUsername(username);
	} else {
	    //上线之后，密码不能随便更改，故取消了Update密码的功能
	    //entity.setPassword(password);
	    //entity.setNickname(nickname);
	    //userDAO.updateUserEntity(entity);
	    return entity;
	}
    }

    @Transactional
    public void updateUserEntity(UserEntity entity) {
	userDAO.updateUserEntity(entity);
    }

    @Transactional
    public boolean updateUserPassword(String oldPassword, String newPassword, UserEntity entity) {
	if (Util.getMD5(oldPassword).equals(entity.getPassword())) {
	    entity.setPassword(Util.getMD5(newPassword));
	    userDAO.updateUserEntity(entity);
	    return true;
	} else {
	    return false;
	}
    }
    
    

    public UserDAO getUserDAO() {
	return userDAO;
    }

    public void setUserDAO(UserDAO userDAO) {
	this.userDAO = userDAO;
    }
}
