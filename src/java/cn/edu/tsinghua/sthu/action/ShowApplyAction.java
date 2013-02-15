/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.CRoomApplyEntity;
import cn.edu.tsinghua.sthu.message.ShowApplyClassroomPageMessage;
import cn.edu.tsinghua.sthu.message.ShowApplyMessage;
import cn.edu.tsinghua.sthu.service.ApplyClassroomService;

/**
 *
 * @author linangran
 */
public class ShowApplyAction extends BaseAction{

    private Integer applyId;
    private ApplyClassroomService applyClassroomService;
    private ShowApplyMessage showApplyMessage;
    
    @Override
    public String onExecute() {
	showApplyMessage.setApplyEntity(getApplyClassroomService().getCRoomApplyEntityById(getApplyId()));
	if (showApplyMessage.getApplyEntity() == null)
	{
	    alertMessage.setSimpleAlert("指定的申请不存在！");
	    return ALERT;
	}
	else{
	    return SUCCESS;
	}
    }

    @Override
    public boolean hasAuth()
    {
	if (getCurrentUser().getAuth().getRole() == AuthEntity.ADMIN_ROLE) {
	    return true;
	}
	else{
	    CRoomApplyEntity entity = getApplyClassroomService().getCRoomApplyEntityById(getApplyId(), getCurrentUser().getID());
	    if (entity == null)
	    {
		return false;
	    }
	    else
	    {
		return true;
	    }
	}
    }
    
    @Override
    public boolean valid() {
	if (getApplyId() == null)
	{
	    alertMessage.setSimpleAlert("参数有误！");
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

    public ApplyClassroomService getApplyClassroomService() {
	return applyClassroomService;
    }

    public void setApplyClassroomService(ApplyClassroomService applyClassroomService) {
	this.applyClassroomService = applyClassroomService;
    }

    public ShowApplyMessage getShowApplyMessage() {
	return showApplyMessage;
    }

    public void setShowApplyMessage(ShowApplyMessage showApplyMessage) {
	this.showApplyMessage = showApplyMessage;
    }
    
}
