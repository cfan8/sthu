/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action.StudentActivity;

import cn.edu.tsinghua.sthu.action.BaseAction;
import cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity;
import cn.edu.tsinghua.sthu.entity.StudentApplyOptionsEntity;
import cn.edu.tsinghua.sthu.service.ApplyStudentActivityService;

/**
 *
 * @author xiaobo
 */
public class AddToDigestActivityAction extends BaseAction{

    private Integer activityId;
    private Integer type;
    private ApplyStudentActivityService applyStudentActivityService;
    private StudentActivityApplyEntity entity;
    
    @Override
    public String onExecute() throws Exception {
        if(type == 1){
            applyStudentActivityService.addToDigest(entity);
            alertMessage.setSimpleAlert("加精成功！");
        }
        else{
            applyStudentActivityService.cancelDigest(entity);
            alertMessage.setSimpleAlert("取消加精成功！");
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
	setEntity(getApplyStudentActivityService().getStudentActivityApplyEntityById(getActivityId()));
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
        if (getEntity().getPublishStatus() != StudentActivityApplyEntity.PUBLISH_STATUS_ACCEPTED)
	{
	    alertMessage.setSimpleAlert("参数错误！");
	    return false;
	}
        if (getEntity().getOption().getPublicityFlag() != StudentApplyOptionsEntity.PUBLICITYFLAG_APPLY)
	{
	    alertMessage.setSimpleAlert("参数错误！");
	    return false;
	}
        if(getType() != 0){
            if(getEntity().getOption().getDigestFlag() == StudentApplyOptionsEntity.DIGEST_ACTIVITY){
                alertMessage.setSimpleAlert("该活动已被加精！");
                return false;
            }
        }
        else{
            if(getEntity().getOption().getDigestFlag() == StudentApplyOptionsEntity.ORDINARY_ACTIVITY){
                alertMessage.setSimpleAlert("该活动尚未加精！");
                return false;
            }
        }
        return true;
    }

    @Override
    public boolean needLogin() {
        return true;
    }
    
    @Override
    public boolean hasAuth(){
        if(getCurrentUser().getAuth().getOpPublishCode() != -1){
            return true;
        }
        return false;
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
