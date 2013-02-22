/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action.outdoor;

import cn.edu.tsinghua.sthu.action.BaseAction;
import cn.edu.tsinghua.sthu.service.ApplyActivityService;
import cn.edu.tsinghua.sthu.message.outdoor.ShowActivityApplyMessage;
import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.ActivityApplyEntity;

/**
 *
 * @author luzhen
 */
public class ShowActivityApplyAction extends BaseAction {
    
    private Integer applyId;
    private ApplyActivityService applyActivityService;
    private ShowActivityApplyMessage showActivityApplyMessage;
    
    @Override
    public String onExecute() {
	ActivityApplyEntity entity = getApplyActivityService().getActivityApplyEntityById(getApplyId());
	if (entity == null) {
	    alertMessage.setSimpleAlert("指定的申请不存在！");
	    return ALERT;
	} else {
	    showActivityApplyMessage.setApplyEntity(entity);
	    if (getCurrentUser().getID() == showActivityApplyMessage.getApplyEntity().getApplyUserID()
		    && (showActivityApplyMessage.getApplyEntity().getApplyStatus() == ActivityApplyEntity.APPLY_STATUS_UNCONFIRMED
		    || showActivityApplyMessage.getApplyEntity().getApplyStatus() == ActivityApplyEntity.APPLY_STATUS_REJECTED)) {
		showActivityApplyMessage.setShowConfirm(true);
	    } else {
		showActivityApplyMessage.setShowConfirm(false);
	    }
	    if (getCurrentUser().getAuth().getRole() == AuthEntity.ADMIN_ROLE) {
		if (entity.getIdentityStatus() == ActivityApplyEntity.IDENTITY_STATUS_TODO
			&& getCurrentUser().getAuth().getOpIdentityCode() == entity.getIdentityType()) {
		    showActivityApplyMessage.setApproveType(showActivityApplyMessage.APPROVE_TYPE_IDENTITY);
		    showActivityApplyMessage.setShowApprove(true);
		} else if (entity.getResourceStatus() == ActivityApplyEntity.RESOURCE_STATUS_TODO
			&& getCurrentUser().getAuth().getOpResourceCode() == entity.getIdentityType()) {
		    showActivityApplyMessage.setApproveType(showActivityApplyMessage.APPROVE_TYPE_RESOURCE);
		    showActivityApplyMessage.setShowApprove(true);
		} else {
		    showActivityApplyMessage.setShowApprove(false);
		}
	    } else {
		showActivityApplyMessage.setShowApprove(false);
	    }
	    return SUCCESS;
	}
    }

    @Override
    public boolean hasAuth() {
	if (getCurrentUser().getAuth().getRole() == AuthEntity.ADMIN_ROLE) {
	    return true;
	} else {
	    ActivityApplyEntity entity = getApplyActivityService().getActivityApplyEntityById(getApplyId());
	    if (entity == null || entity.getApplyUserID() != getCurrentUser().getID()) {
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

    public ApplyActivityService getApplyActivityService() {
        return applyActivityService;
    }

    public void setApplyActivityService(ApplyActivityService applyActivityService) {
        this.applyActivityService = applyActivityService;
    }

    public ShowActivityApplyMessage getShowActivityApplyMessage() {
        return showActivityApplyMessage;
    }

    public void setShowActivityApplyMessage(ShowActivityApplyMessage showActivityApplyMessage) {
        this.showActivityApplyMessage = showActivityApplyMessage;
    }
}
