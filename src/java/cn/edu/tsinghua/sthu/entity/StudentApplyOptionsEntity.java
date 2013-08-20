/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.entity;

import java.util.*;
import javax.persistence.*;
import org.hibernate.annotations.Index;
/**
 *
 * @author xiaoyou
 */

@Entity
@Table(name="t_student_apply_options")
public class StudentApplyOptionsEntity extends BaseEntity{
    public static final int AREA_INSCHOOL = 1;
    public static final int AREA_OUTSCHOOL = 2;
    public static final int AREA_OUTCOUNTRY = 3;
    public static final int ROOMTYPE_ORDINARY = 1;
    public static final int ROOMTYPE_MEDIA = 2;
    public static final int ROOMTYPE_CBUILDING_NORMAL = 3;
    public static final int ROOMTYPE_CBUILDING_MEDIA = 4;
    public static final int CROOMFLAG_NOTAPPLY = 0;
    public static final int CROOMFLAG_APPLY = 1;
    public static final int ALLOWADJUST_ACCEPT = 0;
    public static final int ALLOWADJUST_REJECT = 1;
    public static final int LEDFLAG_NOTAPPLY = 0;
    public static final int LEDFLAG_APPLY = 1;
    public static final int OUTSIDEFLAG_NOTAPPLY = 0;
    public static final int OUTSIDEFLAG_APPLY = 1;
    public static final int LOCATION_ZIJING = 1;
    public static final int LOCATION_TAOLI = 2;
    public static final int LOCATION_TINGTAOSHULIN = 3;
    public static final int LOCATION_TINGTAOBEI = 4;
    public static final int BOARDFLAG_NOTAPPLY = 0;
    public static final int BOARDFLAG_APPLY = 1;
    public static final int PUBLICITYFLAG_NOTAPPLY = 0;
    public static final int PUBLICITYFLAG_APPLY = 1;
    public static final int TICKETFLAG_NOTAPPLY = 0;
    public static final int TICKETFLAG_APPLY = 1;
    
      
    @Index(name="applyUseridIndex")
    private int applyUserid;	//申请人userid
    
    private int activityArea; //活动范围，1：仅校内，2：涉校外，3：涉境外
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
    
    private int croomFlag; //标记是否申请教室
    //教室申请
    private int croomType; //借用教室类型
    private int allowAdjust; //服从调剂
    private int croomCapacity; //教室容量
    private String croomStartTime; //开始日期和时间
  //  @Temporal(javax.persistence.TemporalType.DATE)
    private String croomEndTime; //结束日期和时间
    
    private int LEDFlag; //标记是否申请电子屏
    //电子屏申请
    @Column(length = 1024)
    private String LEDContent; //电子屏显示内容
 //   @Temporal(javax.persistence.TemporalType.DATE)
    private String LEDStartTime; //开始日期和时间
 //   @Temporal(javax.persistence.TemporalType.DATE)
    private String LEDEndTime; //结束日期和时间
    
    private int outsideFlag; //标记是否申请室外场地
    //室外场地申请
    private int activityLocation; //活动地点
 //   @Temporal(javax.persistence.TemporalType.DATE)
    private String outsideBorrowDate;	//借用日期
    private String outsideTimePeriod;	//借用时间段
    
    private int boardFlag; //标记是否申请展板
    //展板申请
    @Column(length = 4000)
    private String boardMaterial; //活动材料 附件
    private int boardSize; //规格
 //   @Temporal(javax.persistence.TemporalType.DATE)
    private String BoardStartTime; //开始日期和时间
  //  @Temporal(javax.persistence.TemporalType.DATE)
    private String BoardEndTime; //结束日期和时间
    
    private int publicityFlag; //标记是否申请发布学生清华
    //学生清华发布申请
    @Column(length = 4000)
    private String publicityMaterials; //宣传材料
    
    private int ticketFlag; //标记是否申请门票抽签
    //门票抽签申请
    private int ticketNum; //门票数目
 //   @Temporal(javax.persistence.TemporalType.DATE)
    private String ticketTime; //发票时间
    @Column(length = 256)
    private String ticketLocation; //发票地点

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
    
