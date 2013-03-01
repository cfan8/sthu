/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.CRoomApplyEntity;
import cn.edu.tsinghua.sthu.message.ShowApplyListPageMessage;
import cn.edu.tsinghua.sthu.service.ApplyClassroomService;
import java.util.List;

/**
 *
 * @author linangran
 */
public class ShowApplyListPageAction extends BaseAction{

    public static final int VIEW_TYPE_TODO = 1;
    public static final int VIEW_TYPE_PAST = 2;
    
    public static final int APPROVE_TYPE_IDENTITY = 1;
    public static final int APPROVE_TYPE_RESOURCE = 2;
    public static final int APPROVE_TYPE_ALLOCATE = 3;
    
    private Integer viewType;
    private Integer approveType;
    private Integer page;
    
    private ApplyClassroomService applyClassroomService;
    private ShowApplyListPageMessage showApplyListPageMessage;
    
    @Override
    public String onExecute() {
	List<CRoomApplyEntity> list = applyClassroomService.getPagedApply(viewType, page, 10, getCurrentUser().getAuth(), approveType);
	showApplyListPageMessage.setList(list);
	return SUCCESS;
    }

    @Override
    public boolean valid() {
	if (getViewType() == null || (getViewType() != VIEW_TYPE_TODO && getViewType() != VIEW_TYPE_PAST) 
		|| getApproveType() == null ||( getApproveType() != APPROVE_TYPE_IDENTITY && getApproveType() != APPROVE_TYPE_ALLOCATE && getApproveType() != APPROVE_TYPE_RESOURCE)
		|| getPage() == null || getPage() < 1)
	{
	    alertMessage.setSimpleAlert("参数错误！");
	    return false;
	}
	else
	{
	    return true;
	}
    }

    @Override
    public boolean hasAuth()
    {
	if (getCurrentUser().getAuth().getRole() != AuthEntity.ADMIN_ROLE) {
	    return false;
	}
	else
	{
	    if (getApproveType() == APPROVE_TYPE_IDENTITY && getCurrentUser().getAuth().getOpIdentityCode() != -1) {
		return true;
	    }
	    else if (getApproveType() == APPROVE_TYPE_RESOURCE && getCurrentUser().getAuth().getOpResourceCode() != -1) {
		return true;
	    }
	    else if (getApproveType() == APPROVE_TYPE_ALLOCATE && getCurrentUser().getAuth().getOpAllocateCode() != -1) {
		return true;
	    }
	}
	return false;
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

    public Integer getPage() {
	return page;
    }

    public void setPage(Integer page) {
	this.page = page;
    }

    public ApplyClassroomService getApplyClassroomService() {
	return applyClassroomService;
    }

    public void setApplyClassroomService(ApplyClassroomService applyClassroomService) {
	this.applyClassroomService = applyClassroomService;
    }

    public ShowApplyListPageMessage getShowApplyListPageMessage() {
	return showApplyListPageMessage;
    }

    public void setShowApplyListPageMessage(ShowApplyListPageMessage showApplyListPageMessage) {
	this.showApplyListPageMessage = showApplyListPageMessage;
    }
}
