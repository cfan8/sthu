/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action.StudentActivity;

import cn.edu.tsinghua.sthu.action.BaseAction;
import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity;
import cn.edu.tsinghua.sthu.message.studentActivity.ShowStudentActivityApplyListPageMessage;
import cn.edu.tsinghua.sthu.service.ApplyStudentActivityService;
import java.util.List;

/**
 *
 * @author xiaobo
 */
public class ShowStudentActivityApplyListPageAction extends BaseAction{

    public static final int VIEW_TYPE_TODO = 1;
    public static final int VIEW_TYPE_PAST = 2;
    
    public static final int APPROVE_TYPE_IDENTITY = 1;
    public static final int APPROVE_TYPE_RESOURCE = 2;
    public static final int APPROVE_TYPE_ALLOCATE = 3;
    public static final int APPROVE_TYPE_GROUP = 4;
    
    private Integer viewType;
    private Integer approveType;
    private Integer page;
    
    private ApplyStudentActivityService applyStudentActivityService;
    private ShowStudentActivityApplyListPageMessage showStudentActivityApplyListPageMessage;
    
    
    @Override
    public String onExecute() throws Exception {
       List<StudentActivityApplyEntity> list = applyStudentActivityService.getPagedApply(viewType, page, 10, getCurrentUser().getAuth(), approveType);
	showStudentActivityApplyListPageMessage.setList(list);
	return SUCCESS;
    }

    @Override
    public boolean valid() {
       if (getViewType() == null || (getViewType() != VIEW_TYPE_TODO && getViewType() != VIEW_TYPE_PAST) 
		|| getApproveType() == null ||( getApproveType() != APPROVE_TYPE_IDENTITY && getApproveType() != APPROVE_TYPE_RESOURCE  && getApproveType() != APPROVE_TYPE_ALLOCATE && getApproveType() != APPROVE_TYPE_GROUP)
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
            else if (getApproveType() == APPROVE_TYPE_GROUP && getCurrentUser().getAuth().getOpGroupCode() != -1) {
		return true;
	    }
	}
	return false;
    }
    
    @Override
    public boolean needLogin() {
       return true;
    }

    /**
     * @return the viewType
     */
    public Integer getViewType() {
        return viewType;
    }

    /**
     * @param viewType the viewType to set
     */
    public void setViewType(Integer viewType) {
        this.viewType = viewType;
    }

    /**
     * @return the approveType
     */
    public Integer getApproveType() {
        return approveType;
    }

    /**
     * @param approveType the approveType to set
     */
    public void setApproveType(Integer approveType) {
        this.approveType = approveType;
    }

    /**
     * @return the page
     */
    public Integer getPage() {
        return page;
    }

    /**
     * @param page the page to set
     */
    public void setPage(Integer page) {
        this.page = page;
    }

    /**
     * @return the applyStudentActivityService
     */
    public ApplyStudentActivityService getApplyStudentActivityService() {
        return applyStudentActivityService;
    }

    /**
     * @param applyStudentActivityService the applyStudentActivityService to set
     */
    public void setApplyStudentActivityService(ApplyStudentActivityService applyStudentActivityService) {
        this.applyStudentActivityService = applyStudentActivityService;
    }

    /**
     * @return the showStudentActivityApplyListPageMessage
     */
    public ShowStudentActivityApplyListPageMessage getShowStudentActivityApplyListPageMessage() {
        return showStudentActivityApplyListPageMessage;
    }

    /**
     * @param showStudentActivityApplyListPageMessage the showStudentActivityApplyListPageMessage to set
     */
    public void setShowStudentActivityApplyListPageMessage(ShowStudentActivityApplyListPageMessage showStudentActivityApplyListPageMessage) {
        this.showStudentActivityApplyListPageMessage = showStudentActivityApplyListPageMessage;
    }
    
}
