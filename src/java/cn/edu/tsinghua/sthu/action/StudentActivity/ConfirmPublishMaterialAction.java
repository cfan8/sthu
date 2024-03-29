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
public class ConfirmPublishMaterialAction extends BaseAction{

    private Integer applyId;
    private ApplyStudentActivityService applyStudentActivityService;
    private StudentActivityApplyEntity entity;
    
    @Override
    public String onExecute() throws Exception {
        applyStudentActivityService.confirmPublishMaterial(entity);
        alertMessage.setSimpleAlert("已确认学生清华发布材料，请耐心等待审批。", "showStudentActivityApply.do?applyId=" + getApplyId());
        return ALERT;
    }

    @Override
    public boolean hasAuth() {
        if (getEntity().getApplyUserid() != getCurrentUser().getID())
	{
	    return false;
	}
	else
	{
	    return true;
	}
    }
    
    @Override
    public boolean valid() {
       if (getApplyId() == null)
	{
	    alertMessage.setSimpleAlert("参数错误！");
	    return false;
	}
	setEntity(applyStudentActivityService.getStudentActivityApplyEntityById(getApplyId()));
	if (getEntity() == null)
	{
	    alertMessage.setSimpleAlert("参数错误！");
	    return false;
	}
	if (getEntity().getApplyStatus() != StudentActivityApplyEntity.APPLY_STATUS_ACCEPTED)
	{
	    alertMessage.setSimpleAlert("只能对确认的申请进行操作！");
	    return false;
	}
        if(getEntity().getOption().getPublicityFlag() == StudentApplyOptionsEntity.PUBLICITYFLAG_NOTAPPLY){
            alertMessage.setSimpleAlert("该活动未申请发布");
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
