/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action.StudentActivity;

import cn.edu.tsinghua.sthu.action.BaseAction;
import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity;
import cn.edu.tsinghua.sthu.message.studentActivity.ShowStudentActivityApplyListPageMessage;
import cn.edu.tsinghua.sthu.security.XSSProtect;
import cn.edu.tsinghua.sthu.security.XSSProtectLevel;
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
    public static final int APPROVE_TYPE_PUBLISH = 5;
    public static final int APPROVE_TYPE_APPROVED = 6;
    public static final int APPROVE_TYPE_ALLOCATE_RESOURCE = 7;
    public static final int APPROVE_TYPE_DIGEST = 8;
    
    @XSSProtect(XSSProtectLevel.Strict)
    private String searchKeywords ;  //
    private Integer viewType;
    private Integer approveType;
    private Integer page;
    private int[] searchStatus;
    private ApplyStudentActivityService applyStudentActivityService;
    private ShowStudentActivityApplyListPageMessage showStudentActivityApplyListPageMessage;
    
    
    @Override
    public String onExecute() throws Exception {
       List<StudentActivityApplyEntity> list = null;
       list= applyStudentActivityService.getPagedApply( viewType,page, 10, getCurrentUser().getAuth(), approveType,getSearchStatus(),getSearchKeywords());
       showStudentActivityApplyListPageMessage.setList(list);
        
	return SUCCESS;
    }

    @Override
    public boolean valid() {
       if (getViewType() == null || (getViewType() != VIEW_TYPE_TODO && getViewType() != VIEW_TYPE_PAST)|| 
	       getApproveType() == null ||( getApproveType() != APPROVE_TYPE_IDENTITY 
               && getApproveType() != APPROVE_TYPE_RESOURCE  && getApproveType() != APPROVE_TYPE_ALLOCATE 
               && getApproveType() != APPROVE_TYPE_GROUP && getApproveType() != APPROVE_TYPE_PUBLISH 
               && getApproveType() != APPROVE_TYPE_APPROVED && getApproveType() != APPROVE_TYPE_ALLOCATE_RESOURCE
               && getApproveType() != APPROVE_TYPE_DIGEST)
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
            else if (getApproveType() == APPROVE_TYPE_PUBLISH && getCurrentUser().getAuth().getOpPublishCode() != -1) {
		return true;
	    }
            else if(getApproveType() == APPROVE_TYPE_APPROVED && getCurrentUser().getAuth().getOpGroupCode() != -1){
                return true;
            }
            else if(getApproveType() == APPROVE_TYPE_ALLOCATE_RESOURCE && getCurrentUser().getAuth().getOpAllocateCode() != -1 && getCurrentUser().getAuth().getOpResourceCode() != -1){
                return true;
            }
            else if (getApproveType() == APPROVE_TYPE_DIGEST && getCurrentUser().getAuth().getOpPublishCode() != -1) {
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

 


    /**
     * @return the searchStatus
     */
    public int[] getSearchStatus() {
        return searchStatus;
    }

    /**
     * @param searchStatus the searchStatus to set
     */
    public void setSearchStatus(int[] searchStatus) {
        this.searchStatus = searchStatus;
    }

      /**
     * @param searchStatus the searchStatus to set
     */
    public void setSearchStatus(String searchStatus) {
        String[] obj = searchStatus.split(",");
        this.searchStatus = new int[obj.length];
        for(int i=0;i<obj.length;i++){
            this.searchStatus[i] = Integer.parseInt(obj[i]);
        }
       /// this.setSearchStatus(searchStatus);
    }
    /**
     * @return the searchKeywords
     */
    public String getSearchKeywords() {
        return searchKeywords;
    }

    /**
     * @param searchKeywords the searchKeywords to set
     */
    public void setSearchKeywords(String searchKeywords) {
        this.searchKeywords = searchKeywords;
    }
    
}
