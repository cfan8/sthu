/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action.StudentActivity;

import cn.edu.tsinghua.sthu.action.BaseAction;
import cn.edu.tsinghua.sthu.entity.ApplyCommentEntity;
import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity;
import cn.edu.tsinghua.sthu.message.studentActivity.ShowStudentActivityApplyMessage;
import cn.edu.tsinghua.sthu.service.ApplyStudentActivityService;

/**
 *
 * @author Wang Silun
 */
public class SaveStudentActivityCommentAction extends BaseAction{
    
    private ApplyStudentActivityService applyStudentActivityService;
    private StudentActivityApplyEntity entity;
    
    private Integer applyId;
    private Integer isApprove;
    private String comment;
    private Integer type;
    private Integer[] allocates;
    private Integer[] resources;
    private Integer identityAccount;

    @Override
    public String onExecute() throws Exception {
        int identityInt;
        if(identityAccount == null){
            identityInt = -1;
        }else{
            identityInt = identityAccount;
        }
         getApplyStudentActivityService().processComment(getEntity(), isApprove, comment, type, allocates, resources, getCurrentUser().getNickname(), getCurrentUser().getID(), getCurrentUser().getAuth().getOpIdentityCode(), identityInt);
        if (getIsApprove() == 1)
        {
            alertMessage.setSimpleAlert("已通过审批！");
        }
        else if(getIsApprove() == 2)
        {
            alertMessage.setSimpleAlert("已驳回审批！");
        }
        else if(getIsApprove() == 3)
        {
            if(getCurrentUser().getAuth().getOpIdentityCode() == ShowStudentActivityApplyMessage.IDENTITY_SHETUANBU){
                //shetuanbu
                alertMessage.setSimpleAlert("已评论并发往其他账号代为审批！");
            }else{
                alertMessage.setSimpleAlert("已评论！");
            }
        }
        return ALERT;
    }

    @Override
    public boolean hasAuth(){
        if (getCurrentUser().getAuth().getRole() != AuthEntity.ADMIN_ROLE) {
	    return false;
	}
	entity = applyStudentActivityService.getStudentActivityApplyEntityById(applyId);
	if (entity == null)
	{
	    return false;
	}
        if((isApprove == 1) || (isApprove == 2))
        {
            if (type == ShowStudentActivityApplyMessage.APPROVE_TYPE_IDENTITY && entity.getIdentityStatus() == StudentActivityApplyEntity.IDENTITY_STATUS_TODO
                    && getCurrentUser().getAuth().getOpIdentityCode() == entity.getIdentityType())
            {
                return true;
            }
            else if (type == ShowStudentActivityApplyMessage.APPROVE_TYPE_RESOURCE && entity.getResourceStatus() == StudentActivityApplyEntity.RESOURCE_STATUS_TODO
                    /*&& getCurrentUser().getAuth().getOpResourceCode() == entity.getResourceType()*/)
            {
                if(applyStudentActivityService.isUserApproveResourceStatusToDo(entity.getID(), getCurrentUser().getID()))
                    return true;
            }
            else if (type == ShowStudentActivityApplyMessage.APPROVE_TYPE_ALLOCATE && entity.getAllocateStatus() == StudentActivityApplyEntity.ALLOCATE_STATUS_TODO
                    /*&& getCurrentUser().getAuth().getOpAllocateCode() == entity.getAllocateType()*/)
            {
                if(applyStudentActivityService.isUserApproveAllocateStatusToDo(entity.getID(), getCurrentUser().getID()))
                    return true;
            }
            else if(type == ShowStudentActivityApplyMessage.APPROVE_TYPE_GROUP && entity.getGroupStatus() == StudentActivityApplyEntity.GROUP_STATUS_TODO
                    && getCurrentUser().getAuth().getOpGroupCode() == entity.getGroupType()){
                    return true;
            }
            else if(type == ShowStudentActivityApplyMessage.APPROVE_TYPE_PUBLISH && entity.getPublishStatus() == StudentActivityApplyEntity.PUBLISH_STATUS_TODO
                    && getCurrentUser().getAuth().getOpPublishCode() == entity.getPublishType()){
                    return true;
            }
        }
        else if(isApprove == 3)
        {
            return true;
        }
	return false;
    }
    
    @Override
    public boolean valid() {
        if (getApplyId() == null || getIsApprove() == null || getComment() == null || getType() == null)
	{
	    alertMessage.setSimpleAlert("请选择是否同意申请并填写审批意见！");
	    return false;
	}
	else
	{
	    return true;
	}
    }

    @Override
    public boolean needLogin() {
        return true;
    }

    /**
     * @return the applyId
     */
    public Integer getApplyId() {
        return applyId;
    }

    /**
     * @param applyId the applyId to set
     */
    public void setApplyId(Integer applyId) {
        this.applyId = applyId;
    }

    /**
     * @return the isApprove
     */
    public Integer getIsApprove() {
        return isApprove;
    }

    /**
     * @param isApprove the isApprove to set
     */
    public void setIsApprove(Integer isApprove) {
        this.isApprove = isApprove;
    }

    /**
     * @return the comment
     */
    public String getComment() {
        return comment;
    }

    /**
     * @param comment the comment to set
     */
    public void setComment(String comment) {
        this.comment = comment;
    }

    /**
     * @return the type
     */
    public Integer getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(Integer type) {
        this.type = type;
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
     * @return the entity
     */
    public StudentActivityApplyEntity getEntity() {
        return entity;
    }

    /**
     * @param entity the entity to set
     */
    public void setEntity(StudentActivityApplyEntity entity) {
        this.entity = entity;
    }

    /**
     * @return the allocates
     */
    public Integer[] getAllocates() {
        return allocates;
    }

    /**
     * @param allocates the allocates to set
     */
    public void setAllocates(Integer[] allocates) {
        this.allocates = allocates;
    }

    /**
     * @return the resources
     */
    public Integer[] getResources() {
        return resources;
    }

    /**
     * @param resources the resources to set
     */
    public void setResources(Integer[] resources) {
        this.resources = resources;
    }

    /**
     * @return the identityAccount
     */
    public Integer getIdentityAccount() {
        return identityAccount;
    }

    /**
     * @param identityAccount the identityAccount to set
     */
    public void setIdentityAccount(Integer identityAccount) {
        this.identityAccount = identityAccount;
    }
    
}
