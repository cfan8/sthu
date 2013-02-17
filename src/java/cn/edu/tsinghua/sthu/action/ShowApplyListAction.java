/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.message.ShowApplyListMessage;
import cn.edu.tsinghua.sthu.service.ApplyClassroomService;

/**
 *
 * @author linangran
 */
public class ShowApplyListAction extends BaseAction {

    private Integer viewType;
    private Integer approveType;
    private ShowApplyListMessage showApplyListMessage;
    private ApplyClassroomService applyClassroomService;

    @Override
    public String onExecute() {
	showApplyListMessage.setViewType(viewType);
	showApplyListMessage.setApproveType(approveType);
	showApplyListMessage.setTotalPageNumber(applyClassroomService.getTotalPageNumber(viewType, 20, getCurrentUser().getAuth(), approveType));
	return SUCCESS;
    }

    @Override
    public boolean hasAuth() {
	if (getCurrentUser().getAuth().getRole() != AuthEntity.ADMIN_ROLE) {
	    return false;
	}
	if (approveType == ShowApplyListPageAction.APPROVE_TYPE_IDENTITY && getCurrentUser().getAuth().getOpIdentityCode() != -1) {
	    return true;
	} else if (approveType == ShowApplyListPageAction.APPROVE_TYPE_RESOURCE && getCurrentUser().getAuth().getOpResourceCode() != -1) {
	    return true;
	} else if (approveType == ShowApplyListPageAction.APPROVE_TYPE_ALLOCATE && getCurrentUser().getAuth().getOpAllocateCode() != -1) {
	    return true;
	}
	return false;
    }

    @Override
    public boolean valid() {
	if (getViewType() == null || (getViewType() != ShowApplyListPageAction.VIEW_TYPE_PAST && getViewType() != ShowApplyListPageAction.VIEW_TYPE_TODO)
		|| getApproveType() == null || (getApproveType() != ShowApplyListPageAction.APPROVE_TYPE_IDENTITY && getApproveType() != ShowApplyListPageAction.APPROVE_TYPE_RESOURCE && getApproveType() != ShowApplyListPageAction.APPROVE_TYPE_ALLOCATE)) {
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

    public ShowApplyListMessage getShowApplyListMessage() {
	return showApplyListMessage;
    }

    public void setShowApplyListMessage(ShowApplyListMessage showApplyListMessage) {
	this.showApplyListMessage = showApplyListMessage;
    }

    public ApplyClassroomService getApplyClassroomService() {
	return applyClassroomService;
    }

    public void setApplyClassroomService(ApplyClassroomService applyClassroomService) {
	this.applyClassroomService = applyClassroomService;
    }
}
