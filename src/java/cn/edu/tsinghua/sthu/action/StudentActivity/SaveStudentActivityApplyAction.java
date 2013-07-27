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
    private String externalOrganizationIntro;   //校外合作单位情况简介
    private String securityPreparedness;    //出校活动安全预案
    
    @XSSProtect(XSSProtectLevel.Strict)
    private String overseasIntro;   //境外人员情况简介
    private String overseasOrganizationIntro;   //境外合作单位情况介绍
    private String overseasMaterial;    //相关材料
    
    private ApplyStudentActivityService applyStudentActivityService;
    private StudentApplyOptionsService studentApplyOptionsService;
    @Override
    public String onExecute() throws Exception {
        this.setApplicantName(getCurrentUser().getNickname());
	StudentActivityApplyEntity entity;
        StudentApplyOptionsEntity option;
	if (applyId == null || applyId == -1) {
	    entity = getApplyStudentActivityService().createStudentActivityApply(getOrganizerName(), getAssociateOrganizerName(),getApplicantName(), getApplicantCell(), getActivityType(), getUsageComment(), getActivityContent(), getManagerName(), getManagerCell(), getActivityDate(), getTimePeriod(), getParticipantsNumber(), getActivityTheme(),
		    getCurrentUser().getID(), getActivityRange(), getApplyType());
            option = getStudentApplyOptionsService().createStudentApplyOptions(getCurrentUser().getID(), getActivityArea(), getExternalIntro(), getExternalOrganizationIntro(), getSecurityPreparedness(), getOverseasIntro(), getOverseasOrganizationIntro(), getOverseasMaterial());
	} else {
	    entity = getApplyStudentActivityService().modifyStudentActivityApply(getOrganizerName(), getAssociateOrganizerName(),getApplicantName(), getApplicantCell(), getActivityType(), getUsageComment(), getActivityContent(), getManagerName(), getManagerCell(), getActivityDate(), getTimePeriod(), getParticipantsNumber(), getActivityTheme(),
		    getCurrentUser().getID(), getActivityRange(), getApplyType(),applyId);
	    if (entity == null) {
		alertMessage.setSimpleAlert("只能修改未确认的教室申请！");
		return ALERT;
	    }
	}
	alertMessage.setSimpleAlert("已保存，请确认申请！", "showApply.do?applyId=" + entity.getID());
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
        if (getCurrentUser().getAuth().getRole() != AuthEntity.USER_ROLE) {
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
    
}
