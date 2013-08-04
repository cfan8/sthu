/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.message.HomeMessage;

/**
 *
 * @author linangran
 */
public class ShowHomeAction extends BaseAction{

    public static String USER_HOME = "user_home";
    public static String ADMIN_HOME = "admin_home";
    
    private HomeMessage homeMessage;
    
    @Override
    public String onExecute() {
	if (getCurrentUser().getAuth().getRole() == AuthEntity.USER_ROLE || getCurrentUser().getAuth().getRole() == AuthEntity.GROUP_ROLE)
	{
	    return USER_HOME;
	}
	else
	{
	    homeMessage.setAuth(getCurrentUser().getAuth());
	    return ADMIN_HOME;
	}
    }

    @Override
    public boolean valid() {
	return true;
    }

    @Override
    public boolean needLogin() {
	return true;
    }

    public HomeMessage getHomeMessage() {
	return homeMessage;
    }

    public void setHomeMessage(HomeMessage homeMessage) {
	this.homeMessage = homeMessage;
    }
    
}
