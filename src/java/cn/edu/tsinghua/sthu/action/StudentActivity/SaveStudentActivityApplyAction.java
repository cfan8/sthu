/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action.StudentActivity;
import cn.edu.tsinghua.sthu.action.BaseAction;
import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity;
import cn.edu.tsinghua.sthu.entity.StudentApplyOptionsEntity;
import cn.edu.tsinghua.sthu.security.XSSProtect;
import cn.edu.tsinghua.sthu.security.XSSProtectLevel;
import cn.edu.tsinghua.sthu.security.XSSProtectedClass;
import cn.edu.tsinghua.sthu.service.ApplyStudentActivityService;
import cn.edu.tsinghua.sthu.service.StudentApplyOptionsService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author xiaobo
 */
@XSSProtectedClass
public class SaveStudentActivityApplyAction extends BaseAction{
    @XSSProtect(XSSProtectLevel.Strict)
    private String organizerName;	//单位名称
    
    @XSSProtect(XSSProtectLevel.Strict)
    private String associateOrganizerName;	//协办单位名称
    
    @XSSProtect(XSSProtectLevel.Strict)
    private String applicantName;	//申请人
    
    @XSSProtect(XSSProtectLevel.Strict)
    private String applicantCell;    //申请人联系电话
    
    private Integer activityType;	//活动类型
    
    @XSSProtect(XSSProtectLevel.Strict)
    private String usageComment;
    
    @XSSProtect(XSSProtectLevel.RichText)
    private String activityContent; //具体内容
    
    @XSSProtect(XSSProtectLevel.Strict)
    private String managerName; //负责人
    
    @XSSProtect(XSSProtectLevel.Strict)
    private String managerCell;	//负责人联系电话
    private Date activityDate;	//活动日期
    
    @XSSProtect(XSSProtectLevel.Strict)
    private String timePeriod;	//活动时间段
    private Integer participantsNumber;	//活动参与人数
    
    @XSSProtect(XSSProtectLevel.Strict)
    private String activityTheme;  //活动名称
    private Integer applyId;    //用于修改申请时使用
    private Integer activityRange;  //活动对象
    private Integer applyType;  //一级审批部门

    private Integer activityArea; //活动范围
    @XSSProtect(XSSProtectLevel.Strict)
    private String externalIntro;   //校外人员情况简介
    @XSSProtect(XSSProtectLevel.Strict)
    private String externalOrganizationIntro;   //校外合作单位情况简介
    @XSSProtect(XSSProtectLevel.RichText)
    private String securityPreparedness;    //出校活动安全预案
    
    @XSSProtect(XSSProtectLevel.Strict)
    private String overseasIntro;   //境外人员情况简介
    @XSSProtect(XSSProtectLevel.Strict)
    private String overseasOrganizationIntro;   //境外合作单位情况介绍
    @XSSProtect(XSSProtectLevel.RichText)
    private String overseasMaterial;    //相关材料
    
    //教室申请
    private int croomFlag; //标记是否申请教室，1：申请，2：不申请
    private int croomType; //借用教室类型
    private int allowAdjust; //服从调剂
    private int croomCapacity; //教室容量
    @XSSProtect(XSSProtectLevel.Strict)
    private String croomStartTime; //开始日期和时间
    @XSSProtect(XSSProtectLevel.Strict)
    private String croomEndTime; //结束日期和时间
    
    //电子屏申请
    private int LEDFlag; //标记是否申请电子屏，1：申请，2：不申请
    @XSSProtect(XSSProtectLevel.Strict)
    private String LEDContent; //电子屏显示内容
    @XSSProtect(XSSProtectLevel.Strict)
    private String LEDStartTime; //开始日期和时间
    @XSSProtect(XSSProtectLevel.Strict)
    private String LEDEndTime; //结束日期和时间
    
    //室外场地申请
    private int outsideFlag; //标记是否申请室外场地，1：申请，2：不申请
    private int activityLocation; //活动地点
    private String outsideBorrowDate;	//借用日期
    private String outsideTimePeriod;	//借用时间段
    
