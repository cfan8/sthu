/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action.StudentActivity;

import cn.edu.tsinghua.sthu.action.BaseAction;
import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity;
import cn.edu.tsinghua.sthu.entity.StudentApplyOptionsEntity;
import cn.edu.tsinghua.sthu.message.studentActivity.ShowStudentActivityApplyMessage;
import cn.edu.tsinghua.sthu.service.ApplyStudentActivityService;
import cn.edu.tsinghua.sthu.service.StudentApplyOptionsService;
import java.util.Date;

/**
 *
 * @author xiaobo
 */
public class ShowStudentActivityApplyAction extends BaseAction{
    private Integer applyId;
    private ApplyStudentActivityService applyStudentActivityService;
    private StudentApplyOptionsService studentApplyOptionsService;
    private ShowStudentActivityApplyMessage showStudentActivityApplyMessage;
    
    @Override
    public String onExecute() throws Exception {
        StudentActivityApplyEntity entity = getApplyStudentActivityService().getStudentActivityApplyEntityById(getApplyId());
        StudentApplyOptionsEntity options = entity.getOption();
	if (entity == null) {
	    alertMessage.setSimpleAlert("指定的申请不存在！");
	    return ALERT;
	} else {
	    showStudentActivityApplyMessage.setApplyEntity(entity);
            showStudentActivityApplyMessage.setOptionsEntity(options);
            showStudentActivityApplyMessage.setIdentityAuth(getCurrentUser().getAuth().getOpIdentityCode());
            showStudentActivityApplyMessage.setOtherApproveString(getApplyStudentActivityService().getOtherApproveStatusString(entity));
	    if (getCurrentUser().getID() == showStudentActivityApplyMessage.getApplyEntity().getApplyUserid()
		    && (showStudentActivityApplyMessage.getApplyEntity().getApplyStatus() == StudentActivityApplyEntity.APPLY_STATUS_UNCONFIRMED
		    || showStudentActivityApplyMessage.getApplyEntity().getApplyStatus() == StudentActivityApplyEntity.APPLY_STATUS_REJECTED)) {
		showStudentActivityApplyMessage.setShowConfirm(true);
	    } else {
		showStudentActivityApplyMessage.setShowConfirm(false);
	    }
            if(getCurrentUser().getID() == showStudentActivityApplyMessage.getApplyEntity().getApplyUserid()
                    && showStudentActivityApplyMessage.getApplyEntity().getApplyStatus() == StudentActivityApplyEntity.APPLY_STATUS_ACCEPTED
                    && showStudentActivityApplyMessage.getApplyEntity().getOption().getPublicityFlag() == StudentApplyOptionsEntity.PUBLICITYFLAG_APPLY){
                showStudentActivityApplyMessage.setShowPublishEdit(true);
            }
            else{
                showStudentActivityApplyMessage.setShowPublishEdit(false);
            }
            if((getCurrentUser().getID() == showStudentActivityApplyMessage.getApplyEntity().getApplyUserid() && entity.getApplyStatus() == StudentActivityApplyEntity.APPLY_STATUS_CONFIRMED)
                    || getCurrentUser().getAuth().getOpGroupCode() != -1){
                showStudentActivityApplyMessage.setShowCancel(true);
                if(getCurrentUser().getID() == showStudentActivityApplyMessage.getApplyEntity().getApplyUserid()){
                    if(showStudentActivityApplyMessage.getApplyEntity().getGroupStatus() != StudentActivityApplyEntity.GROUP_STATUS_AWAIT
                            && showStudentActivityApplyMessage.getApplyEntity().getGroupStatus() != StudentActivityApplyEntity.GROUP_STATUS_TODO)
                        showStudentActivityApplyMessage.setShowCancel(false);
                }
            }else{
                showStudentActivityApplyMessage.setShowCancel(false);
            }
            if(entity.getIdentityStatus() == StudentActivityApplyEntity.IDENTITY_STATUS_ACCEPTED
                    && getCurrentUser().getAuth().getOpGroupCode() != -1){
                showStudentActivityApplyMessage.setShowModify(true);
            }else{
                showStudentActivityApplyMessage.setShowModify(false);
            }
	    if (getCurrentUser().getAuth().getRole() == AuthEntity.ADMIN_ROLE) {
		if (entity.getApplyStatus() == StudentActivityApplyEntity.APPLY_STATUS_CONFIRMED && entity.getIdentityStatus() == StudentActivityApplyEntity.IDENTITY_STATUS_TODO
			&& getCurrentUser().getAuth().getOpIdentityCode() == entity.getIdentityType()) {
		    showStudentActivityApplyMessage.setApproveType(showStudentActivityApplyMessage.APPROVE_TYPE_IDENTITY);
		    showStudentActivityApplyMessage.setShowApprove(true);
//		} else if (entity.getResourceStatus() == ActivityApplyEntity.RESOURCE_STATUS_TODO
//			&& getCurrentUser().getAuth().getOpResourceCode() == entity.getResourceType()) {
//		    showStudentActivityApplyMessage.setApproveType(showStudentActivityApplyMessage.APPROVE_TYPE_RESOURCE);
//		    showStudentActivityApplyMessage.setShowApprove(true);
		}
                else if(entity.getGroupStatus() == StudentActivityApplyEntity.GROUP_STATUS_TODO
                        && getCurrentUser().getAuth().getOpGroupCode() == entity.getGroupType()){
                    showStudentActivityApplyMessage.setApproveType(showStudentActivityApplyMessage.APPROVE_TYPE_GROUP);
                    showStudentActivityApplyMessage.setShowApprove(true);
                }
                else if(entity.getPublishStatus() == StudentActivityApplyEntity.PUBLISH_STATUS_TODO
                        && getCurrentUser().getAuth().getOpPublishCode() == entity.getPublishType()){
                    showStudentActivityApplyMessage.setApproveType(showStudentActivityApplyMessage.APPROVE_TYPE_PUBLISH);
                    showStudentActivityApplyMessage.setShowApprove(true);
                }
                else if(entity.getResourceStatus() == StudentActivityApplyEntity.RESOURCE_STATUS_TODO){
                    if(applyStudentActivityService.isUserApproveResourceStatusToDo(entity.getID(), getCurrentUser().getID())){
                        showStudentActivityApplyMessage.setApproveType(showStudentActivityApplyMessage.APPROVE_TYPE_RESOURCE);
                        showStudentActivityApplyMessage.setShowApprove(true);
                    }
                }
                else if(entity.getAllocateStatus() == StudentActivityApplyEntity.ALLOCATE_STATUS_TODO){
                    if(applyStudentActivityService.isUserApproveAllocateStatusToDo(entity.getID(), getCurrentUser().getID())){
                        showStudentActivityApplyMessage.setApproveType(showStudentActivityApplyMessage.APPROVE_TYPE_ALLOCATE);
                        showStudentActivityApplyMessage.setShowApprove(true);
                    }
                }
                else {
		    showStudentActivityApplyMessage.setShowApprove(false);
		}
	    } else {
		showStudentActivityApplyMessage.setShowApprove(false);
	    }
            showStudentActivityApplyMessage.setDigestButtonStatus(ShowStudentActivityApplyMessage.DIGEST_BUTTON_HIDE);
            if(getCurrentUser().getAuth().getOpPublishCode() != -1 && entity.getApplyStatus() == StudentActivityApplyEntity.APPLY_STATUS_ACCEPTED
                    && entity.getPublishStatus() == StudentActivityApplyEntity.PUBLISH_STATUS_ACCEPTED && entity.getOption().getPublicityFlag() == StudentApplyOptionsEntity.PUBLICITYFLAG_APPLY){
                if(entity.getOption().getDigestFlag() == StudentApplyOptionsEntity.DIGEST_ACTIVITY){
                    showStudentActivityApplyMessage.setDigestButtonStatus(ShowStudentActivityApplyMessage.CANCEL_DIGEST_BUTTON_SHOW);
                }
                else{
                    showStudentActivityApplyMessage.setDigestButtonStatus(ShowStudentActivityApplyMessage.DIGEST_BUTTON_SHOW);
                }
            }
            if(getCurrentUser().getID() == showStudentActivityApplyMessage.getApplyEntity().getApplyUserid()){
                if(showStudentActivityApplyMessage.getApplyEntity().getOption().getTicketRandomDate() == null ||(new Date()).before(showStudentActivityApplyMessage.getApplyEntity().getOption().getTicketRandomDate())){
                        showStudentActivityApplyMessage.setShowTicket(0);//申请者不抽票
                    }else{
                        if(showStudentActivityApplyMessage.getApplyEntity().getOption().getTicketStatus() == StudentApplyOptionsEntity.TICKET_UNSELECTED){
                            showStudentActivityApplyMessage.setShowTicket(1);//申请者抽票
                        }else{
                            showStudentActivityApplyMessage.setShowTicket(2);//抽票结束
                        }     
                    }
            }
	    return SUCCESS;
	}
    }
    
