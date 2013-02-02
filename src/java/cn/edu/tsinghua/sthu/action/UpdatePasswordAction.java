/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.service.UserService;

/**
 *
 * @author linangran
 */
public class UpdatePasswordAction extends BaseAction{

    private String oldPassword;
    private String newPassword;
    private String repeatPassword;
    
    private UserService userService;
    
    @Override
    public String onExecute() {
	if (userService.updateUserPassword(oldPassword, newPassword, getCurrentUser()))
	{
	    alertMessage.setSimpleAlert("密码修改成功！");
	}
	else
	{
	    alertMessage.setSimpleAlert("原密码输入有误！");
	}
	return ALERT;
    }

    @Override
    public boolean valid() {
	if (isValid(oldPassword) && isValid(newPassword) && isValid(repeatPassword))
	{
	    if (newPassword.compareTo(repeatPassword) == 0) {
		alertMessage.setSimpleAlert("密码修改成功！");
		return true;
	    }
	    else{
		alertMessage.setSimpleAlert("您输入的两次密码不相同！");
		return false;
	    }
	}
	else
	{
	    alertMessage.setSimpleAlert("您输入的信息有误！");
	    return false;
	}
    }

    @Override
    public boolean hasAuth()
    {
	if (getCurrentUser().getAuth().getRole() == AuthEntity.USER_ROLE) 
	{
	    return false;
	}
	else 
	{
	    return true;
	}
    }
    
    @Override
    public boolean needLogin() {
	return true;
    }

    public String getOldPassword() {
	return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
	this.oldPassword = oldPassword;
    }

    public String getNewPassword() {
	return newPassword;
    }

    public void setNewPassword(String newPassword) {
	this.newPassword = newPassword;
    }

    public String getRepeatPassword() {
	return repeatPassword;
    }

    public void setRepeatPassword(String repeatPassword) {
	this.repeatPassword = repeatPassword;
    }

    public UserService getUserService() {
	return userService;
    }

    public void setUserService(UserService userService) {
	this.userService = userService;
    }
    
}
