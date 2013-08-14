/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.UserEntity;
import cn.edu.tsinghua.sthu.message.ShowGroupHomeMessage;
import cn.edu.tsinghua.sthu.service.ApplyStudentActivityService;
import cn.edu.tsinghua.sthu.service.UserService;

/**
 *
 * @author xiaobo
 */
public class ShowGroupHomeAction extends BaseAction{
    private Integer groupId;
    private UserService userService;
    private ApplyStudentActivityService applyStudentActivityService;
    private ShowGroupHomeMessage showGroupHomeMessage;
    
    @Override
    public String onExecute() throws Exception {
        if(getCurrentUser() == null || getCurrentUser().getAuth().getRole() != AuthEntity.USER_ROLE){
            getShowGroupHomeMessage().setShowFollow(0);
            getShowGroupHomeMessage().setIsGroupFollowed(0);
        }
        else{
            getShowGroupHomeMessage().setShowFollow(1);
            if(userService.checkGroupFollowedByUser(getCurrentUser(), userService.getUserEntityById(groupId))){
                getShowGroupHomeMessage().setIsGroupFollowed(1);
            }
            else{
                getShowGroupHomeMessage().setIsGroupFollowed(0);
            }
        }
        showGroupHomeMessage.setGroupId(groupId);
        showGroupHomeMessage.setTotalPageNumber(applyStudentActivityService.getAcceptedPublicActivitiesTotalPageNumberByUserId(5, groupId));
        return SUCCESS;
    }

    @Override
    public boolean valid() {
        UserEntity user = userService.getUserEntityById(groupId);
        if(user == null){
            alertMessage.setSimpleAlert("该用户不存在！");
            return false;
        }
        if(user.getAuth().getRole() != AuthEntity.GROUP_ROLE){
            alertMessage.setSimpleAlert("非社团账户不开放浏览！");
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
     * @return the applyStudentActivityService
     */
    public ApplyStudentActivityService getApplyStudentActivityService() {
        return applyStudentActivityService;
    }

    /**
     * @param applyStudentActivityService the applyStudentActivityService to set
     */
    public void setApplyStudentActivityService(ApplyStudentActivityService applyStudentActivityService) {
        this.applyStudentActivityService = applyStudentActivityService;
    }

    /**
     * @return the showGroupHomeMessage
     */
    public ShowGroupHomeMessage getShowGroupHomeMessage() {
        return showGroupHomeMessage;
    }

    /**
     * @param showGroupHomeMessage the showGroupHomeMessage to set
     */
    public void setShowGroupHomeMessage(ShowGroupHomeMessage showGroupHomeMessage) {
        this.showGroupHomeMessage = showGroupHomeMessage;
    }
    
}
