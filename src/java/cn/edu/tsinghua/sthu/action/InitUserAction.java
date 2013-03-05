/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.Util;
import cn.edu.tsinghua.sthu.constant.AllocateMapping;
import cn.edu.tsinghua.sthu.constant.IdentityMapping;
import cn.edu.tsinghua.sthu.constant.ResourceMapping;
import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.UserEntity;
import cn.edu.tsinghua.sthu.message.InitMessage;
import cn.edu.tsinghua.sthu.service.UserService;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import sun.misc.Resource;

/**
 *
 * @author linangran
 */
public class InitUserAction extends BaseAction{

    private String verifyCode;
    private UserService userService;
    private InitMessage initMessage;
    
    @Override
    public String onExecute() {
	int count = 10;
	List<UserEntity> list = new ArrayList<UserEntity>();
	for (int i = 1; i < IdentityMapping.names.length; i++, count++)
	{
	    String password = getRandomString();
	    UserEntity entity = userService.addUserOrUpdatePassword("admin" + count, password, IdentityMapping.names[i]);
	    entity.getAuth().setRole(AuthEntity.ADMIN_ROLE);
	    entity.getAuth().setOpIdentityCode(i);
	    userService.updateUserEntity(entity);
	    entity.setPassword(password);
	    list.add(entity);
	}
	for (int i = 1; i < ResourceMapping.names.length; i++, count++)
	{
	    String password = getRandomString();
	    UserEntity entity = userService.addUserOrUpdatePassword("admin" + count, password, ResourceMapping.names[i]);
	    entity.getAuth().setRole(AuthEntity.ADMIN_ROLE);
	    entity.getAuth().setOpResourceCode(i);
	    userService.updateUserEntity(entity);
	    entity.setPassword(password);
	    list.add(entity);
	}
	for (int i = 1; i < AllocateMapping.names.length; i++, count++)
	{
	    String password = getRandomString();
	    UserEntity entity = userService.addUserOrUpdatePassword("admin" + count, password, AllocateMapping.names[i]);
	    entity.getAuth().setRole(AuthEntity.ADMIN_ROLE);
	    entity.getAuth().setOpAllocateCode(i);
	    userService.updateUserEntity(entity);
	    entity.setPassword(password);
	    list.add(entity);
	}
	getInitMessage().setList(list);
	return SUCCESS;
    }
    
    public String getRandomString()
    {
	String t = "abcdefghijklmnopqrstuvwxyz";
	StringBuffer buffer = new StringBuffer();
	Random random = new Random();
	for (int i = 0; i < 8; i++)
	{
	    buffer.append(t.charAt(random.nextInt(t.length())));
	}
	return buffer.toString();
    }

    @Override
    public boolean hasAuth()
    {
	String output = Util.getMD5(verifyCode);
	if (output.compareToIgnoreCase("bfa0b2664bb685640b6c95325e839fd") == 0) {
	    return true;
	}
	else {
	    return false;
	}
    }
    
    @Override
    public boolean valid() {
	return isValid(verifyCode);
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

    public UserService getUserService() {
	return userService;
    }

    public void setUserService(UserService userService) {
	this.userService = userService;
    }

    public InitMessage getInitMessage() {
	return initMessage;
    }

    public void setInitMessage(InitMessage initMessage) {
	this.initMessage = initMessage;
    }
    
}
