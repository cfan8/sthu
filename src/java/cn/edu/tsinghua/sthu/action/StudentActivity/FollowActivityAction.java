/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action.StudentActivity;

import cn.edu.tsinghua.sthu.action.BaseAction;
import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity;
import cn.edu.tsinghua.sthu.entity.UserEntity;
import cn.edu.tsinghua.sthu.service.ApplyStudentActivityService;

/**
 *
 * @author user
 */
public class FollowActivityAction extends BaseAction{
    private Integer activityId;
    private Integer type;
    private ApplyStudentActivityService applyStudentActivityService;
    private StudentActivityApplyEntity entity;
    
    @Override
    public String onExecute() throws Exception {
        if(type != 0){
            if(applyStudentActivityService.followActivityByUser(getCurrentUser(), getEntity()) != null)
                alertMessage.setSimpleAlert("关注成功");
            else
                alertMessage.setSimpleAlert("关注失败");
        }
        else{
            if(applyStudentActivityService.unFollowActivityByUser(getCurrentUser(), getEntity()) != null)
                alertMessage.setSimpleAlert("取消成功");
            else
                alertMessage.setSimpleAlert("取消失败");
        }
        return ALERT;
    }

    @Override
    public boolean valid() {
        if(getType() == null){
            alertMessage.setSimpleAlert("参数错误！");
            return false;
        }
        if (getActivityId() == null)
	{
	    alertMessage.setSimpleAlert("参数错误！");
	    return false;
	}
	setEntity(applyStudentActivityService.getStudentActivityApplyEntityById(getActivityId()));
	if (getEntity() == null)
	{
	    alertMessage.setSimpleAlert("参数错误！");
	    return false;
	}
	if (getEntity().getApplyStatus() != StudentActivityApplyEntity.APPLY_STATUS_ACCEPTED)
	{
	    alertMessage.setSimpleAlert("参数错误！");
	    return false;
	}
        if(getType() != 0){
            if(applyStudentActivityService.checkActivityFollowedByUser(getCurrentUser(), entity)){
                alertMessage.setSimpleAlert("您已经关注了该活动！");
                return false;
            }
        }
        else{
            if(!applyStudentActivityService.checkActivityFollowedByUser(getCurrentUser(), entity)){
                alertMessage.setSimpleAlert("您未关注该活动！");
                return false;
            }
        }
        
	return true;
    }

    @Override
    public boolean hasAuth(){
        if(getCurrentUser().getAuth().getRole() != AuthEntity.USER_ROLE)
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
    
}