    public String getCroomTypeText(){
        switch(this.croomType){
            case ROOMTYPE_ORDINARY:
                return "普通教室";
            case ROOMTYPE_MEDIA:
                return "多媒体教室";
            case ROOMTYPE_CBUILDING_NORMAL:
                return "C楼普通教室";
            case ROOMTYPE_CBUILDING_MEDIA:
                return "C楼多媒体教室";
            default:
                return "";
        }
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

    public String getAllowAdjustText(){
        switch(this.allowAdjust){
            case ALLOWADJUST_ACCEPT:
                return "是";
            case ALLOWADJUST_REJECT:
                return "否";
            default:
                return "";
        }
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
    public String getCroomStartTime() {
        return croomStartTime;
    }

    /**
     * @param croomStartTime the croomStartTime to set
     */
    public void setCroomStartTime(String croomStartTime) {
        this.croomStartTime = croomStartTime;
    }

    /**
     * @return the croomEndTime
     */
    public String getCroomEndTime() {
        return croomEndTime;
    }

    /**
     * @param croomEndTime the croomEndTime to set
     */
    public void setCroomEndTime(String croomEndTime) {
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
    public String getLEDStartTime() {
        return LEDStartTime;
    }

    /**
     * @param LEDStartTime the LEDStartTime to set
     */
    public void setLEDStartTime(String LEDStartTime) {
        this.LEDStartTime = LEDStartTime;
    }

    /**
     * @return the LEDEndTime
     */
    public String getLEDEndTime() {
        return LEDEndTime;
    }

    /**
     * @param LEDEndTime the LEDEndTime to set
     */
    public void setLEDEndTime(String LEDEndTime) {
        this.LEDEndTime = LEDEndTime;
    }

    /**
     * @return the activityLocation
     */
    public int getActivityLocation() {
        return activityLocation;
    }

    /**
     * @param activityLocation the activityLocation to set
     */
    public void setActivityLocation(int activityLocation) {
        this.activityLocation = activityLocation;
    }

    public String getActivityLocationText(){
        switch(this.activityLocation){
            case LOCATION_ZIJING:
                return "紫荆园门口";
            case LOCATION_TAOLI:
                return "桃李园门口";
            case LOCATION_TINGTAOSHULIN:
                return "听涛园附近小树林区域";
            case LOCATION_TINGTAOBEI:
                return "听涛园以北学堂路段学生生活区";
            default:
                return "";
        }
    }
    
    /**
     * @return the outsideBorrowDate
     */
    public String getOutsideBorrowDate() {
        return outsideBorrowDate;
    }

    /**
     * @param outsideBorrowDate the outsideBorrowDate to set
     */
    public void setOutsideBorrowDate(String outsideBorrowDate) {
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
    public String getBoardStartTime() {
        return BoardStartTime;
    }

    /**
     * @param BoardStartTime the BoardStartTime to set
     */
    public void setBoardStartTime(String BoardStartTime) {
        this.BoardStartTime = BoardStartTime;
    }

    /**
     * @return the BoardEndTime
     */
    public String getBoardEndTime() {
        return BoardEndTime;
    }

    /**
     * @param BoardEndTime the BoardEndTime to set
     */
    public void setBoardEndTime(String BoardEndTime) {
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
    public String getTicketTime() {
        return ticketTime;
    }

    /**
     * @param ticketTime the ticketTime to set
     */
    public void setTicketTime(String ticketTime) {
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
     * @return the activityArea
     */
    public int getActivityArea() {
        return activityArea;
    }

    /**
     * @param activityArea the activityArea to set
     */
    public void setActivityArea(int activityArea) {
        this.activityArea = activityArea;
    }

    /**
     * @return the croomFlag
     */
    public int getCroomFlag() {
        return croomFlag;
    }

    /**
     * @param croomFlag the croomFlag to set
     */
    public void setCroomFlag(int croomFlag) {
        this.croomFlag = croomFlag;
    }

    /**
     * @return the LEDFlag
     */
    public int getLEDFlag() {
        return LEDFlag;
    }

    /**
     * @param LEDFlag the LEDFlag to set
     */
    public void setLEDFlag(int LEDFlag) {
        this.LEDFlag = LEDFlag;
    }

    /**
     * @return the outsideFlag
     */
    public int getOutsideFlag() {
        return outsideFlag;
    }

    /**
     * @param outsideFlag the outsideFlag to set
     */
    public void setOutsideFlag(int outsideFlag) {
        this.outsideFlag = outsideFlag;
    }

    /**
     * @return the boardFlag
     */
    public int getBoardFlag() {
        return boardFlag;
    }

    /**
     * @param boardFlag the boardFlag to set
     */
    public void setBoardFlag(int boardFlag) {
        this.boardFlag = boardFlag;
    }

    /**
     * @return the publicityFlag
     */
    public int getPublicityFlag() {
        return publicityFlag;
    }

    /**
     * @param publicityFlag the publicityFlag to set
     */
    public void setPublicityFlag(int publicityFlag) {
        this.publicityFlag = publicityFlag;
    }

    /**
     * @return the ticketFlag
     */
    public int getTicketFlag() {
        return ticketFlag;
    }

    /**
     * @param ticketFlag the ticketFlag to set
     */
    public void setTicketFlag(int ticketFlag) {
        this.ticketFlag = ticketFlag;
    }

}
