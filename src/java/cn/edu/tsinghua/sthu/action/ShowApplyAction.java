/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.CRoomApplyEntity;
import cn.edu.tsinghua.sthu.message.ShowApplyMessage;
import cn.edu.tsinghua.sthu.service.ApplyClassroomService;
import java.util.Collections;

/**
 *
 * @author linangran
 */
public class ShowApplyAction extends BaseAction {

    private Integer applyId;
    private ApplyClassroomService applyClassroomService;
    private ShowApplyMessage showApplyMessage;

    @Override
    public String onExecute() {
	CRoomApplyEntity entity = getApplyClassroomService().getCRoomApplyEntityById(getApplyId());
	if (entity == null) {
	    alertMessage.setSimpleAlert("指定的申请不存在！");
	    return ALERT;
	} else {
	    showApplyMessage.setApplyEntity(entity);
	    if (getCurrentUser().getID() == showApplyMessage.getApplyEntity().getApplyUserid()
		    && (showApplyMessage.getApplyEntity().getApplyStatus() == CRoomApplyEntity.APPLY_STATUS_UNCONFIRMED
		    || showApplyMessage.getApplyEntity().getApplyStatus() == CRoomApplyEntity.APPLY_STATUS_REJECTED)) {
		showApplyMessage.setShowConfirm(true);
	    } else {
		showApplyMessage.setShowConfirm(false);
	    }
	    if (getCurrentUser().getAuth().getRole() == AuthEntity.ADMIN_ROLE) {
                showApplyMessage.setShowComment(true);
		if (entity.getIdentityStatus() == CRoomApplyEntity.IDENTITY_STATUS_TODO
			&& getCurrentUser().getAuth().getOpIdentityCode() == entity.getIdentityType()) {
		    showApplyMessage.setApproveType(ShowApplyMessage.APPROVE_TYPE_IDENTITY);
		    showApplyMessage.setShowApprove(true);
		} else if (entity.getResourceStatus() == CRoomApplyEntity.RESOURCE_STATUS_TODO
			&& getCurrentUser().getAuth().getOpResourceCode() == entity.getResourceType()) {
		    showApplyMessage.setApproveType(ShowApplyMessage.APPROVE_TYPE_RESOURCE);
		    showApplyMessage.setShowApprove(true);
		} else if (entity.getAllocateStatus() == CRoomApplyEntity.ALLOCATE_STATUS_TODO
			&& getCurrentUser().getAuth().getOpAllocateCode() == entity.getAllocateType()) {
		    showApplyMessage.setApproveType(ShowApplyMessage.APPROVE_TYPE_ALLOCATE);
		    showApplyMessage.setShowApprove(true);
		} else {
		    showApplyMessage.setShowApprove(false);
		}
	    } else {
		showApplyMessage.setShowApprove(false);
	    }
	    return SUCCESS;
	}
    }

    @Override
    public boolean hasAuth() {
	if (getCurrentUser().getAuth().getRole() == AuthEntity.ADMIN_ROLE) {
	    return true;
	} else {
	    CRoomApplyEntity entity = getApplyClassroomService().getCRoomApplyEntityById(getApplyId());
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
