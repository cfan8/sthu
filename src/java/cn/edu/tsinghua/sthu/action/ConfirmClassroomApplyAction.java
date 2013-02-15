/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.entity.CRoomApplyEntity;
import cn.edu.tsinghua.sthu.service.ApplyClassroomService;

/**
 *
 * @author linangran
 */
public class ConfirmClassroomApplyAction extends BaseAction{

    public Integer getApplyId() {
	return applyId;
    }

    public void setApplyId(Integer applyId) {
	this.applyId = applyId;
    }

    public ApplyClassroomService getApplyClassroomService() {
	return applyClassroomService;
    }

    public void setApplyClassroomService(ApplyClassroomService applyClassroomService) {
	this.applyClassroomService = applyClassroomService;
    }

    private Integer applyId;
    private ApplyClassroomService applyClassroomService;
    private CRoomApplyEntity entity;

    public CRoomApplyEntity getEntity() {
	return entity;
    }

    public void setEntity(CRoomApplyEntity entity) {
	this.entity = entity;
    }
    
    
    @Override
    public String onExecute() {
	applyClassroomService.confirmApply(entity);
	alertMessage.setSimpleAlert("已确认申请，请耐心等待审批！", "showApply.do?applyId=" + applyId);
	return ALERT;
    }
    
    @Override
    public boolean hasAuth()
    {
	if (entity.getApplyUserid() != getCurrentUser().getID())
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
	if (applyId == null)
	{
	    alertMessage.setSimpleAlert("参数错误！");
	    return false;
	}
	entity = applyClassroomService.getCRoomApplyEntityById(applyId);
	if (entity == null)
	{
	    alertMessage.setSimpleAlert("参数错误！");
	    return false;
	}
	if (entity.getApplyStatus() != CRoomApplyEntity.APPLY_STATUS_UNCONFIRMED)
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
    
}
