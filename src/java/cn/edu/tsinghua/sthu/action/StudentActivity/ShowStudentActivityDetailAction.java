/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action.StudentActivity;

import java.util.*;
import cn.edu.tsinghua.sthu.action.BaseAction;
import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity;
import cn.edu.tsinghua.sthu.entity.StudentApplyOptionsEntity;
import cn.edu.tsinghua.sthu.message.studentActivity.ShowStudentActivityDetailMessage;
import cn.edu.tsinghua.sthu.service.ApplyStudentActivityService;

/**
 *
 * @author xiaobo
 */
public class ShowStudentActivityDetailAction extends BaseAction{
    private Integer activityID;
    private StudentActivityApplyEntity activity;
    private ApplyStudentActivityService applyStudentActivityService;
    private ShowStudentActivityDetailMessage showStudentActivityDetailMessage;
    
    @Override
    public String onExecute() throws Exception {
        if(activity.getApplyStatus() == StudentActivityApplyEntity.APPLY_STATUS_ACCEPTED
                && activity.getOption().getPublicityFlag() == StudentApplyOptionsEntity.PUBLICITYFLAG_APPLY
                && activity.getPublishStatus() == StudentActivityApplyEntity.PUBLISH_STATUS_ACCEPTED
                && (getCurrentUser() == null ||activity.getApplyUserid() != getCurrentUser().getID())){
            applyStudentActivityService.addClickCount(activityID);
        }
        getShowStudentActivityDetailMessage().setShowFollow(1);
        if(getCurrentUser() != null){
            if(applyStudentActivityService.checkActivityFollowedByUser(getCurrentUser(), activity))
                getShowStudentActivityDetailMessage().setShowFollow(0);
            else
                getShowStudentActivityDetailMessage().setShowFollow(1);
            if(activity.getOption().getTicketFlag() == StudentApplyOptionsEntity.TICKETFLAG_APPLY){
                if((new Date()).before(activity.getOption().getTicketRandomDate())){
                    if(applyStudentActivityService.checkActivityTicketFollowedByUser(getCurrentUser(), activity)){
                        getShowStudentActivityDetailMessage().setShowTicket(2);
                    }else{
                        getShowStudentActivityDetailMessage().setShowTicket(1);
                    }
                }else{
                    getShowStudentActivityDetailMessage().setShowTicket(3);//抽票结束
                }
            }else{
                getShowStudentActivityDetailMessage().setShowTicket(0);//不抽票
            }
        }
        getShowStudentActivityDetailMessage().setFollowNumber(applyStudentActivityService.getFollowedNumberByActivityId(activityID));
        getShowStudentActivityDetailMessage().setActivity(activity);
        return SUCCESS;
    }

    @Override
    public boolean valid() {
        if(activityID == null){
            alertMessage.setSimpleAlert("参数错误！");
            return false;
        }
        activity = applyStudentActivityService.getStudentActivityApplyEntityById(activityID);
        if(activity == null){
            alertMessage.setSimpleAlert("参数错误！");
            return false;
        }
        if(activity.getApplyStatus() == StudentActivityApplyEntity.APPLY_STATUS_ACCEPTED
                && activity.getOption().getPublicityFlag() == StudentApplyOptionsEntity.PUBLICITYFLAG_APPLY
                && activity.getPublishStatus() == StudentActivityApplyEntity.PUBLISH_STATUS_ACCEPTED){
            return true;
        }
        else{
            if(activity.getApplyStatus() == StudentActivityApplyEntity.APPLY_STATUS_ACCEPTED
                    && activity.getOption().getPublicityFlag() == StudentApplyOptionsEntity.PUBLICITYFLAG_APPLY){
                if(getCurrentUser().getID() == activity.getApplyUserid() || getCurrentUser().getAuth().getOpPublishCode() != -1){
                    return true;
                } 
            }
            if(activity.getApplyStatus() != StudentActivityApplyEntity.ALLOCATE_STATUS_ACCEPTED && activity.getOption().getPublicityFlag() == StudentApplyOptionsEntity.PUBLICITYFLAG_APPLY){
                if(getCurrentUser().getID() == activity.getApplyUserid() || getCurrentUser().getAuth().getRole() == AuthEntity.ADMIN_ROLE){
                    return true;
                }
            }
        }
        return false;
    }

    @Override
    public boolean needLogin() {
        return false;
    }
    
    @Override 
    public boolean hasAuth(){
        return true;
    }

    /**
     * @return the activityID
     */
    public Integer getActivityID() {
        return activityID;
    }

    /**
     * @param activityID the activityID to set
     */
    public void setActivityID(Integer activityID) {
        this.activityID = activityID;
    }

    /**
     * @return the activity
     */
    public StudentActivityApplyEntity getActivity() {
        return activity;
    }

    /**
     * @param activity the activity to set
     */
    public void setActivity(StudentActivityApplyEntity activity) {
        this.activity = activity;
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
     * @return the showStudentActivityDetailMessage
     */
    public ShowStudentActivityDetailMessage getShowStudentActivityDetailMessage() {
        return showStudentActivityDetailMessage;
    }

    /**
     * @param showStudentActivityDetailMessage the showStudentActivityDetailMessage to set
     */
    public void setShowStudentActivityDetailMessage(ShowStudentActivityDetailMessage showStudentActivityDetailMessage) {
        this.showStudentActivityDetailMessage = showStudentActivityDetailMessage;
    }
    
}
