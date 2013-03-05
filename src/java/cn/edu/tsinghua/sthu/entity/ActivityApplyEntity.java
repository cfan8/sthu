/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.entity;

import java.util.*;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Temporal;
import org.hibernate.annotations.Index;

/**
 *
 * @author luzhen
 */
@Entity
@Table(name = "t_activity_apply")
public class ActivityApplyEntity extends BaseEntity {

    public static final int APPLY_TYPE_LED = 1;
    public static final int APPLY_TYPE_OUTDOOR = 2;
    public static final int APPLY_TYPE_BOARD = 3;
    public static final int APPLY_STATUS_UNCONFIRMED = 1;
    public static final int APPLY_STATUS_CONFIRMED = 2;
    public static final int APPLY_STATUS_ACCEPTED = 3;
    public static final int APPLY_STATUS_REJECTED = -1;
    public static final int IDENTITY_STATUS_REJECTED = -1;
    public static final int IDENTITY_STATUS_AWAIT = 0;
    public static final int IDENTITY_STATUS_TODO = 1;
    public static final int IDENTITY_STATUS_ACCEPTED = Integer.MAX_VALUE;
    public static final int RESOURCE_STATUS_REJECTED = -1;
    public static final int RESOURCE_STATUS_AWAIT = 0;
    public static final int RESOURCE_STATUS_TODO = 1;
    public static final int RESOURCE_STATUS_ACCEPTED = Integer.MAX_VALUE;
    
    @Index(name="applyTypeIndex")
    private int applyType;//申请类型
    @Column(length = 64)
    private String activityName;//活动名称
    @Column(length = 4000)
    private String activityContent;//活动说明
    @Column(columnDefinition = "DATETIME")
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    private Date startTime;//开始时间
    @Column(columnDefinition = "DATETIME")
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    private Date endTime;//结束时间
    @Column(length = 1024)
    private String LEDContent;//电子屏显示内容	LED用
    @Column(length = 256)
    private String activityLocation;//活动地点	室外活动/展板用
    @Column(length = 4000)
    private String activityMaterial;//活动材料	室外活动/展板用
    @Column(length = 128)
    private String organizerName;//主办单位
    @Column(length = 128)
    private String applicatantType;//申请单位
    @Column(length = 32)
    private String applicatantName; //申请人;
    @Column(length = 32)
    private String applicatantCell;//联系电话
    private String applicatantEmail;//电子邮箱
    private int applyPath;  //审批通道
    @Index(name="applyStatusIndex")
    private int applyStatus;	//申请状态
    @Index(name="identityTypeIndex")
    private int identityType;	//一级审批类型
    @Index(name="identityStatusIndex")
    private int identityStatus;	//一级审批状态
    @Column(length = 1024)
    private String identityComment; //一级审批意见
    private int identityCommentUserid; //一级审批人id
    @Column(length = 32)
    private String identityCommentNickname; //一级审批人  
    @Index(name="resourceTypeIndex")
    private int resourceType;	//二级审批类型
    @Index(name="resourceTypeStatusIndex")
    private int resourceStatus;	//二级审批状态
    @Column(length = 1024)
    private String resourceComment; //二级审批意见
    private int resourceCommentUserid; //二级审批人id
    @Column(length = 32)
    private String resourceCommentNickname; //二级审批人  
    @Index(name="applyUserIDIndex")
    private int applyUserID;	//申请人ID
    
    @Column(columnDefinition = "DATETIME")
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    @Index(name="applyDateIndex")
    private Date applyDate; //申请时间
    @Column(columnDefinition = "DATETIME")
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    @Index(name="confirmDateIndex")
    private Date confirmDate;
    @Column(columnDefinition = "DATETIME")
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    @Index(name="identityDateIndex")
    private Date identityDate;
    @Column(columnDefinition = "DATETIME")
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    @Index(name="resourceDateIndex")
    private Date resourceDate;

    public int getApplyType() {
	return applyType;
    }

    public void setApplyType(int applyType) {
	this.applyType = applyType;
    }

    public String getActivityName() {
	return activityName;
    }

    public void setActivityName(String activityName) {
	this.activityName = activityName;
    }

    public String getActivityContent() {
	return activityContent;
    }

    public void setActivityContent(String activityContent) {
	this.activityContent = activityContent;
    }

    public Date getStartTime() {
	return startTime;
    }

    public void setStartTime(Date startTime) {
	this.startTime = startTime;
    }

    public Date getEndTime() {
	return endTime;
    }

    public void setEndTime(Date endTime) {
	this.endTime = endTime;
    }

    public String getLEDContent() {
	return LEDContent;
    }

    public void setLEDContent(String LEDContent) {
	this.LEDContent = LEDContent;
    }

    public String getActivityLocation() {
	return activityLocation;
    }

    public void setActivityLocation(String activityLocation) {
	this.activityLocation = activityLocation;
    }

    public String getActivityMaterial() {
	return activityMaterial;
    }

    public void setActivityMaterial(String activityMaterial) {
	this.activityMaterial = activityMaterial;
    }

    public String getOrganizerName() {
	return organizerName;
    }

    public void setOrganizerName(String organizerName) {
	this.organizerName = organizerName;
    }

    public String getApplicatantType() {
	return applicatantType;
    }

    public void setApplicatantType(String applicatantType) {
	this.applicatantType = applicatantType;
    }

    public String getApplicatantName() {
	return applicatantName;
    }

    public void setApplicatantName(String applicatantName) {
	this.applicatantName = applicatantName;
    }

