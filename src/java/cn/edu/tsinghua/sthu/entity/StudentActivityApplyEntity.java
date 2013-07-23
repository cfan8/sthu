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
    @Column(length = 32)
    private String managerName; //负责人
    @Column(length = 20)
    private String managerCell; //负责人联系电话
    @Column(length = 64)
    private String activityTheme; //活动主题
    private int participantsNumber; //活动参与人数
    private int activityRange; //活动对象：院系/全校
    @Column(length = 4000)
    private String activityContent; //活动具体内容和相关材料
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date activityDate;	//借用日期
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
    private int applyStatus;
    
    //涉校外
    @Column(length = 1024)
    private String externalIntro; //校外人员情况简介
    @Column(length = 1024)
    private String externalOrganizationIntro; //校外合作单位情况介绍
    @Column(length = 1024)
    private String securityPreparedness; //出校活动的安全预案
    //涉境外
    @Column(length = 1024)
    private String overseasIntro; //境外人员情况简介
    @Column(length = 1024)
    private String overseasOrganizationIntro; //境外合作单位情况介绍
    @Column(length = 4000)
    private String overseasMaterial; //相关材料
    //教室申请
    private int croomType; //借用教室类型
    private int allowAdjust; //服从调剂
    private int croomCapacity; //教室容量
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date croomStartTime; //开始日期和时间
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date croomEndTime; //结束日期和时间
    //电子屏申请
    @Column(length = 1024)
    private String LEDContent; //电子屏显示内容
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date LEDStartTime; //开始日期和时间
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date LEDEndTime; //结束日期和时间
    //室外场地申请
    private int acticityLocation; //活动地点
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date outsideBorrowDate;	//借用日期
    private String outsideTimePeriod;	//借用时间段
    //展板申请
    @Column(length = 4000)
    private String boardMaterial; //活动材料 附件
    private int boardSize; //规格
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date BoardStartTime; //开始日期和时间
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date BoardEndTime; //结束日期和时间
    //学生清华发布申请
    @Column(length = 4000)
    private String publicityMaterials; //宣传材料
    //门票抽签申请
    private int ticketNum; //门票数目
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date ticketTime; //发票时间
    @Column(length = 256)
    private String ticketLocation; //发票地点
    
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
     * @return the externalIntro
     */
    public String getExternalIntro() {
        return externalIntro;
    }

    /**
     * @param externalIntro the externalIntro to set
     */
    public void setExternalIntro(String externalIntro) {
        this.externalIntro = externalIntro;
    }

    /**
     * @return the externalOrganizationIntro
     */
    public String getExternalOrganizationIntro() {
        return externalOrganizationIntro;
    }

    /**
     * @param externalOrganizationIntro the externalOrganizationIntro to set
     */
    public void setExternalOrganizationIntro(String externalOrganizationIntro) {
        this.externalOrganizationIntro = externalOrganizationIntro;
    }

    /**
     * @return the securityPreparedness
     */
    public String getSecurityPreparedness() {
        return securityPreparedness;
    }

    /**
     * @param securityPreparedness the securityPreparedness to set
     */
    public void setSecurityPreparedness(String securityPreparedness) {
        this.securityPreparedness = securityPreparedness;
    }

    /**
     * @return the overseasIntro
     */
    public String getOverseasIntro() {
        return overseasIntro;
    }

    /**
     * @param overseasIntro the overseasIntro to set
     */
    public void setOverseasIntro(String overseasIntro) {
        this.overseasIntro = overseasIntro;
    }

    /**
     * @return the overseasOrganizationIntro
     */
    public String getOverseasOrganizationIntro() {
        return overseasOrganizationIntro;
    }

    /**
     * @param overseasOrganizationIntro the overseasOrganizationIntro to set
     */
    public void setOverseasOrganizationIntro(String overseasOrganizationIntro) {
        this.overseasOrganizationIntro = overseasOrganizationIntro;
    }

    /**
     * @return the overseasMaterial
     */
    public String getOverseasMaterial() {
        return overseasMaterial;
    }

    /**
     * @param overseasMaterial the overseasMaterial to set
     */
    public void setOverseasMaterial(String overseasMaterial) {
        this.overseasMaterial = overseasMaterial;
    }

    /**
     * @return the croomType
     */
    public int getCroomType() {
        return croomType;
    }

    /**
     * @param croomType the croomType to set
     */
    public void setCroomType(int croomType) {
        this.croomType = croomType;
    }

    /**
     * @return the allowAdjust
     */
    public int getAllowAdjust() {
        return allowAdjust;
    }

    /**
     * @param allowAdjust the allowAdjust to set
     */
    public void setAllowAdjust(int allowAdjust) {
        this.allowAdjust = allowAdjust;
    }

    /**
     * @return the croomCapacity
     */
    public int getCroomCapacity() {
        return croomCapacity;
    }

    /**
     * @param croomCapacity the croomCapacity to set
     */
    public void setCroomCapacity(int croomCapacity) {
        this.croomCapacity = croomCapacity;
    }

    /**
     * @return the croomStartTime
     */
    public Date getCroomStartTime() {
        return croomStartTime;
    }

    /**
     * @param croomStartTime the croomStartTime to set
     */
    public void setCroomStartTime(Date croomStartTime) {
        this.croomStartTime = croomStartTime;
    }

    /**
     * @return the croomEndTime
     */
    public Date getCroomEndTime() {
        return croomEndTime;
    }

    /**
     * @param croomEndTime the croomEndTime to set
     */
    public void setCroomEndTime(Date croomEndTime) {
        this.croomEndTime = croomEndTime;
    }

    /**
     * @return the LEDContent
     */
    public String getLEDContent() {
        return LEDContent;
    }

    /**
     * @param LEDContent the LEDContent to set
     */
    public void setLEDContent(String LEDContent) {
        this.LEDContent = LEDContent;
    }

    /**
     * @return the LEDStartTime
     */
    public Date getLEDStartTime() {
        return LEDStartTime;
    }

    /**
     * @param LEDStartTime the LEDStartTime to set
     */
    public void setLEDStartTime(Date LEDStartTime) {
        this.LEDStartTime = LEDStartTime;
    }

    /**
     * @return the LEDEndTime
     */
    public Date getLEDEndTime() {
        return LEDEndTime;
    }

    /**
     * @param LEDEndTime the LEDEndTime to set
     */
    public void setLEDEndTime(Date LEDEndTime) {
        this.LEDEndTime = LEDEndTime;
    }

    /**
     * @return the acticityLocation
     */
    public int getActicityLocation() {
        return acticityLocation;
    }

    /**
     * @param acticityLocation the acticityLocation to set
     */
    public void setActicityLocation(int acticityLocation) {
        this.acticityLocation = acticityLocation;
    }

    /**
     * @return the outsideBorrowDate
     */
    public Date getOutsideBorrowDate() {
        return outsideBorrowDate;
    }

    /**
     * @param outsideBorrowDate the outsideBorrowDate to set
     */
    public void setOutsideBorrowDate(Date outsideBorrowDate) {
        this.outsideBorrowDate = outsideBorrowDate;
    }

    /**
     * @return the outsideTimePeriod
     */
    public String getOutsideTimePeriod() {
        return outsideTimePeriod;
    }

    /**
     * @param outsideTimePeriod the outsideTimePeriod to set
     */
    public void setOutsideTimePeriod(String outsideTimePeriod) {
        this.outsideTimePeriod = outsideTimePeriod;
    }

    /**
     * @return the boardMaterial
     */
    public String getBoardMaterial() {
        return boardMaterial;
    }

    /**
     * @param boardMaterial the boardMaterial to set
     */
    public void setBoardMaterial(String boardMaterial) {
        this.boardMaterial = boardMaterial;
    }

    /**
     * @return the boardSize
     */
    public int getBoardSize() {
        return boardSize;
    }

    /**
     * @param boardSize the boardSize to set
     */
    public void setBoardSize(int boardSize) {
        this.boardSize = boardSize;
    }

    /**
     * @return the BoardStartTime
     */
    public Date getBoardStartTime() {
        return BoardStartTime;
    }

    /**
     * @param BoardStartTime the BoardStartTime to set
     */
    public void setBoardStartTime(Date BoardStartTime) {
        this.BoardStartTime = BoardStartTime;
    }

    /**
     * @return the BoardEndTime
     */
    public Date getBoardEndTime() {
        return BoardEndTime;
    }

    /**
     * @param BoardEndTime the BoardEndTime to set
     */
    public void setBoardEndTime(Date BoardEndTime) {
        this.BoardEndTime = BoardEndTime;
    }

    /**
     * @return the publicityMaterials
     */
    public String getPublicityMaterials() {
        return publicityMaterials;
    }

    /**
     * @param publicityMaterials the publicityMaterials to set
     */
    public void setPublicityMaterials(String publicityMaterials) {
        this.publicityMaterials = publicityMaterials;
    }

    /**
     * @return the ticketNum
     */
    public int getTicketNum() {
        return ticketNum;
    }

    /**
     * @param ticketNum the ticketNum to set
     */
    public void setTicketNum(int ticketNum) {
        this.ticketNum = ticketNum;
    }

    /**
     * @return the ticketTime
     */
    public Date getTicketTime() {
        return ticketTime;
    }

    /**
     * @param ticketTime the ticketTime to set
     */
    public void setTicketTime(Date ticketTime) {
        this.ticketTime = ticketTime;
    }

    /**
     * @return the ticketLocation
     */
    public String getTicketLocation() {
        return ticketLocation;
    }

    /**
     * @param ticketLocation the ticketLocation to set
     */
    public void setTicketLocation(String ticketLocation) {
        this.ticketLocation = ticketLocation;
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
    
}
