/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action.outdoor;

import cn.edu.tsinghua.sthu.action.BaseAction;
import cn.edu.tsinghua.sthu.entity.ActivityApplyEntity;
import cn.edu.tsinghua.sthu.service.ApplyActivityService;

/**
 *
 * @author luzhen
 */
public class ConfirmOutdoorApplyAction extends BaseAction {
    private Integer applyId;
    private ApplyActivityService applyActivityService;
    private ActivityApplyEntity entity;
    
    @Override
    public String onExecute() {
	applyActivityService.confirmApply(getEntity());
	alertMessage.setSimpleAlert("已确认申请，请耐心等待审批！", "showActivityApply.do?applyId=" + getApplyId());
	return ALERT;
    }
    
    @Override
    public boolean hasAuth()
    {
	if (getEntity().getApplyUserID() != getCurrentUser().getID())
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
	setEntity(applyActivityService.getActivityApplyEntityById(getApplyId()));
	if (getEntity() == null)
	{
	    alertMessage.setSimpleAlert("参数错误！");
	    return false;
	}
	if (getEntity().getApplyStatus() != ActivityApplyEntity.APPLY_STATUS_UNCONFIRMED)
	{
	    alertMessage.setSimpleAlert("只能对未确认的申请进行操作！如果您的申请被驳回，请修改后再确认！");
	    return false;
	}
	return true;
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

    public ApplyActivityService getApplyActivityService() {
        return applyActivityService;
    }

    public void setApplyActivityService(ApplyActivityService applyActivityService) {
        this.applyActivityService = applyActivityService;
    }

    public ActivityApplyEntity getEntity() {
        return entity;
    }

    public void setEntity(ActivityApplyEntity entity) {
        this.entity = entity;
    }
    
}
