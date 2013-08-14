/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.UserEntity;
import cn.edu.tsinghua.sthu.service.UserService;

/**
 *
 * @author user
 */
public class FollowGroupAction extends BaseAction{
    private Integer type;
    private Integer groupId;
    private UserService userService;
    private UserEntity entity;

    @Override
    public String onExecute() throws Exception {
        if(type != 0){
            if(userService.followGroup(getCurrentUser(), entity) != null)
                alertMessage.setSimpleAlert("关注成功");
            else
                alertMessage.setSimpleAlert("关注失败");
        }
        else{
            if(userService.unfollowGroup(getCurrentUser(), getEntity()) != null)
                alertMessage.setSimpleAlert("取消成功");
            else
                alertMessage.setSimpleAlert("取消失败");
        }
        return ALERT;
    }

    @Override
    public boolean hasAuth(){
        if(getCurrentUser().getAuth().getRole() != AuthEntity.USER_ROLE)
            return false;
        return true;
    }
    
    @Override
    public boolean valid() {
        if(getType() == null){
            alertMessage.setSimpleAlert("参数错误！");
            return false;
        }
        if (getGroupId() == null)
	{
	    alertMessage.setSimpleAlert("参数错误！");
	    return false;
	}
        setEntity(userService.getUserEntityById(groupId));
        if (getEntity() == null)
	{
	    alertMessage.setSimpleAlert("参数错误！");
	    return false;
	}
        if(getEntity().getAuth().getRole() != AuthEntity.GROUP_ROLE){
            alertMessage.setSimpleAlert("参数错误！");
	    return false;
        }
        if(getType() != 0){
            if(userService.checkGroupFollowedByUser(getCurrentUser(), entity)){
                alertMessage.setSimpleAlert("您已经关注了该社团！");
                return false;
            }
        }
        else{
            if(!userService.checkGroupFollowedByUser(getCurrentUser(), entity)){
                alertMessage.setSimpleAlert("您未关注该社团！");
                return false;
            }
        }
        return true;
    }

    @Override
    public boolean needLogin() {
        return true;
    }

    /**
     * @return the type
     */
    public Integer getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(Integer type) {
        this.type = type;
    }

    /**
     * @return the groupId
     */
    public Integer getGroupId() {
        return groupId;
    }

    /**
     * @param groupId the groupId to set
     */
    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
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
     * @return the entity
     */
    public UserEntity getEntity() {
        return entity;
    }

    /**
     * @param entity the entity to set
     */
    public void setEntity(UserEntity entity) {
        this.entity = entity;
    }
    
}
