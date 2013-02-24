/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action.outdoor;

import cn.edu.tsinghua.sthu.action.BaseAction;
import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.ActivityApplyEntity;
import cn.edu.tsinghua.sthu.message.outdoor.ShowActivityApplyMessage;
import cn.edu.tsinghua.sthu.service.ApplyActivityService;
/**
 *
 * @author elsie
 */
public class SaveActivityCommentAction extends BaseAction{
    
    private ApplyActivityService applyActivityService;
    private Integer applyId;
    private Boolean isApprove;
    private String comment;
    private Integer type;
    
    private ActivityApplyEntity entity;
    
    @Override
    public String onExecute() {
	applyActivityService.processComment(entity, isApprove, comment, type, getCurrentUser().getNickname(), getCurrentUser().getID());
	if (isApprove)
	{
	    alertMessage.setSimpleAlert("已通过审批！");
	}
	else
	{
	    alertMessage.setSimpleAlert("已驳回审批！");
	}
	return ALERT;
    }

    @Override
    public boolean hasAuth()
    {
	if (getCurrentUser().getAuth().getRole() != AuthEntity.ADMIN_ROLE) {
	    return false;
	}
	entity = applyActivityService.getActivityApplyEntityById(applyId);
	if (entity == null)
	{
	    return false;
	}
	if (type == ShowActivityApplyMessage.APPROVE_TYPE_IDENTITY && entity.getIdentityStatus() == ActivityApplyEntity.IDENTITY_STATUS_TODO
		&& getCurrentUser().getAuth().getOpIdentityCode() == entity.getIdentityType())
	{
	    return true;
	}
	else if (type == ShowActivityApplyMessage.APPROVE_TYPE_RESOURCE && entity.getResourceStatus() == ActivityApplyEntity.RESOURCE_STATUS_TODO
		&& getCurrentUser().getAuth().getOpResourceCode() == entity.getResourceType())
	{
	    return true;
	}
	
	return false;
    }
    
    @Override
    public boolean valid() {
	if (applyId == null || isApprove == null || comment == null || type == null)
	{
	    alertMessage.setSimpleAlert("请选择是否同意申请并填写审批意见！");
	    return false;
	}
	else
	{
	    return true;
	}
    }

    @Override
    public boolean needLogin() {
	return true;
    }

    public Integer getApplyId() {
	return applyId;
    }

    public void setApplyId(Integer applyId) {
	this.applyId = applyId;
    }

    public Boolean getIsApprove() {
	return isApprove;
    }

    public void setIsApprove(Boolean isApprove) {
	this.isApprove = isApprove;
    }

    public String getComment() {
	return comment;
    }

    public void setComment(String comment) {
	this.comment = comment;
    }

    public Integer getType() {
	return type;
    }

    public void setType(Integer type) {
	this.type = type;
    }

    public ApplyActivityService getApplyActivityService() {
	return applyActivityService;
    }

    public void setApplyActivityService(ApplyActivityService applyActivityService) {
	this.applyActivityService = applyActivityService;
    }
    
}