    public String getApplicatantCell() {
	return applicatantCell;
    }

    public void setApplicatantCell(String applicatantCell) {
	this.applicatantCell = applicatantCell;
    }

    public String getApplicatantEmail() {
	return applicatantEmail;
    }

    public void setApplicatantEmail(String applicatantEmail) {
	this.applicatantEmail = applicatantEmail;
    }

    public int getApplyPath() {
	return applyPath;
    }

    public void setApplyPath(int applyPath) {
	this.applyPath = applyPath;
    }

    public int getApplyStatus() {
	return applyStatus;
    }

    public void setApplyStatus(int applyStatus) {
	this.applyStatus = applyStatus;
    }

    public int getIdentityType() {
	return identityType;
    }

    public void setIdentityType(int identityType) {
	this.identityType = identityType;
    }

    public int getIdentityStatus() {
	return identityStatus;
    }

    public void setIdentityStatus(int identityStatus) {
	this.identityStatus = identityStatus;
    }

    public String getIdentityComment() {
	return identityComment;
    }

    public void setIdentityComment(String identityComment) {
	this.identityComment = identityComment;
    }

    public int getResourceType() {
	return resourceType;
    }

    public void setResourceType(int resourceType) {
	this.resourceType = resourceType;
    }

    public int getResourceStatus() {
	return resourceStatus;
    }

    public void setResourceStatus(int resourceStatus) {
	this.resourceStatus = resourceStatus;
    }

    public String getResourceComment() {
	return resourceComment;
    }

    public void setResourceComment(String resourceComment) {
	this.resourceComment = resourceComment;
    }

    public int getApplyUserID() {
	return applyUserID;
    }

    public void setApplyUserID(int applyUserID) {
	this.applyUserID = applyUserID;
    }

    public Date getApplyDate() {
	return applyDate;
    }

    public void setApplyDate(Date applyDate) {
	this.applyDate = applyDate;
    }

    public Date getConfirmDate() {
	return confirmDate;
    }

    public void setConfirmDate(Date confirmDate) {
	this.confirmDate = confirmDate;
    }

    public Date getIdentityDate() {
	return identityDate;
    }

    public void setIdentityDate(Date identityDate) {
	this.identityDate = identityDate;
    }

    public Date getResourceDate() {
	return resourceDate;
    }

    public void setResourceDate(Date resourceDate) {
	this.resourceDate = resourceDate;
    }
    
    public String getApplyTypeText() {
	switch (this.applyType) {
	    case ActivityApplyEntity.APPLY_TYPE_LED:
		return "电子屏申请";
	    case ActivityApplyEntity.APPLY_TYPE_OUTDOOR:
		return "室外活动申请";
	    case ActivityApplyEntity.APPLY_TYPE_BOARD:
		return "展板申请";
	}
	return "";
    }
    
    public String getApplyStatusText()
    {
	switch(this.applyStatus)
	{
	    case APPLY_STATUS_UNCONFIRMED:
		return "未确认";
	    case APPLY_STATUS_CONFIRMED:
		return "已确认，审批中";
	    case APPLY_STATUS_REJECTED:
		return "已驳回";
	    case APPLY_STATUS_ACCEPTED:
		return "已通过";
	}
	return "";
    }

    public String getIdentityStatusText()
    {
	switch(this.identityStatus)
	{
	    case IDENTITY_STATUS_ACCEPTED:
		return "已通过";
	    case IDENTITY_STATUS_AWAIT:
		return "等待审批";
	    case IDENTITY_STATUS_TODO:
		return "正在审批";
	    case IDENTITY_STATUS_REJECTED:
		return "已驳回";
	}
	return "";
    }
    
    public String getResourceStatusText()
    {
	switch(this.resourceStatus)
	{
	    case RESOURCE_STATUS_ACCEPTED:
		return "已通过";
	    case RESOURCE_STATUS_AWAIT:
		return "等待审批";
	    case RESOURCE_STATUS_TODO:
		return "正在审批";
	    case RESOURCE_STATUS_REJECTED:
		return "已驳回";
	}
	return "";
    }

    /**
     * @return the identityCommentUserid
     */
    public int getIdentityCommentUserid() {
        return identityCommentUserid;
    }

    /**
     * @param identityCommentUserid the identityCommentUserid to set
     */
    public void setIdentityCommentUserid(int identityCommentUserid) {
        this.identityCommentUserid = identityCommentUserid;
    }

    /**
     * @return the identityCommentNickname
     */
    public String getIdentityCommentNickname() {
        return identityCommentNickname;
    }

    /**
     * @param identityCommentNickname the identityCommentNickname to set
     */
    public void setIdentityCommentNickname(String identityCommentNickname) {
        this.identityCommentNickname = identityCommentNickname;
    }

    /**
     * @return the resourceCommentUserid
     */
    public int getResourceCommentUserid() {
        return resourceCommentUserid;
    }

    /**
     * @param resourceCommentUserid the resourceCommentUserid to set
     */
    public void setResourceCommentUserid(int resourceCommentUserid) {
        this.resourceCommentUserid = resourceCommentUserid;
    }

    /**
     * @return the resourceCommentNickname
     */
    public String getResourceCommentNickname() {
        return resourceCommentNickname;
    }

    /**
     * @param resourceCommentNickname the resourceCommentNickname to set
     */
    public void setResourceCommentNickname(String resourceCommentNickname) {
        this.resourceCommentNickname = resourceCommentNickname;
    }
}
