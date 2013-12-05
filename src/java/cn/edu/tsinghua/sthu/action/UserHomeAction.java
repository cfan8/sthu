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
import cn.edu.tsinghua.sthu.entity.FollowEntity;
import cn.edu.tsinghua.sthu.message.AlertMessage;
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
        if(getCurrentUser().getAuth().getRole() == AuthEntity.GROUP_ROLE){
            alertMessage.setNoAlert(1);
            //alertMessage.setAlertTitle("新版学生清华");
            //alertMessage.setAlertContent("点此进入社团主页");
            //alertMessage.setAlertType(AlertMessage.BOX_TYPE);
            alertMessage.setRedirectURL("showGroupHome.do?groupId="+getCurrentUser().getID());
            return ALERT;
        }
        else if(getCurrentUser().getAuth().getRole() == AuthEntity.ADMIN_ROLE){
            alertMessage.setNoAlert(1);
            //alertMessage.setAlertTitle("管理员个人主页仍为旧版");
            //alertMessage.setAlertContent("点此进入学清管理页面");
            //alertMessage.setAlertType(AlertMessage.BOX_TYPE);
            alertMessage.setRedirectURL("mysthu.do");
            return ALERT;
        }
        getUserHomeMessage().setUsername(getCurrentUser().getNickname());
        getUserHomeMessage().setFollowActivityNumber(applyStudentActivityService.getFollowedActivityNumberByUser(getCurrentUser()));
        getUserHomeMessage().setApplyNum(applyStudentActivityService.getMyApplyTotalPageNumber(getCurrentUser().getID()));
        getUserHomeMessage().setInterestGroups(userService.getFollowGroupsByUserId(getCurrentUser().getID(), 3));
        getUserHomeMessage().setGroupsFollowNum(userService.getFollowedGroupsFollowNumbers(getUserHomeMessage().getInterestGroups()));
        List<StudentActivityApplyEntity> followActivities = applyStudentActivityService.getFollowActivitiesByUser(getCurrentUser());
        List<StudentActivityApplyEntity> followAndGroupActivities = applyStudentActivityService.getFollowAndGroupActivitiesByUser(getCurrentUser(), followActivities, userHomeMessage.getInterestGroups());
        getUserHomeMessage().setActivityInfo(applyStudentActivityService.getFollowActivityString(followAndGroupActivities));
        List<FollowEntity> followTicketList = applyStudentActivityService.getFollowTicketsByUser(getCurrentUser());
        getUserHomeMessage().setTicketList(followTicketList);
        List<StudentActivityApplyEntity> ticketApplyList = applyStudentActivityService.getTicketFollowActivitiesByUser(getCurrentUser());
        getUserHomeMessage().setTicketApplyList(ticketApplyList);
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
        return true;
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
