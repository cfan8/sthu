/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action.StudentActivity;

import cn.edu.tsinghua.sthu.action.BaseAction;
import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.message.studentActivity.ShowStudentActivityApplyListMessage;
import cn.edu.tsinghua.sthu.security.XSSProtect;
import cn.edu.tsinghua.sthu.security.XSSProtectLevel;
import cn.edu.tsinghua.sthu.service.ApplyStudentActivityService;

/**
 *
 * @author xiaobo
 */
public class ShowStudentActivityApplyListAction extends BaseAction{
    
    @XSSProtect(XSSProtectLevel.Strict)
    private String searchKeywords ;  //
    private Integer viewType ;
    private Integer approveType;
    private ShowStudentActivityApplyListMessage showStudentActivityApplyListMessage;
    private ApplyStudentActivityService applyStudentActivityService;
    private int[] searchStatus;
    
    @Override
    public String onExecute() throws Exception {
       	showStudentActivityApplyListMessage.setViewType(viewType);
	showStudentActivityApplyListMessage.setApproveType(approveType);
        if(approveType == ShowStudentActivityApplyListPageAction.APPROVE_TYPE_APPROVED){
            if(this.searchKeywords == null) {
                this.setSearchKeywords();
            }
            if(this.searchStatus == null) {
                this.setSearchStatus();
            }
            showStudentActivityApplyListMessage.setSearchStatus(searchStatus);
            showStudentActivityApplyListMessage.setSearchKeywords(searchKeywords);
       }
        else{
            this.setSearchStatus();
            this.setSearchKeywords();
             showStudentActivityApplyListMessage.setSearchStatus(searchStatus);
            showStudentActivityApplyListMessage.setSearchKeywords(searchKeywords);
        }
  
	showStudentActivityApplyListMessage.setTotalPageNumber(applyStudentActivityService.getTotalPageNumber(viewType, 10, getCurrentUser().getAuth(), approveType,searchStatus, searchKeywords)); 
    
        return SUCCESS;
    }

     @Override
    public boolean hasAuth() {
	if (getCurrentUser().getAuth().getRole() != AuthEntity.ADMIN_ROLE) {
	    return false;
	}
	if (approveType == ShowStudentActivityApplyListPageAction.APPROVE_TYPE_IDENTITY && getCurrentUser().getAuth().getOpIdentityCode() != -1) {
	    return true;
	} else if (approveType == ShowStudentActivityApplyListPageAction.APPROVE_TYPE_RESOURCE && getCurrentUser().getAuth().getOpResourceCode() != -1) {
	    return true;
	} else if(approveType == ShowStudentActivityApplyListPageAction.APPROVE_TYPE_GROUP && getCurrentUser().getAuth().getOpGroupCode() != -1){
            return true;
        }else if(approveType == ShowStudentActivityApplyListPageAction.APPROVE_TYPE_ALLOCATE && getCurrentUser().getAuth().getOpAllocateCode() != -1){
            return true;
        }else if(approveType == ShowStudentActivityApplyListPageAction.APPROVE_TYPE_PUBLISH && getCurrentUser().getAuth().getOpPublishCode() != -1){
            return true;
        }else if(approveType == ShowStudentActivityApplyListPageAction.APPROVE_TYPE_APPROVED && getCurrentUser().getAuth().getOpGroupCode() != -1){
            return true;
        }else if(approveType == ShowStudentActivityApplyListPageAction.APPROVE_TYPE_ALLOCATE_RESOURCE && getCurrentUser().getAuth().getOpAllocateCode() != -1 && getCurrentUser().getAuth().getOpResourceCode() != -1){
            return true;
        }else if(approveType == ShowStudentActivityApplyListPageAction.APPROVE_TYPE_DIGEST && getCurrentUser().getAuth().getOpPublishCode() != -1){
            return true;
        }
        
	return false;
    }
    
    @Override
    public boolean valid() {
        if (getViewType() == null || (getViewType() != ShowStudentActivityApplyListPageAction.VIEW_TYPE_PAST && getViewType() != ShowStudentActivityApplyListPageAction.VIEW_TYPE_TODO)||
	 getApproveType() == null || (getApproveType() != ShowStudentActivityApplyListPageAction.APPROVE_TYPE_IDENTITY && getApproveType() != ShowStudentActivityApplyListPageAction.APPROVE_TYPE_RESOURCE  
                && getApproveType() != ShowStudentActivityApplyListPageAction.APPROVE_TYPE_ALLOCATE && getApproveType() != ShowStudentActivityApplyListPageAction.APPROVE_TYPE_GROUP && getApproveType() != ShowStudentActivityApplyListPageAction.APPROVE_TYPE_PUBLISH
                && getApproveType() != ShowStudentActivityApplyListPageAction.APPROVE_TYPE_APPROVED
                 && getApproveType() != ShowStudentActivityApplyListPageAction.APPROVE_TYPE_ALLOCATE_RESOURCE
                && getApproveType() != ShowStudentActivityApplyListPageAction.APPROVE_TYPE_DIGEST)) {
	    return false;
	} else {
	    return true;
	}
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
     * @return the showStudentActivityApplyListMessage
     */
    public ShowStudentActivityApplyListMessage getShowStudentActivityApplyListMessage() {
        return showStudentActivityApplyListMessage;
    }

    /**
     * @param showStudentActivityApplyListMessage the showStudentActivityApplyListMessage to set
     */
    public void setShowStudentActivityApplyListMessage(ShowStudentActivityApplyListMessage showStudentActivityApplyListMessage) {
        this.showStudentActivityApplyListMessage = showStudentActivityApplyListMessage;
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
     * @return the searchStatus
     */
    public int[] getSearchStatus() {
        return searchStatus;
    }

    /**
     * @param searchStatus the searchStatus to set
     */
    public void setSearchStatus(int[] searchStatus) {
        this.searchStatus =searchStatus;
    }
 
   /**
     * @param searchStatus the searchStatus to set
     */
    public void setSearchStatus(String searchStatus) {
        if(searchStatus == null){
           this.searchStatus = new int[8];
        for(int i=0;i<this.searchStatus.length;i++){
            this.searchStatus[i] = 0;
        } 
       }
        else{
        String[] obj = searchStatus.split(",");
        this.searchStatus = new int[obj.length];
        for(int i=0;i<obj.length;i++){
            this.searchStatus[i] = Integer.parseInt(obj[i]);
        }
        }
       
    }
 /**
     * @param searchStatus the searchStatus to set
     */
    public void setSearchStatus() {
       
           this.searchStatus = new int[8];
        for(int i=0;i<this.searchStatus.length;i++){
            this.searchStatus[i] = 0;
        } 
     
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
        if(searchKeywords == null){
            this.searchKeywords = "";
        }
        
        this.searchKeywords = searchKeywords;
    }
   /**
     * @param searchKeywords the searchKeywords to set
     */
    public void setSearchKeywords() {
       
            this.searchKeywords = "";
    
    }
   
  

    
}
