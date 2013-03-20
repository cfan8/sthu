/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.entity;

import java.util.Date;
import java.util.List;
import javax.persistence.*;
import org.hibernate.annotations.Index;

/**
 *
 * @author linangran
 */
@Entity
@Table(name = "t_croom_apply")
public class CRoomApplyEntity extends BaseEntity implements Comparable<CRoomApplyEntity> {

    public static final int USAGE_CONTEST = 1;
    public static final int USAGE_GROUP = 2;
    public static final int USAGE_LECTURE = 3;
    public static final int USAGE_OTHER = 4;
    public static final int ROOMTYPE_ORDINARY = 1;
    public static final int ROOMTYPE_MEDIA = 2;
    public static final int ROOMTYPE_CBUILDING_NORMAL = 3;
    public static final int ROOMTYPE_CBUILDING_MEDIA = 4;
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
    public static final int ALLOCATE_STATUS_REJECTED = -1;
    public static final int ALLOCATE_STATUS_AWAIT = 0;
    public static final int ALLOCATE_STATUS_TODO = 1;
    public static final int ALLOCATE_STATUS_ACCEPTED = Integer.MAX_VALUE;
    
    @Index(name="applyUseridIndex")
    private int applyUserid;	//申请人userid
    private String organizer;	//单位名称
    private String borrower;	//借用人
    private String borrowerCell;    //借用人联系电话
    private int classUsage;	//用处:常量见下
    private String usageComment;
    @Column(length = 5000)
    private String content; //具体内容
    private String manager; //负责人
    private String managerCell;	//负责人联系电话
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date borrowDate;	//借用日期
    private String timePeriod;	//借用时间段
    private int croomtype;  //借用教室类型:常量见下
    private int number;	//教室借用人数
    private String title;  //标题，从借用原因改过来
    @Column(columnDefinition="DATETIME")
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    @Index(name="applyDateIndex")
    private Date applyDate; //申请日期
    @Column(columnDefinition="DATETIME")
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    @Index(name="confirmDateIndex")
    private Date confirmDate;	//确认申请日期
    @Column(columnDefinition="DATETIME")
    @Index(name="identityDateIndex")
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    private Date identityDate;	//一级审批日期
    @Column(columnDefinition="DATETIME")
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    @Index(name="resourceDateIndex")
    private Date resourceDate;	//二级审批日期
    @Column(columnDefinition="DATETIME")
    @Index(name="allocateDateIndex")
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    private Date allocateDate;	//三级审批日期(按照申请要求分配申请)
    private int applyType;  //type指定了申请通道，仅存储数据供编辑时使用
    @Index(name="applyStatusIndex")
    private int applyStatus;
    @Index(name="identityTypeIndex")
    private int identityType;	//type指定了要哪个角色来审批
    @Index(name="identityStatusIndex")
    private int identityStatus;
    @Index(name="resourceTypeIndex")
    private int resourceType;
    @Index(name="resourceStatusIndex")
    private int resourceStatus;
    @Index(name="allocateTypeIndex")
    private int allocateType;
    @Index(name="allocateStatusIndex")
    private int allocateStatus;
    /*
    @OneToMany(cascade = {CascadeType.ALL}, fetch = FetchType.EAGER)
    private List<ApplyCommentEntity> comments = new ArrayList<ApplyCommentEntity>();*/
    
    @Transient 
    private List<ApplyCommentEntity> comments;

    public String getOrganizer() {
	return organizer;
    }

    public void setOrganizer(String organizer) {
	this.organizer = organizer;
    }

    public String getBorrower() {
	return borrower;
    }

    public void setBorrower(String borrower) {
	this.borrower = borrower;
    }

    public String getBorrowerCell() {
	return borrowerCell;
    }

    public void setBorrowerCell(String borrowerCell) {
	this.borrowerCell = borrowerCell;
    }

    public int getUsage() {
	return classUsage;
    }

    public void setUsage(int usage) {
	this.classUsage = usage;
    }

    public String getContent() {
	return content;
    }

    public void setContent(String content) {
	this.content = content;
    }

