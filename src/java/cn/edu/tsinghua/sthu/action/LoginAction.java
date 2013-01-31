/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.entity.UserEntity;
import cn.edu.tsinghua.sthu.message.AlertMessage;
import cn.edu.tsinghua.sthu.message.BaseMessage;
import cn.edu.tsinghua.sthu.message.LoginMessage;
import cn.edu.tsinghua.sthu.service.UserService;
import com.opensymphony.xwork2.*;
import java.util.Date;

/**
 *
 * @author linangran
 */
public class LoginAction extends BaseAction {
    private String username;
    private String password;
    private UserService userService;
    private LoginMessage loginMessage;

    public String getUsername()
    {
	return username;
    }

    public void setUsername(String username)
    {
	this.username = username;
    }

    public String getPassword()
    {
	return password;
    }

    public void setPassword(String password)
    {
	this.password = password;
    }

    @Override
    public String onExecute()
    {
	UserEntity entity = getUserService().userLogin(username, password);
	if (entity != null)
	{
	    getLoginMessage().setLoginDate(entity.getLastlogintime());
	    getLoginMessage().setNickName(entity.getNickname());
	    return SUCCESS;
	}
	else
	{
	    getAlertMessage().setAlertType(AlertMessage.BOX_TYPE);
	    getAlertMessage().setAlertTitle("用户名密码错误");
	    getAlertMessage().setAlertContent("请重新输入用户名密码！");
	    getAlertMessage().setRedirectURL(AlertMessage.REFERER_URL);
	    return ALERT;
	}
    }

    public UserService getUserService() {
	return userService;
    }

    public void setUserService(UserService userService) {
	this.userService = userService;
    }

    public LoginMessage getLoginMessage()
    {
	return loginMessage;
    }

    public void setLoginMessage(LoginMessage loginMessage)
    {
	this.loginMessage = loginMessage;
    }

    @Override
    public boolean valid()
    {
	if (isValid(username) && isValid(password))
	{
	    return true;
	}
	else
	{
	    alertMessage.setAlertTitleContent("请输入用户名密码！");
	    return false;
	}
    }
}