    //展板申请
    private int boardFlag; //标记是否申请展板，1：申请，2：不申请
    @XSSProtect(XSSProtectLevel.RichText)
    private String boardMaterial; //活动材料 附件
    private int boardSize; //规格
    @XSSProtect(XSSProtectLevel.Strict)
    private String BoardStartTime; //开始日期和时间
    @XSSProtect(XSSProtectLevel.Strict)
    private String BoardEndTime; //结束日期和时间
    
    //学生清华发布申请
    private int publicityFlag; //标记是否申请发布学生清华，1：申请，2：不申请
    @XSSProtect(XSSProtectLevel.RichText)
    private String publicityMaterials; //宣传材料
    
    //门票抽签申请
    private int ticketFlag; //标记是否申请门票抽签，1：申请，2：不申请
    private int ticketNum; //门票数目
    @XSSProtect(XSSProtectLevel.Strict)
    private String ticketTime; //发票时间
    @XSSProtect(XSSProtectLevel.Strict)
    private String ticketLocation; //发票地点
    
    private ApplyStudentActivityService applyStudentActivityService;
    private StudentApplyOptionsService studentApplyOptionsService;
    @Override
    public String onExecute() throws Exception {
    //    this.setApplicantName(getCurrentUser().getNickname());
	StudentActivityApplyEntity entity;
        StudentApplyOptionsEntity option;
	if (applyId == null || applyId == -1) {
            option = getStudentApplyOptionsService().createStudentApplyOptions(getCurrentUser().getID(), getActivityArea(), getExternalIntro(), getExternalOrganizationIntro(), getSecurityPreparedness(), getOverseasIntro(), getOverseasOrganizationIntro(), getOverseasMaterial(),
                    getCroomFlag(), getCroomType(), getAllowAdjust(), getCroomCapacity(), getCroomStartTime(), getCroomEndTime(), getLEDFlag(), getLEDContent(), getLEDStartTime(), getLEDEndTime(), getOutsideFlag(), getActivityLocation(),
                    getOutsideBorrowDate(), getOutsideTimePeriod(), getBoardFlag(), getBoardMaterial(), getBoardSize(), getBoardStartTime(), getBoardEndTime(), getPublicityFlag(), getPublicityMaterials(), getTicketFlag(),
                    getTicketNum(), getTicketTime(), getTicketLocation());
	    entity = getApplyStudentActivityService().createStudentActivityApply(getOrganizerName(), getAssociateOrganizerName(),getApplicantName(), getApplicantCell(), getActivityType(), getUsageComment(), getActivityContent(), getManagerName(), getManagerCell(), getActivityDate(), getTimePeriod(), getParticipantsNumber(), getActivityTheme(),
		    getCurrentUser().getID(), getActivityRange(), getApplyType(), option);
            
	} else {
            
	    entity = getApplyStudentActivityService().modifyStudentActivityApply(getOrganizerName(), getAssociateOrganizerName(),getApplicantName(), getApplicantCell(), getActivityType(), getUsageComment(), getActivityContent(), getManagerName(), getManagerCell(), getActivityDate(), getTimePeriod(), getParticipantsNumber(), getActivityTheme(),
		    getCurrentUser().getID(), getActivityRange(), getApplyType(), applyId);
            option = getStudentApplyOptionsService().modifyStudentApplyOptions(getCurrentUser().getID(), getActivityArea(), getExternalIntro(), getExternalOrganizationIntro(), getSecurityPreparedness(), getOverseasIntro(), getOverseasOrganizationIntro(), getOverseasMaterial(),
                    getCroomFlag(), getCroomType(), getAllowAdjust(), getCroomCapacity(), getCroomStartTime(), getCroomEndTime(), getLEDFlag(), getLEDContent(), getLEDStartTime(), getLEDEndTime(), getOutsideFlag(), getActivityLocation(),
                    getOutsideBorrowDate(), getOutsideTimePeriod(), getBoardFlag(), getBoardMaterial(), getBoardSize(), getBoardStartTime(), getBoardEndTime(), getPublicityFlag(), getPublicityMaterials(), getTicketFlag(),
                    getTicketNum(), getTicketTime(), getTicketLocation(), entity.getOption().getID());
	    if (entity == null) {
		alertMessage.setSimpleAlert("只能修改未确认的教室申请！");
		return ALERT;
	    }
	}
	alertMessage.setSimpleAlert("已保存，请确认申请！", "showStudentActivityApply.do?applyId=" + entity.getID());
	return ALERT;
    }

