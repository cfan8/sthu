/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.Util;
import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.service.UserService;

/**
 *
 * @author linangran
 */
public class SetUserAuthAction extends BaseAction{
    
    private int roletype = AuthEntity.USER_ROLE;
    private int opArticle = -1;
    private int opIdentityCode = -1;
    private int opResourceCode = -1;
    private int opAllocateCode = -1;
       
    private String verifyCode;
    private UserService userService;
    
    public int getRoletype() {
	return roletype;
    }

    public void setRoletype(int roletype) {
	this.roletype = roletype;
    }

    public int getOpArticle() {
	return opArticle;
    }

    public void setOpArticle(int opArticle) {
	this.opArticle = opArticle;
    }

    public int getOpIdentityCode() {
	return opIdentityCode;
    }

    public void setOpIdentityCode(int opIdentityCode) {
	this.opIdentityCode = opIdentityCode;
    }

    public int getOpResourceCode() {
	return opResourceCode;
    }

    public void setOpResourceCode(int opResourceCode) {
	this.opResourceCode = opResourceCode;
    }

    public int getOpAllocateCode() {
	return opAllocateCode;
    }

    public void setOpAllocateCode(int opAllocateCode) {
	this.opAllocateCode = opAllocateCode;
    }

    @Override
    public String onExecute() {
	AuthEntity authEntity = getCurrentUser().getAuth();
	authEntity.setRole(roletype);
	authEntity.setOpArticle(opArticle);
	authEntity.setOpAllocateCode(opAllocateCode);
	authEntity.setOpResourceCode(opResourceCode);
	authEntity.setOpIdentityCode(opIdentityCode);
	userService.updateUserEntity(getCurrentUser());
	alertMessage.setSimpleAlert("已成功更新用户权限");
	return ALERT;
    }

    @Override
    public boolean valid() {
	return true;
    }
    
    @Override
    public boolean hasAuth()
    {
	String output = Util.getMD5(getVerifyCode());
	if (output.compareToIgnoreCase("bfa0b2664bb685640b6c95325e839fd") == 0) {
	    return true;
	}
	else {
	    return false;
	}
    }
    
    public UserService getUserService() {
	return userService;
    }

    public void setUserService(UserService userService) {
	this.userService = userService;
    }

    @Override
    public boolean needLogin() {
	return true;
    }

    public String getVerifyCode() {
	return verifyCode;
    }

    public void setVerifyCode(String verifyCode) {
	this.verifyCode = verifyCode;
    }
}
