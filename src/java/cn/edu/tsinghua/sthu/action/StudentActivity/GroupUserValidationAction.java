/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action.StudentActivity;

import cn.edu.tsinghua.sthu.action.BaseAction;
import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.service.UserService;
import cn.edu.tsinghua.sthu.entity.UserEntity;
import cn.edu.tsinghua.sthu.message.AlertMessage;
import cn.edu.tsinghua.sthu.message.studentActivity.ShowApplyStudentActivityPageMessage;

/**
 *
 * @author john
 */
public class GroupUserValidationAction extends BaseAction{
    public static final String RETURN_CREATE = "create";
    public static final String RETURN_FALSE = "false";
    private String username;
    private String password;
    private UserService userService;
    private ShowApplyStudentActivityPageMessage showApplyStudentActivityPageMessage;
    
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
    public String onExecute(){
        UserEntity entity;
        try {
	    entity = getUserService().userLogin(username, password);
	} catch (Exception ex) {
	    alertMessage.setAlertTitle("抱歉");
	    alertMessage.setAlertContent("抱歉，info登录接口出现故障，暂时无法登陆，请稍后再试。如无改善，请联系网站管理员");
	    alertMessage.setAlertType(AlertMessage.BOX_TYPE);
	    return ALERT;
        }
	if (entity != null) {
            getShowApplyStudentActivityPageMessage().setApplyUserNickname(getCurrentUser().getNickname());
            getShowApplyStudentActivityPageMessage().setApplyType(ShowApplyStudentActivityPageMessage.GROUP_APPLY);
	    return RETURN_CREATE;
	} else {
	    getAlertMessage().setAlertType(AlertMessage.BOX_TYPE);
	    getAlertMessage().setAlertTitle("用户名密码错误");
	    getAlertMessage().setAlertContent("请重新输入用户名密码！");
	    return ALERT;
	}
    }
    
    @Override
    public boolean valid(){
        return true;
    }
    
    @Override
    public boolean hasAuth(){
        if (getCurrentUser().getAuth().getRole() != AuthEntity.USER_ROLE && getCurrentUser().getAuth().getRole() != AuthEntity.GROUP_ROLE) {
	    return false;
	}else{
            return true;
        }
    }
    
    @Override
    public boolean needLogin(){
        return false;
    }

    /**
     * @return the userService
     */
    public UserService getUserService() {
        return userService;
    }

    /**
     * @param userService the userService to set
     */
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    /**
     * @return the showApplyStudentActivityPageMessage
     */
    public ShowApplyStudentActivityPageMessage getShowApplyStudentActivityPageMessage() {
        return showApplyStudentActivityPageMessage;
    }

    /**
     * @param showApplyStudentActivityPageMessage the showApplyStudentActivityPageMessage to set
     */
    public void setShowApplyStudentActivityPageMessage(ShowApplyStudentActivityPageMessage showApplyStudentActivityPageMessage) {
        this.showApplyStudentActivityPageMessage = showApplyStudentActivityPageMessage;
    }
}