    @Override
    public boolean valid() {
       if (isValid(getOrganizerName()) && isValid(getAssociateOrganizerName()) && isValid(getApplicantName()) && isValid(getApplicantCell()) && isValid(getUsageComment())
		&& isValid(getActivityContent()) && isValid(getManagerName()) && isValid(getManagerCell()) && isValid(getTimePeriod())
		&& isValid(getActivityTheme()) && activityType != null  && participantsNumber != null && activityRange != null && activityDate != null) {
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    Date now = new Date();
	    try {
		now = sdf.parse(sdf.format(now));
	    } catch (ParseException ex) {
		Logger.getLogger(SaveStudentActivityApplyAction.class.getName()).log(Level.SEVERE, null, ex);
	    }
	    long dt = activityDate.getTime() - now.getTime();
	    if (dt > 10 * 24 * 3600 * 1000 || dt < 0) {
		alertMessage.setSimpleAlert("日期不合法");
		return false;
	    }
	    if (getParticipantsNumber() > 0 && getActivityRange() > 0) {
		return true;
	    }
	}
	alertMessage.setSimpleAlert("请完整填写表单后再保存！");
	return false;
    }

    @Override
    public boolean hasAuth(){
        if (getCurrentUser().getAuth().getRole() != AuthEntity.USER_ROLE && getCurrentUser().getAuth().getRole() != AuthEntity.GROUP_ROLE) {
	    return false;
	}
	if (getApplyId() != -1) {
	    StudentActivityApplyEntity entity = getApplyStudentActivityService().getStudentActivityApplyEntityById(getApplyId(), getCurrentUser().getID());
	    if (entity == null) {
		return false;
	    }
	}
	return true;
    }
    
    @Override
    public boolean needLogin() {
        return true;
    }

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
    public Integer getActivityType() {
        return activityType;
    }

    /**
     * @param activityType the activityType to set
     */
    public void setActivityType(Integer activityType) {
        this.activityType = activityType;
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
     * @return the participantsNumber
     */
    public Integer getParticipantsNumber() {
        return participantsNumber;
    }

    /**
     * @param participantsNumber the participantsNumber to set
     */
    public void setParticipantsNumber(Integer participantsNumber) {
        this.participantsNumber = participantsNumber;
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
     * @return the activityRange
     */
    public Integer getActivityRange() {
        return activityRange;
    }

    /**
     * @param activityRange the activityRange to set
     */
    public void setActivityRange(Integer activityRange) {
        this.activityRange = activityRange;
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
     * @return the applyType
     */
    public Integer getApplyType() {
        return applyType;
    }

    /**
     * @param applyType the applyType to set
     */
    public void setApplyType(Integer applyType) {
        this.applyType = applyType;
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
     * @return the studentApplyOptionsService
     */
    public StudentApplyOptionsService getStudentApplyOptionsService() {
        return studentApplyOptionsService;
    }

    /**
     * @param studentApplyOptionsService the studentApplyOptionsService to set
     */
    public void setStudentApplyOptionsService(StudentApplyOptionsService studentApplyOptionsService) {
        this.studentApplyOptionsService = studentApplyOptionsService;
    }

    /**
     * @return the activityArea
     */
    public Integer getActivityArea() {
        return activityArea;
    }

    /**
     * @param activityArea the activityArea to set
     */
    public void setActivityArea(Integer activityArea) {
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
    
}