    @Override
    public boolean hasAuth(){
        if(getCurrentUser().getAuth().getRole() == AuthEntity.ADMIN_ROLE)
            return true;
        else{
            StudentActivityApplyEntity entity = getApplyStudentActivityService().getStudentActivityApplyEntityById(getApplyId());
            if (entity == null || entity.getApplyUserid() != getCurrentUser().getID()) {
		return false;
	    } else {
		return true;
	    }
        }
    }
    
    @Override
    public boolean valid() {
        if (getApplyId() == null) {
	    alertMessage.setSimpleAlert("参数有误！");
	    return false;
	}
	return true;
    }

    @Override
    public boolean needLogin() {
       return true;
    }

    /**
     * @return the applyId
     */
    public Integer getApplyId() {
        return applyId;
    }

    /**
     * @param applyId the applyId to set
     */
    public void setApplyId(Integer applyId) {
        this.applyId = applyId;
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
     * @return the showStudentActivityApplyMessage
     */
    public ShowStudentActivityApplyMessage getShowStudentActivityApplyMessage() {
        return showStudentActivityApplyMessage;
    }

    /**
     * @param showStudentActivityApplyMessage the showStudentActivityApplyMessage to set
     */
    public void setShowStudentActivityApplyMessage(ShowStudentActivityApplyMessage showStudentActivityApplyMessage) {
        this.showStudentActivityApplyMessage = showStudentActivityApplyMessage;
    }

    /**
     * @return the studentApplyOptionsService
     */
    public StudentApplyOptionsService getStudentApplyOptionsService() {
        return studentApplyOptionsService;
    }

    /**
     * @param studentApplyOptionsService the studentApplyOptionsService to set
     */
    public void setStudentApplyOptionsService(StudentApplyOptionsService studentApplyOptionsService) {
        this.studentApplyOptionsService = studentApplyOptionsService;
    }
}
