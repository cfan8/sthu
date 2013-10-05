/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.UserEntity;
import cn.edu.tsinghua.sthu.service.UserService;
import cn.edu.tsinghua.sthu.message.ShowGroupHomeManageMessage;

/**
 *
 * @author s3
 */
public class ShowGroupHomeManageAction extends BaseAction{
    private Integer groupId;
    private String organizeName;
    private UserService userService;
    private ShowGroupHomeManageMessage showGroupHomeManageMessage;
    
    @Override
    public String onExecute() throws Exception {
        showGroupHomeManageMessage.setIntroduction(getUserService().getUserEntityById(getGroupId()).getIntroduction());
        showGroupHomeManageMessage.setGroupId(getGroupId());
        showGroupHomeManageMessage.setMainImg(userService.getUserEntityById(groupId).getMainImg());
        showGroupHomeManageMessage.setLogoImg(userService.getUserEntityById(groupId).getLogoImg());
        showGroupHomeManageMessage.setImages(userService.getImagesByGroupId(groupId));
        return SUCCESS;
    }
    
    @Override
    public boolean valid() {
        UserEntity user = getUserService().getUserEntityById(getGroupId());
        if(user == null){
            alertMessage.setSimpleAlert("该用户不存在！");
            return false;
        }
        if(user.getAuth().getRole() != AuthEntity.GROUP_ROLE){
            alertMessage.setSimpleAlert("非社团账户不开放浏览！");
            return false;
        }
        if(getCurrentUser().getID() != groupId){
            alertMessage.setSimpleAlert("权限错误！");
            return false;
        }
        return true;
    }

    @Override
    public boolean needLogin() {
        return false;
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
     * @return the organizeName
     */
    public String getOrganizeName() {
        return organizeName;
    }

    /**
     * @param organizeName the organizeName to set
     */
    public void setOrganizeName(String organizeName) {
        this.organizeName = organizeName;
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
     * @return the showGroupHomeManageMessage
     */
    public ShowGroupHomeManageMessage getShowGroupHomeManageMessage() {
        return showGroupHomeManageMessage;
    }

    /**
     * @param showGroupHomeManageMessage the showGroupHomeManageMessage to set
     */
    public void setShowGroupHomeManageMessage(ShowGroupHomeManageMessage showGroupHomeManageMessage) {
        this.showGroupHomeManageMessage = showGroupHomeManageMessage;
    }

    
}
