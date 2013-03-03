/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action.outdoor;

import cn.edu.tsinghua.sthu.action.BaseAction;
import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.ActivityApplyEntity;
import cn.edu.tsinghua.sthu.message.outdoor.ShowActivityApplyListPageMessage;
import cn.edu.tsinghua.sthu.service.ApplyActivityService;
import java.util.List;
/**
 *
 * @author elsie
 */
public class ShowActivityApplyListPageAction extends BaseAction{
    public static final int VIEW_TYPE_TODO = 1;
    public static final int VIEW_TYPE_PAST = 2;
    
    public static final int APPROVE_TYPE_IDENTITY = 1;
    public static final int APPROVE_TYPE_RESOURCE = 2;
    
    private Integer viewType;
    private Integer approveType;
    private Integer page;
    
    private ApplyActivityService applyActivityService;
    private ShowActivityApplyListPageMessage showActivityApplyListPageMessage;
    
    @Override
    public String onExecute() {
	List<ActivityApplyEntity> list = applyActivityService.getPagedApply(viewType, page, 10, getCurrentUser().getAuth(), approveType);
	showActivityApplyListPageMessage.setList(list);
	return SUCCESS;
    }

    @Override
    public boolean valid() {
	if (getViewType() == null || (getViewType() != VIEW_TYPE_TODO && getViewType() != VIEW_TYPE_PAST) 
		|| getApproveType() == null ||( getApproveType() != APPROVE_TYPE_IDENTITY && getApproveType() != APPROVE_TYPE_RESOURCE)
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

    public ApplyActivityService getApplyActivityService() {
	return applyActivityService;
    }

    public void setApplyActivityService(ApplyActivityService applyActivityService) {
	this.applyActivityService = applyActivityService;
    }

    public ShowActivityApplyListPageMessage getShowActivityApplyListPageMessage() {
	return showActivityApplyListPageMessage;
    }

    public void setShowActivityApplyListPageMessage(ShowActivityApplyListPageMessage showActivityApplyListPageMessage) {
	this.showActivityApplyListPageMessage = showActivityApplyListPageMessage;
    }
}
