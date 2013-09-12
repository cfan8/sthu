/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity;
import cn.edu.tsinghua.sthu.message.UserHomeMessage;
import cn.edu.tsinghua.sthu.service.ApplyStudentActivityService;
import cn.edu.tsinghua.sthu.service.UserService;
import java.util.List;

/**
 *
 * @author xiaobo
 */
public class UserHomeAction extends BaseAction{

    private UserHomeMessage userHomeMessage;
    private ApplyStudentActivityService applyStudentActivityService;
    private UserService userService;
    @Override
    public String onExecute() throws Exception {
        getUserHomeMessage().setUsername(getCurrentUser().getNickname());
        getUserHomeMessage().setFollowActivityNumber(applyStudentActivityService.getFollowedActivityNumberByUser(getCurrentUser()));
        getUserHomeMessage().setApplyNum(applyStudentActivityService.getMyApplyTotalPageNumber(getCurrentUser().getID()));
        getUserHomeMessage().setInterestGroups(userService.getFollowGroupsByUserId(getCurrentUser().getID(), 5));
        getUserHomeMessage().setGroupsFollowNum(userService.getFollowedGroupsFollowNumbers(getUserHomeMessage().getInterestGroups()));
        List<StudentActivityApplyEntity> followActivities = applyStudentActivityService.getFollowActivitiesByUser(getCurrentUser());
        List<StudentActivityApplyEntity> followAndGroupActivities = applyStudentActivityService.getFollowAndGroupActivitiesByUser(getCurrentUser(), followActivities, userHomeMessage.getInterestGroups());
        getUserHomeMessage().setActivityInfo(applyStudentActivityService.getFollowActivityString(followAndGroupActivities));
        
        return SUCCESS;
    }

    @Override
    public boolean valid() {
        return true;
    }

    @Override
    public boolean needLogin() {
        return true;
    }
    
    @Override
    public boolean hasAuth(){
        if(getCurrentUser().getAuth().getRole() == AuthEntity.USER_ROLE){
            return true;
        }
        return false;
    }

    /**
     * @return the userHomeMessage
     */
    public UserHomeMessage getUserHomeMessage() {
        return userHomeMessage;
    }

    /**
     * @param userHomeMessage the userHomeMessage to set
     */
    public void setUserHomeMessage(UserHomeMessage userHomeMessage) {
        this.userHomeMessage = userHomeMessage;
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
}
