/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.Util;
import cn.edu.tsinghua.sthu.entity.UserEntity;
import cn.edu.tsinghua.sthu.message.AlertMessage;
import cn.edu.tsinghua.sthu.message.LoginMessage;
import cn.edu.tsinghua.sthu.service.UserService;
import java.math.BigInteger;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author linangran
 */
public class LoginAction extends BaseAction {

    private String username;
    private String password;
    private String redirectURL;
    private UserService userService;
    private LoginMessage loginMessage;
    
    public String getUsername() {
	return username;
    }

    public void setUsername(String username) {
	this.username = username;
    }

    public String getPassword() {
	return password;
    }

    public void setPassword(String password) {
	this.password = password;
    }

    @Override
    public String onExecute() {
	UserEntity entity;
	this.setPassword(Util.RSADecryption(this.getPassword()));
	try {
	    entity = getUserService().userLogin(username, password);
	} catch (Exception ex) {
	    Logger.getLogger(LoginAction.class.getName()).log(Level.SEVERE, null, ex);
	    alertMessage.setAlertTitle("抱歉");
	    alertMessage.setAlertContent("抱歉，info登录接口出现故障，暂时无法登陆，请稍后再试。如无改善，请联系网站管理员");
	    alertMessage.setAlertType(AlertMessage.BOX_TYPE);
	    return ALERT;
	}
	if (isValid(redirectURL) == false) {
	    redirectURL = "/index.do";
	} else {
	    redirectURL = Util.decodeURL(redirectURL);
	}
	if (entity != null) {
	    getLoginMessage().setLoginDate(entity.getLastlogintime());
	    getLoginMessage().setNickName(entity.getNickname());
	    setSession("isLogin", true);
	    setSession("userinfo", entity);
	    return SUCCESS;
	} else {
	    getAlertMessage().setAlertType(AlertMessage.BOX_TYPE);
	    getAlertMessage().setAlertTitle("用户名密码错误");
	    getAlertMessage().setAlertContent("请重新输入用户名密码！");
	    getAlertMessage().setRedirectURL("/login.do?redirectURL=" + Util.encodeURL(redirectURL));
	    return ALERT;
	}
    }

    public UserService getUserService() {
	return userService;
    }

    public void setUserService(UserService userService) {
	this.userService = userService;
    }

    public LoginMessage getLoginMessage() {
	return loginMessage;
    }

    public void setLoginMessage(LoginMessage loginMessage) {
	this.loginMessage = loginMessage;
    }

    @Override
    public boolean valid() {
	if (isValid(username) && isValid(password)) {
	    return true;
	} else {
	    alertMessage.setSimpleAlert("请输入用户名密码！");
	    return false;
	}
    }

    public String getRedirectURL() {
	return redirectURL;
    }

    public void setRedirectURL(String redirectURL) {
	this.redirectURL = redirectURL;
    }

    @Override
    public boolean needLogin() {
	return false;
    }
}
