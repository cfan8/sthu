/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action.outdoor;

import cn.edu.tsinghua.sthu.action.BaseAction;
import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.message.outdoor.ShowActivityApplyListMessage;
import cn.edu.tsinghua.sthu.service.ApplyActivityService;

/**
 *
 * @author elsie
 */
public class ShowActivityApplyListAction extends BaseAction{
    private Integer viewType;
    private Integer approveType;
    private ShowActivityApplyListMessage showActivityApplyListMessage;
    private ApplyActivityService applyActivityService;

    @Override
    public String onExecute() {
	showActivityApplyListMessage.setViewType(viewType);
	showActivityApplyListMessage.setApproveType(approveType);
	showActivityApplyListMessage.setTotalPageNumber(applyActivityService.getTotalPageNumber(viewType, 20, getCurrentUser().getAuth(), approveType));
	return SUCCESS;
    }

    @Override
    public boolean hasAuth() {
	if (getCurrentUser().getAuth().getRole() != AuthEntity.ADMIN_ROLE) {
	    return false;
	}
	if (approveType == ShowActivityApplyListPageAction.APPROVE_TYPE_IDENTITY && getCurrentUser().getAuth().getOpIdentityCode() != -1) {
	    return true;
	} else if (approveType == ShowActivityApplyListPageAction.APPROVE_TYPE_RESOURCE && getCurrentUser().getAuth().getOpResourceCode() != -1) {
	    return true;
	}
	return false;
    }

    @Override
    public boolean valid() {
	if (getViewType() == null || (getViewType() != ShowActivityApplyListPageAction.VIEW_TYPE_PAST && getViewType() != ShowActivityApplyListPageAction.VIEW_TYPE_TODO)
		|| getApproveType() == null || (getApproveType() != ShowActivityApplyListPageAction.APPROVE_TYPE_IDENTITY && getApproveType() != ShowActivityApplyListPageAction.APPROVE_TYPE_RESOURCE)) {
	    return false;
	} else {
	    return true;
	}
    }

    @Override
    public boolean needLogin() {
	return true;
    }

    public Integer getViewType() {
	return viewType;
    }

    public void setViewType(Integer viewType) {
	this.viewType = viewType;
    }

    public Integer getApproveType() {
	return approveType;
    }

    public void setApproveType(Integer approveType) {
	this.approveType = approveType;
    }

    public ShowActivityApplyListMessage getShowActivityApplyListMessage() {
	return showActivityApplyListMessage;
    }

    public void setShowActivityApplyListMessage(ShowActivityApplyListMessage showActivityApplyListMessage) {
	this.showActivityApplyListMessage = showActivityApplyListMessage;
    }

    public ApplyActivityService getApplyActivityService() {
	return applyActivityService;
    }

    public void setApplyActivityService(ApplyActivityService applyActivityService) {
	this.applyActivityService = applyActivityService;
    }
}
