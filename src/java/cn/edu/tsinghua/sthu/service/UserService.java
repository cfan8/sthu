/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.service;

import cn.edu.tsinghua.sthu.Util;
import cn.edu.tsinghua.sthu.dao.FollowDAO;
import cn.edu.tsinghua.sthu.dao.GroupImgDAO;
import cn.edu.tsinghua.sthu.dao.UserDAO;
import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.UserEntity;
import cn.edu.tsinghua.sthu.entity.EmailEntity;
import cn.edu.tsinghua.sthu.entity.FollowEntity;
import cn.edu.tsinghua.sthu.entity.GroupImgEntity;

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
    private FollowDAO followDAO;
    private GroupImgDAO groupImgDAO;
    public static final int MAX_IMG_NUMBER = 5;
    
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
    public boolean addUser(String username, String password, String nickname, int userrole) {
	password = Util.getMD5(password);
	UserEntity entity = userDAO.getUserByUsername(username);
	if (entity == null) {
            AuthEntity auth = new AuthEntity();
            auth.setRole(userrole);
	    userDAO.addUser(username, password, nickname, auth);
	    return true;
	} else {
	    return false;
	}
    }
    
    @Transactional
    public boolean addUser(String username, String password, String nickname, int userrole, int opAllocateCode,
    int opArticleCode, int opIdentityCode, int opResourceCode, int opGroupCode, int opPublishCode, int opOtherCode,
    int opUserCode, int groupType) {
	password = Util.getMD5(password);
	UserEntity entity = userDAO.getUserByUsername(username);
	if (entity == null) {
            AuthEntity auth = new AuthEntity();
            auth.setRole(userrole);
            auth.setOpAllocateCode(opAllocateCode);
            auth.setOpArticle(opArticleCode);
            auth.setOpGroupCode(opGroupCode);
            auth.setOpIdentityCode(opIdentityCode);
            auth.setOpOtherCode(opOtherCode);
            auth.setOpPublishCode(opPublishCode);
            auth.setOpResourceCode(opResourceCode);
            auth.setOpUserCode(opUserCode);
            auth.setGroupType(groupType);
	    userDAO.addUser(username, password, nickname, auth);
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
    public UserEntity getUserEntityByUsername(String username){
        return userDAO.getUserByUsername(username);
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
    
    @Transactional
    public boolean updateUserPassword(String newPassword, UserEntity entity) {
	
	    entity.setPassword(Util.getMD5(newPassword));
	    userDAO.updateUserEntity(entity);
	    return true;
    }

    @Transactional
    public UserEntity getUserEntityById(int userId){
        return userDAO.getUserById(userId);
    }
    
    @Transactional
    public UserEntity followGroup(UserEntity user, UserEntity group){
        if(checkGroupFollowedByUser(user, group))
            return null;
//        user.getInterestedGroups().add(group);
//        userDAO.updateUserEntity(user);
        followDAO.addFollowGroup(user.getID(), group.getID());
        return user;
    }
    
    @Transactional
    public UserEntity unfollowGroup(UserEntity user, UserEntity group){
        if(!checkGroupFollowedByUser(user, group))
            return null;
//        user.getInterestedGroups().remove(group);
//        userDAO.updateUserEntity(user);
        followDAO.cancelFollowGroup(user.getID(), group.getID());
        return user;
    }
    
    @Transactional
    public boolean checkGroupFollowedByUser(UserEntity user, UserEntity group){
//        if(user.getInterestedGroups() == null)
//            return false;
//        if(user.getInterestedGroups().contains(group))
//            return true;
//        return false;
        return getFollowDAO().isGroupFollowedByUser(user.getID(), group.getID());
    }
    
    @Transactional
    public UserEntity modifyGroupInfo(int groupId, String introduction, String mainImg, String logoImg){
        UserEntity entity = userDAO.getUserById(groupId);
        entity.setIntroduction(introduction);
        entity.setMainImg(mainImg);
        entity.setLogoImg(logoImg);
        userDAO.updateUserEntity(entity);
        return entity;
    }
    
    @Transactional
    public UserEntity modifyGroupImages(int groupId, List<GroupImgEntity> images){
        UserEntity group = userDAO.getUserById(groupId);
        group.setImages(images);
        userDAO.updateUserEntity(group);
        return group;
        
    }
    @Transactional
    public List<GroupImgEntity> getImagesByGroupId(int groupId) {
	List<GroupImgEntity> list = groupImgDAO.getImagesByGroupId(groupId);
	if (list.size() < MAX_IMG_NUMBER) {
	    int t = MAX_IMG_NUMBER - list.size();
	    List<GroupImgEntity> saveList = new ArrayList<GroupImgEntity>();
	    for (int i = 0; i < t; i++) {
                GroupImgEntity entity = new GroupImgEntity();
                entity.setGroupId(groupId);
                entity.setEnabled(false);
                entity.setImg("");
                entity.setTitle("");
		saveList.add(entity);
	    }
	    groupImgDAO.addImgs(saveList);
	    list = groupImgDAO.getImagesByGroupId(groupId);
	}
	return list;
    }
    @Transactional
    public List<GroupImgEntity> getValidImagesByGroupId(int groupId){
        List<GroupImgEntity> list = groupImgDAO.getValidImagesByGroupId(groupId);
        if(list == null || list.size() == 0){
            GroupImgEntity groupImg = new GroupImgEntity();
            groupImg.setGroupId(groupId);
            groupImg.setImg("/images/banner.jpg");
            groupImg.setTitle("默认图片");
            groupImg.setEnabled(true);
            list.add(groupImg);
        }
        return list;

    }
    
    @Transactional
    public void updateImgs(List<GroupImgEntity> list){
        if (list.size() == MAX_IMG_NUMBER)
	{
	    groupImgDAO.updateImgs(list);
	}
    }
    
    @Transactional
    public List<UserEntity> getFollowGroupsByUserId(int userID){
        List<UserEntity> list = new ArrayList<UserEntity>();
        List<FollowEntity> followList = followDAO.getFollowGroupByUserId(userID);
        for (FollowEntity followEntity : followList) {
            list.add(getUserEntityById(followEntity.getGroupID()));
        }
        return list;
    }
    
    @Transactional
    public List<UserEntity> getFollowGroupsByUserId(int userID, int maxNum){
        List<UserEntity> list = new ArrayList<UserEntity>();
        List<FollowEntity> followList = followDAO.getFollowGroupByUserId(userID, maxNum);
        for (FollowEntity followEntity : followList) {
            list.add(getUserEntityById(followEntity.getGroupID()));
        }
        return list;
    }
    
    @Transactional
    public List<Integer> getFollowedGroupsFollowNumbers(List<UserEntity> groups){
        List<Integer> list = new ArrayList<Integer>();
        for (UserEntity e : groups) {
            list.add(followDAO.getFollowedNumberByGroupId(e.getID()));
        }
        return list;
    }
    
    @Transactional
    public int getFollowNumByGroupId(int groupId){
        return followDAO.getFollowedNumberByGroupId(groupId);
    }

    public UserDAO getUserDAO() {
	return userDAO;
    }

    public void setUserDAO(UserDAO userDAO) {
	this.userDAO = userDAO;
    }

    /**
     * @return the followDAO
     */
    public FollowDAO getFollowDAO() {
        return followDAO;
    }

    /**
     * @param followDAO the followDAO to set
     */
    public void setFollowDAO(FollowDAO followDAO) {
        this.followDAO = followDAO;
    }

    /**
     * @return the groupImgDAO
     */
    public GroupImgDAO getGroupImgDAO() {
        return groupImgDAO;
    }

    /**
     * @param groupImgDAO the groupImgDAO to set
     */
    public void setGroupImgDAO(GroupImgDAO groupImgDAO) {
        this.groupImgDAO = groupImgDAO;
    }

}
