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
import javax.persistence.Transient;
import org.hibernate.annotations.Index;
/**
 *
 * @author xiaobo
 */
@Entity
@Table(name = "t_student_activity_apply")
public class StudentActivityApplyEntity extends BaseEntity{
    public static final int USAGE_GROUP = 1;
    public static final int USAGE_SPORTS = 2;
    public static final int USAGE_LECTURE = 3;
    public static final int USAGE_CULTURE = 4;
    public static final int USAGE_AMUSE = 5;
    public static final int USAGE_OTHER = 6;
    public static final int RANGE_DEPART = 1;
    public static final int RANGE_SCHOOL = 2;
    public static final int APPLY_STATUS_UNCONFIRMED = 1;
    public static final int APPLY_STATUS_CONFIRMED = 2;
    public static final int APPLY_STATUS_ACCEPTED = 3;
    public static final int APPLY_STATUS_REJECTED = -1;
    public static final int IDENTITY_STATUS_REJECTED = -1;
    public static final int IDENTITY_STATUS_AWAIT = 0;
    public static final int IDENTITY_STATUS_TODO = 1;
    public static final int IDENTITY_STATUS_ACCEPTED = Integer.MAX_VALUE;
    @Index(name="applyUseridIndex")
    private int applyUserid;	//申请人userid
    @Column(length = 128)
    private String organizerName;//主办方（者）名称：必须为校/系社工组织或班团名称
    @Column(length = 128)
    private String associateOrganizerName; //协办方（者）名称
    @Column(length = 32)
    private String applicantName; //申请人
    @Column(length = 20)
    private String applicantCell; //申请人联系电话
    private int activityType; //活动类型
    private String usageComment; //活动类型为其他时用户所填
    @Column(length = 32)
    private String managerName; //负责人
    @Column(length = 20)
    private String managerCell; //负责人联系电话
    @Column(length = 64)
    private String activityTheme; //活动主题
    private int participantsNumber; //活动参与人数
    private int activityRange; //活动对象：院系/全校
    private int applyPath; //申请通道
    @Column(length = 4000)
    private String activityContent; //活动具体内容和相关材料
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date activityDate;	//借用日期
    @Column(length = 40)
    private String timePeriod;	//借用时间段
    @Column(columnDefinition="DATETIME")
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    @Index(name="applyDateIndex")
    private Date applyDate; //申请日期
    @Column(columnDefinition="DATETIME")
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    @Index(name="confirmDateIndex")
    private Date confirmDate;	//确认申请日期
    @Index(name="applyStatusIndex")
    private int applyStatus;    //申请状态
    
//    //涉校外
//    @Column(length = 1024)
//    private String externalIntro; //校外人员情况简介
//    @Column(length = 1024)
//    private String externalOrganizationIntro; //校外合作单位情况介绍
//    @Column(length = 1024)
//    private String securityPreparedness; //出校活动的安全预案
//    //涉境外
//    @Column(length = 1024)
//    private String overseasIntro; //境外人员情况简介
//    @Column(length = 1024)
//    private String overseasOrganizationIntro; //境外合作单位情况介绍
//    @Column(length = 4000)
//    private String overseasMaterial; //相关材料
//    //教室申请
//    private int croomType; //借用教室类型
//    private int allowAdjust; //服从调剂
//    private int croomCapacity; //教室容量
//    @Temporal(javax.persistence.TemporalType.DATE)
//    private Date croomStartTime; //开始日期和时间
//    @Temporal(javax.persistence.TemporalType.DATE)
//    private Date croomEndTime; //结束日期和时间
//    //电子屏申请
//    @Column(length = 1024)
//    private String LEDContent; //电子屏显示内容
//    @Temporal(javax.persistence.TemporalType.DATE)
//    private Date LEDStartTime; //开始日期和时间
//    @Temporal(javax.persistence.TemporalType.DATE)
//    private Date LEDEndTime; //结束日期和时间
//    //室外场地申请
//    private int acticityLocation; //活动地点
//    @Temporal(javax.persistence.TemporalType.DATE)
//    private Date outsideBorrowDate;	//借用日期
//    private String outsideTimePeriod;	//借用时间段
//    //展板申请
//    @Column(length = 4000)
//    private String boardMaterial; //活动材料 附件
//    private int boardSize; //规格
//    @Temporal(javax.persistence.TemporalType.DATE)
//    private Date BoardStartTime; //开始日期和时间
//    @Temporal(javax.persistence.TemporalType.DATE)
//    private Date BoardEndTime; //结束日期和时间
//    //学生清华发布申请
//    @Column(length = 4000)
//    private String publicityMaterials; //宣传材料
//    //门票抽签申请
//    private int ticketNum; //门票数目
//    @Temporal(javax.persistence.TemporalType.DATE)
//    private Date ticketTime; //发票时间
//    @Column(length = 256)
//    private String ticketLocation; //发票地点
    
    @Index(name="identityTypeIndex")
    private int identityType;   //一级审批类型
    @Index(name="identityStatusIndex")
    private int identityStatus; //一级审批状态
    @Transient 
    private List<ApplyCommentEntity> comments; //一级审批意见
    @Column(columnDefinition="DATETIME")
    @Index(name="identityDateIndex")
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    private Date identityDate;	//一级审批日期


    
    /**
     * @return the organizerName
     */
    public String getOrganizerName() {
        return organizerName;
    }

    /**
     * @param organizerName the organizerName to set
     */
    public void setOrganizerName(String organizerName) {
        this.organizerName = organizerName;
    }

    /**
     * @return the associateOrganizerName
     */
    public String getAssociateOrganizerName() {
        return associateOrganizerName;
    }

