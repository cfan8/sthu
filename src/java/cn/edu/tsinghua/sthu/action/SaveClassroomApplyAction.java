/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.CRoomApplyEntity;
import cn.edu.tsinghua.sthu.service.ApplyClassroomService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author linangran
 */
public class SaveClassroomApplyAction extends BaseAction{

    private String organizer;	//单位名称
    private String borrower;	//借用人
    private String borrowerCell;    //借用人联系电话
    private Integer classUsage;	//用处:常量见下
    private String usageComment;
    private String content; //具体内容
    private String manager; //负责人
    private String managerCell;	//负责人联系电话
    private Date borrowDate;	//借用日期
    private String timePeriod;	//借用时间段
    private Integer croomtype;  //借用教室类型:常量见下
    private Integer number;	//教室借用人数
    private String title;  //借用原因
    private Integer applyId;    //用于修改申请时使用
    private Integer applyType;  //申请通道设置
    
    private ApplyClassroomService applyClassroomService;
    
    @Override
    public String onExecute()
    {
	CRoomApplyEntity entity;
	if (applyId == null || applyId == -1)
	{
	    entity = getApplyClassroomService().createCRoomApply(getOrganizer(), getBorrower(), getBorrowerCell(), getClassUsage(), getUsageComment(), getContent(), getManager(), getManagerCell(), getBorrowDate(), getTimePeriod(), getCroomtype(), getNumber(), getTitle(),
		    getCurrentUser().getID(), getApplyType());
	}
	else
	{
	    entity = getApplyClassroomService().modifyCRoomApply(getOrganizer(), getBorrower(), getBorrowerCell(), getClassUsage(), getUsageComment(), getContent(), getManager(), getManagerCell(), getBorrowDate(), getTimePeriod(), getCroomtype(), getNumber(), getTitle(), 
		    getCurrentUser().getID(), getApplyType(), applyId);
	    if (entity == null)
	    {
		alertMessage.setSimpleAlert("只能修改未确认的教室申请！");
		return ALERT;
	    }
	}
	alertMessage.setSimpleAlert("已保存，请确认申请！", "showApply.do?applyId=" + entity.getID());
	return ALERT;
    }

    @Override
    public boolean valid() {
	if (isValid(getOrganizer()) && isValid(getBorrower()) && isValid(getBorrowerCell()) &&isValid(getUsageComment())
		&& isValid(getContent()) && isValid(getManager()) && isValid(getManagerCell()) && isValid(getTimePeriod())
		&&isValid(getTitle()) && classUsage != null && croomtype != null && number != null && applyType != null && borrowDate != null)
	{
	    if (getNumber() > 0 && getApplyType() > 0) {
		return true;
	    }
	}
	alertMessage.setSimpleAlert("请完整填写表单后再保存！");
	return false;
    }
    
    @Override
    public boolean hasAuth()
    {
	if (getCurrentUser().getAuth().getRole() != AuthEntity.USER_ROLE) {
	    return false;
	}
	if (getApplyId() != -1)
	{
	    CRoomApplyEntity entity = getApplyClassroomService().getCRoomApplyEntityById(getApplyId(), getCurrentUser().getID());
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

    public Integer getClassUsage() {
	return classUsage;
    }

    public void setClassUsage(Integer classUsage) {
	this.classUsage = classUsage;
    }

    public String getUsageComment() {
	return usageComment;
    }

    public void setUsageComment(String usageComment) {
	this.usageComment = usageComment;
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

    public void setBorrowDate(String borrowDate) {
	try {
	    this.borrowDate = new SimpleDateFormat("yyyy-MM-dd").parse(borrowDate);
	} catch (ParseException ex) {
	    Logger.getLogger(SaveClassroomApplyAction.class.getName()).log(Level.SEVERE, null, ex);
	}
    }

    public String getTimePeriod() {
	return timePeriod;
    }

    public void setTimePeriod(String timePeriod) {
	this.timePeriod = timePeriod;
    }

    public Integer getCroomtype() {
	return croomtype;
    }

    public void setCroomtype(Integer croomtype) {
	this.croomtype = croomtype;
    }

    public Integer getNumber() {
	return number;
    }

    public void setNumber(Integer number) {
	this.number = number;
    }

    public String getTitle() {
	return title;
    }

    public void setTitle(String title) {
	this.title = title;
    }

    public Integer getApplyId() {
	return applyId;
    }

    public void setApplyId(Integer applyId) {
	this.applyId = applyId;
    }

    public Integer getApplyType() {
	return applyType;
    }

    public void setApplyType(Integer applyType) {
	this.applyType = applyType;
    }

    public ApplyClassroomService getApplyClassroomService() {
	return applyClassroomService;
    }

    public void setApplyClassroomService(ApplyClassroomService applyClassroomService) {
	this.applyClassroomService = applyClassroomService;
    }
}
