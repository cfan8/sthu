/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.Util;
import cn.edu.tsinghua.sthu.message.AlertMessage;
import cn.edu.tsinghua.sthu.service.UserService;

/**
 *
 * @author linangran
 */
public class AddUserAction extends BaseAction
{
    private String username;
    private String password;
    private String nickname;

    private UserService userService;

    @Override
    public String onExecute()
    {
	if (userService.addUser(username, password, nickname))
	{
	    alertMessage.setAlertTitle("创建成功");
	    alertMessage.setAlertContent("创建成功，点击确定登录！");
	    alertMessage.setAlertType(AlertMessage.BOX_TYPE);
	    alertMessage.setRedirectURL("login.jsp");
	}
	else{
	    alertMessage.setAlertTitle("创建失败");
	    alertMessage.setAlertContent("已有重名用户！");
	    alertMessage.setAlertType(AlertMessage.ALERT_TYPE);
	    alertMessage.setRedirectURL(AlertMessage.REFERER_URL);
	}
	return ALERT;
    }

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

    public String getNickname()
    {
	return nickname;
    }

    public void setNickname(String nickname)
    {
	this.nickname = nickname;
    }

    public UserService getUserService()
    {
	return userService;
    }

    public void setUserService(UserService userService)
    {
	this.userService = userService;
    }

    @Override
    public boolean valid()
    {
	if (isValid(username) && isValid(password) && isValid(nickname))
	{
	    return true;
	}
	else
	{
	    alertMessage.setAlertTitleContent("输入数据有误！");
	    return false;
	}
    }

}
