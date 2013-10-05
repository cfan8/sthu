/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action.StudentActivity;

import cn.edu.tsinghua.sthu.action.BaseAction;
import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity;
import cn.edu.tsinghua.sthu.entity.StudentApplyOptionsEntity;
import cn.edu.tsinghua.sthu.entity.UserEntity;
import cn.edu.tsinghua.sthu.message.studentActivity.ShowTicketRandomResultMessage;
import cn.edu.tsinghua.sthu.service.ApplyStudentActivityService;
import java.util.List;

/**
 *
 * @author xiaoyou
 */
public class ShowTicketRandomResultAction extends BaseAction{
    private Integer activityID;
    private StudentActivityApplyEntity activity;
    private ApplyStudentActivityService applyStudentActivityService;
    private ShowTicketRandomResultMessage showTicketRandomResultMessage;
    
    @Override
    public String onExecute() throws Exception {
   //     applyStudentActivityService.randomTickets(activityID);
        List<UserEntity> resultList = applyStudentActivityService.getTicketRandomResult(activityID);
        showTicketRandomResultMessage.setResultList(resultList);
        return SUCCESS;
    }
    
    @Override
    public boolean valid() {
        if(getActivityID() == null){
            alertMessage.setSimpleAlert("参数错误！");
            return false;
        }
        setActivity(getApplyStudentActivityService().getStudentActivityApplyEntityById(getActivityID()));
        if(getActivity() == null){
            alertMessage.setSimpleAlert("参数错误！");
            return false;
        }
        if(getActivity().getApplyStatus() == StudentActivityApplyEntity.APPLY_STATUS_ACCEPTED
                && getActivity().getOption().getPublicityFlag() == StudentApplyOptionsEntity.PUBLICITYFLAG_APPLY
                && getActivity().getPublishStatus() == StudentActivityApplyEntity.PUBLISH_STATUS_ACCEPTED){
            return true;
        }
        else{
            if(getActivity().getApplyStatus() == StudentActivityApplyEntity.APPLY_STATUS_ACCEPTED
                    && getActivity().getOption().getPublicityFlag() == StudentApplyOptionsEntity.PUBLICITYFLAG_APPLY){
                if(getCurrentUser().getID() == getActivity().getApplyUserid() || getCurrentUser().getAuth().getOpPublishCode() != -1){
                    return true;
                } 
            }
            if(getActivity().getApplyStatus() != StudentActivityApplyEntity.ALLOCATE_STATUS_ACCEPTED && getActivity().getOption().getPublicityFlag() == StudentApplyOptionsEntity.PUBLICITYFLAG_APPLY){
                if(getCurrentUser().getID() == getActivity().getApplyUserid() || getCurrentUser().getAuth().getRole() == AuthEntity.ADMIN_ROLE){
                    return true;
                }
            }
        }
        return false;
    }

    @Override
    public boolean needLogin() {
        return true;
    }
    
    @Override 
    public boolean hasAuth(){
        if(getCurrentUser().getID() == getActivity().getApplyUserid())
            return true;
           
        return false;
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
     * @return the showTicketRandomResultMessage
     */
    public ShowTicketRandomResultMessage getShowTicketRandomResultMessage() {
        return showTicketRandomResultMessage;
    }

    /**
     * @param showTicketRandomResultMessage the showTicketRandomResultMessage to set
     */
    public void setShowTicketRandomResultMessage(ShowTicketRandomResultMessage showTicketRandomResultMessage) {
        this.showTicketRandomResultMessage = showTicketRandomResultMessage;
    }
}