    /**
     * @param associateOrganizerName the associateOrganizerName to set
     */
    public void setAssociateOrganizerName(String associateOrganizerName) {
        this.associateOrganizerName = associateOrganizerName;
    }

    /**
     * @return the applicantName
     */
    public String getApplicantName() {
        return applicantName;
    }

    /**
     * @param applicantName the applicantName to set
     */
    public void setApplicantName(String applicantName) {
        this.applicantName = applicantName;
    }

    /**
     * @return the applicantCell
     */
    public String getApplicantCell() {
        return applicantCell;
    }

    /**
     * @param applicantCell the applicantCell to set
     */
    public void setApplicantCell(String applicantCell) {
        this.applicantCell = applicantCell;
    }

    /**
     * @return the activityType
     */
    public int getActivityType() {
        return activityType;
    }

    /**
     * @param activityType the activityType to set
     */
    public void setActivityType(int activityType) {
        this.activityType = activityType;
    }

    /**
     * @return the managerName
     */
    public String getManagerName() {
        return managerName;
    }

    /**
     * @param managerName the managerName to set
     */
    public void setManagerName(String managerName) {
        this.managerName = managerName;
    }

    /**
     * @return the managerCell
     */
    public String getManagerCell() {
        return managerCell;
    }

    /**
     * @param managerCell the managerCell to set
     */
    public void setManagerCell(String managerCell) {
        this.managerCell = managerCell;
    }

    /**
     * @return the activityTheme
     */
    public String getActivityTheme() {
        return activityTheme;
    }

    /**
     * @param activityTheme the activityTheme to set
     */
    public void setActivityTheme(String activityTheme) {
        this.activityTheme = activityTheme;
    }

    /**
     * @return the participantsNumber
     */
    public int getParticipantsNumber() {
        return participantsNumber;
    }

    /**
     * @param participantsNumber the participantsNumber to set
     */
    public void setParticipantsNumber(int participantsNumber) {
        this.participantsNumber = participantsNumber;
    }

    /**
     * @return the activityRange
     */
    public int getActivityRange() {
        return activityRange;
    }

    /**
     * @param activityRange the activityRange to set
     */
    public void setActivityRange(int activityRange) {
        this.activityRange = activityRange;
    }

    /**
     * @return the activityContent
     */
    public String getActivityContent() {
        return activityContent;
    }

    /**
     * @param activityContent the activityContent to set
     */
    public void setActivityContent(String activityContent) {
        this.activityContent = activityContent;
    }

    /**
     * @return the activityDate
     */
    public Date getActivityDate() {
        return activityDate;
    }

    /**
     * @param activityDate the activityDate to set
     */
    public void setActivityDate(Date activityDate) {
        this.activityDate = activityDate;
    }

    /**
     * @return the timePeriod
     */
    public String getTimePeriod() {
        return timePeriod;
    }

    /**
     * @param timePeriod the timePeriod to set
     */
    public void setTimePeriod(String timePeriod) {
        this.timePeriod = timePeriod;
    }

    /**
     * @return the applyDate
     */
    public Date getApplyDate() {
        return applyDate;
    }

    /**
     * @param applyDate the applyDate to set
     */
    public void setApplyDate(Date applyDate) {
        this.applyDate = applyDate;
    }

    /**
     * @return the confirmDate
     */
    public Date getConfirmDate() {
        return confirmDate;
    }

    /**
     * @param confirmDate the confirmDate to set
     */
    public void setConfirmDate(Date confirmDate) {
        this.confirmDate = confirmDate;
    }



    /**
     * @return the identityType
     */
    public int getIdentityType() {
        return identityType;
    }

    /**
     * @param identityType the identityType to set
     */
    public void setIdentityType(int identityType) {
        this.identityType = identityType;
    }

    /**
     * @return the identityStatus
     */
    public int getIdentityStatus() {
        return identityStatus;
    }

    /**
     * @param identityStatus the identityStatus to set
     */
    public void setIdentityStatus(int identityStatus) {
        this.identityStatus = identityStatus;
    }

    /**
     * @return the comments
     */
    public List<ApplyCommentEntity> getComments() {
        return comments;
    }

    /**
     * @param comments the comments to set
     */
    public void setComments(List<ApplyCommentEntity> comments) {
        this.comments = comments;
    }

    /**
     * @return the identityDate
     */
    public Date getIdentityDate() {
        return identityDate;
    }

    /**
     * @param identityDate the identityDate to set
     */
    public void setIdentityDate(Date identityDate) {
        this.identityDate = identityDate;
    }

    /**
     * @return the applyUserid
     */
    public int getApplyUserid() {
        return applyUserid;
    }

    /**
     * @param applyUserid the applyUserid to set
     */
    public void setApplyUserid(int applyUserid) {
        this.applyUserid = applyUserid;
    }

    /**
     * @return the applyStatus
     */
    public int getApplyStatus() {
        return applyStatus;
    }

    /**
     * @param applyStatus the applyStatus to set
     */
    public void setApplyStatus(int applyStatus) {
        this.applyStatus = applyStatus;
    }

    /**
     * @return the applyPath
     */
    public int getApplyPath() {
        return applyPath;
    }

    /**
     * @param applyPath the applyPath to set
     */
    public void setApplyPath(int applyPath) {
        this.applyPath = applyPath;
    }

    /**
     * @return the usageComment
     */
    public String getUsageComment() {
        return usageComment;
    }

    /**
     * @param usageComment the usageComment to set
     */
    public void setUsageComment(String usageComment) {
        this.usageComment = usageComment;
    }
    
   
    
}
