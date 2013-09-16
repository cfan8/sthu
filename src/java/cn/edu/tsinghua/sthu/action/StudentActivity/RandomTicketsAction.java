/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action.StudentActivity;

import cn.edu.tsinghua.sthu.action.BaseAction;
import static cn.edu.tsinghua.sthu.action.BaseAction.ALERT;
import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity;
import cn.edu.tsinghua.sthu.entity.StudentApplyOptionsEntity;
import cn.edu.tsinghua.sthu.service.ApplyStudentActivityService;

/**
 *
 * @author xiaoyou
 */
public class RandomTicketsAction extends BaseAction{
    private Integer activityId;
    private ApplyStudentActivityService applyStudentActivityService;
    private StudentActivityApplyEntity entity;
    
    @Override
    public String onExecute() throws Exception {
        applyStudentActivityService.randomTickets(activityId);
        alertMessage.setSimpleAlert("抽票成功");
        return ALERT;
    }
    
    @Override
    public boolean valid() {
        if (getActivityId() == null)
	{
	    alertMessage.setSimpleAlert("参数错误！");
	    return false;
	}
	setEntity(getApplyStudentActivityService().getStudentActivityApplyEntityById(getActivityId()));
	if (getEntity() == null || getEntity().getOption().getPublicityFlag() == StudentApplyOptionsEntity.PUBLICITYFLAG_NOTAPPLY)
	{
	    alertMessage.setSimpleAlert("参数错误！");
	    return false;
	}
	if (getEntity().getApplyStatus() != StudentActivityApplyEntity.APPLY_STATUS_ACCEPTED)
	{
	    alertMessage.setSimpleAlert("活动尚未批准！");
	    return false;
	}
        if(getEntity().getPublishStatus() != StudentActivityApplyEntity.PUBLISH_STATUS_ACCEPTED){
            alertMessage.setSimpleAlert("活动尚未发布！");
	    return false;
        }
        else{
            if(getEntity().getOption().getApplyUserid() != getCurrentUser().getID()){
                alertMessage.setSimpleAlert("您不是该活动的主办方！");
                return false;
            }
        }
        if(getEntity().getOption().getTicketStatus() == StudentApplyOptionsEntity.TICKET_SELECTED){
            alertMessage.setSimpleAlert("抽票已完成，不能重复抽票！");
            return false;
        }
	return true;
    }

    @Override
    public boolean hasAuth(){
        if(getCurrentUser().getAuth().getRole() != AuthEntity.GROUP_ROLE)
            return false;
        return true;
    }
    
    @Override
    public boolean needLogin() {
        return true;
    }

    /**
     * @return the activityId
     */
    public Integer getActivityId() {
        return activityId;
    }

    /**
     * @param activityId the activityId to set
     */
    public void setActivityId(Integer activityId) {
        this.activityId = activityId;
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
     * @return the entity
     */
    public StudentActivityApplyEntity getEntity() {
        return entity;
    }

    /**
     * @param entity the entity to set
     */
    public void setEntity(StudentActivityApplyEntity entity) {
        this.entity = entity;
    }
}