    public String getManager() {
	return manager;
    }

    public void setManager(String manager) {
	this.manager = manager;
    }

    public String getManagerCell() {
	return managerCell;
    }

    public void setManagerCell(String managerCell) {
	this.managerCell = managerCell;
    }

    public Date getBorrowDate() {
	return borrowDate;
    }

    public void setBorrowDate(Date borrowDate) {
	this.borrowDate = borrowDate;
    }

    public String getTimePeriod() {
	return timePeriod;
    }

    public void setTimePeriod(String timePeriod) {
	this.timePeriod = timePeriod;
    }

    public int getCroomtype() {
	return croomtype;
    }

    public void setCroomtype(int croomtype) {
	this.croomtype = croomtype;
    }

    public int getNumber() {
	return number;
    }

    public void setNumber(int number) {
	this.number = number;
    }

    public String getTitle() {
	return title;
    }

    public void setTitle(String title) {
	this.title = title;
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

    public Date getAllocateDate() {
	return allocateDate;
    }

    public void setAllocateDate(Date allocateDate) {
	this.allocateDate = allocateDate;
    }

    public int getApplyStatus() {
	return applyStatus;
    }

    public void setApplyStatus(int applyStatus) {
	this.applyStatus = applyStatus;
    }

    public int getIdentityStatus() {
	return identityStatus;
    }

    public void setIdentityStatus(int identityStatus) {
	this.identityStatus = identityStatus;
    }

    public int getResourceStatus() {
	return resourceStatus;
    }

    public void setResourceStatus(int resourceStatus) {
	this.resourceStatus = resourceStatus;
    }

    public int getAllocateStatus() {
	return allocateStatus;
    }

    public void setAllocateStatus(int allocateStatus) {
	this.allocateStatus = allocateStatus;
    }

    public String getUsageComment() {
	return usageComment;
    }

    public void setUsageComment(String usageComment) {
	this.usageComment = usageComment;
    }

    public int getIdentityType() {
	return identityType;
    }

    public void setIdentityType(int identityType) {
	this.identityType = identityType;
    }

    public int getResourceType() {
	return resourceType;
    }

    public void setResourceType(int resourceType) {
	this.resourceType = resourceType;
    }

    public int getAllocateType() {
	return allocateType;
    }

    public void setAllocateType(int allocateType) {
	this.allocateType = allocateType;
    }

    public int getApplyUserid() {
	return applyUserid;
    }

    public void setApplyUserid(int applyUserid) {
	this.applyUserid = applyUserid;
    }

    public int getApplyType() {
	return applyType;
    }

    public void setApplyType(int applyType) {
	this.applyType = applyType;
    }

    public List<ApplyCommentEntity> getComments() {
	return comments;
    }

    public void setComments(List<ApplyCommentEntity> comments) {
	this.comments = comments;
    }

    public String getRoomtypeText() {
	switch (this.croomtype) {
	    case CRoomApplyEntity.ROOMTYPE_ORDINARY:
		return "普通教室";
	    case CRoomApplyEntity.ROOMTYPE_MEDIA:
		return "多媒体教室";
	    case CRoomApplyEntity.ROOMTYPE_CBUILDING_NORMAL:
		return "C楼普通教室";
	    case CRoomApplyEntity.ROOMTYPE_CBUILDING_MEDIA:
		return "C楼多媒体教室";
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
    
    public String getAllocateStatusText()
    {
	switch(this.allocateStatus)
	{
	    case ALLOCATE_STATUS_ACCEPTED:
		return "已通过";
	    case ALLOCATE_STATUS_AWAIT:
		return "等待审批";
	    case ALLOCATE_STATUS_TODO:
		return "正在审批";
	    case ALLOCATE_STATUS_REJECTED:
		return "已驳回";
	}
	return "";
    }

    @Override
    public int compareTo(CRoomApplyEntity o) {
	if (applyDate.before(o.applyDate)) {
	    return 1;
	}
	else if (applyDate.after(o.applyDate))
	{
	    return -1;
	}
	else {
	    return 0;
	}
    }
}
