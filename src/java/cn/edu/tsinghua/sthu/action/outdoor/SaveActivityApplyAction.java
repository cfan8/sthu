/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action.outdoor;

import cn.edu.tsinghua.sthu.action.BaseAction;
import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.ActivityApplyEntity;
import cn.edu.tsinghua.sthu.security.XSSProtect;
import cn.edu.tsinghua.sthu.security.XSSProtectLevel;
import cn.edu.tsinghua.sthu.security.XSSProtectedClass;
import cn.edu.tsinghua.sthu.service.ApplyActivityService;
import java.util.*;
import java.text.*;

/**
 *
 * @author luzhen
 */
@XSSProtectedClass
public class SaveActivityApplyAction extends BaseAction{
    private Integer applyId;   
    private Integer applyType;
    
    @XSSProtect(XSSProtectLevel.Strict)
    private String activityName;
    
    @XSSProtect(XSSProtectLevel.RichText)
    private String activityContent;
    
    @XSSProtect(XSSProtectLevel.Strict)
    private String startTime;
    private Date startTime1;
    private Date endTime1;
    
    @XSSProtect(XSSProtectLevel.Strict)
    private String endTime;
    
    @XSSProtect(XSSProtectLevel.Strict)
    private String LEDContent;
    
    @XSSProtect(XSSProtectLevel.Strict)
    private String activityLocation;
    
    @XSSProtect(XSSProtectLevel.RichText)
    private String activityMaterial;
    
    @XSSProtect(XSSProtectLevel.Strict)
    private String organizerName;
    
    @XSSProtect(XSSProtectLevel.Strict)
    private String applicatantType;
    
    @XSSProtect(XSSProtectLevel.Strict)
    private String applicatantName;
    
    @XSSProtect(XSSProtectLevel.Strict)
    private String applicatantCell;
    
    @XSSProtect(XSSProtectLevel.Strict)
    private String applicatantEmail;
    private Integer applyPath;
    
    private ApplyActivityService applyActivityService;
    
    @Override
    public String onExecute()
    {
	ActivityApplyEntity entity;
        DateFormat date =  new SimpleDateFormat("yyyy-MM-dd HH:mm"); 
           try
           {           
               setStartTime1(date.parse(getStartTime()));
               setEndTime1(date.parse(getEndTime()));
           }
            catch (ParseException e) {                 e.printStackTrace();     }   
	if (getApplyId() == null || getApplyId() == -1)
	{
            if (getApplyType() == 1)
            {
                entity = getApplyActivityService().createActivityApply(getApplyType(), getActivityName(), 
    getActivityContent(), getStartTime1(), getEndTime1(), getLEDContent(), " ", " ",
     getOrganizerName(), getApplicatantType(), getApplicatantName(), getApplicatantCell(),
    getApplicatantEmail(), getApplyPath(), getCurrentUser().getID());
            }
	    else
            {
                entity = getApplyActivityService().createActivityApply(getApplyType(), getActivityName(), 
    getActivityContent(), getStartTime1(), getEndTime1(), " ", getActivityLocation(),
    getActivityMaterial(), getOrganizerName(), getApplicatantType(), getApplicatantName(), getApplicatantCell(),
    getApplicatantEmail(), getApplyPath(), getCurrentUser().getID());
            }
	}
	else
	{
        if (getApplyType() == 1)
            {
                entity = getApplyActivityService().modifyActivityApply(getApplyType(), getActivityName(), 
    getActivityContent(), getStartTime1(), getEndTime1(), getLEDContent(), " ", " ",
     getOrganizerName(), getApplicatantType(), getApplicatantName(), getApplicatantCell(),
    getApplicatantEmail(), getApplyPath(), getCurrentUser().getID(), getApplyId());
            }
	    else
            {
                entity = getApplyActivityService().modifyActivityApply(getApplyType(), getActivityName(), 
    getActivityContent(), getStartTime1(), getEndTime1(), " ", getActivityLocation(),
    getActivityMaterial(), getOrganizerName(), getApplicatantType(), getApplicatantName(), getApplicatantCell(),
    getApplicatantEmail(), getApplyPath(), getCurrentUser().getID(), getApplyId());
            }
	    if (entity == null)
	    {
		alertMessage.setSimpleAlert("只能修改未确认的活动申请！");
		return ALERT;
	    }
	}
	alertMessage.setSimpleAlert("保存成功！", "showActivityApply.do?applyId=" + entity.getID());
	return ALERT;
    }

    @Override
    public boolean valid() {
	if (isValid(getActivityName()) && isValid(getActivityContent()) && isValid(getActivityName()) 
                && isValid(getOrganizerName()) && isValid(getApplicatantType()) && isValid(getApplicatantName())
                && isValid(getApplicatantCell()) && isValid(getApplicatantEmail()) )
	{
            if (getApplyType() == 1)
            {
                if(isValid(getLEDContent())) {
                    if (getApplyPath() > 0) {
                        return true;
                    }
                }
            }
            else
            {
                if(isValid(getActivityLocation()) && isValid(getActivityMaterial())) {
                    if (getApplyPath() > 0) {
                        return true;
                    }
                }
            }
	}
	alertMessage.setSimpleAlert("请正确填写表单后再保存！");
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
            ActivityApplyEntity entity = getApplyActivityService().getActivityApplyEntityById(getApplyId(), getCurrentUser().getID());
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

    public Integer getApplyPath() {
        return applyPath;
    }

    public void setApplyPath(Integer applyPath) {
        this.applyPath = applyPath;
    }


    public ApplyActivityService getApplyActivityService() {
        return applyActivityService;
    }

    public void setApplyActivityService(ApplyActivityService applyActivityService) {
        this.applyActivityService = applyActivityService;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public Date getStartTime1() {
        return startTime1;
    }

    public void setStartTime1(Date startTime1) {
        this.startTime1 = startTime1;
    }

    public Date getEndTime1() {
        return endTime1;
    }

    public void setEndTime1(Date endTime1) {
        this.endTime1 = endTime1;
    }
    
}
