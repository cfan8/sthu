/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.entity;

import cn.edu.tsinghua.sthu.constant.IdentityMapping;
import java.util.*;
import javax.persistence.*;

/**
 *
 * @author luzhen
 */

@Entity
@Table(name = "t_activity_apply")
public class ActivityApplyEntity extends BaseEntity {
    public static final int APPLICATION_TYPE_LED = 1;
    public static final int APPLICATION_TYPE_OUTDOOR = 2;
    public static final int APPLICATION_TYPE_BOARD = 3;
    
    public static final int APPLYSTATUS_TYPE_UNCONFIRMED = 1;
    public static final int APPLYSTATUS_TYPE_CONFIRMED_BY_FALCUTY = 2;
    public static final int APPLYSTATUS_TYPE_REJECTED_BY_FALCUTY = 3;
    public static final int APPLYSTATUS_TYPE_REVISED_TO_FALCUTY = 4;
    public static final int APPLYSTATUS_TYPE_CONFIRMED_BY_TEACHER = 5;
    public static final int APPLYSTATUS_TYPE_REJECTED_BY_TEACHER = 6;
    public static final int APPLYSTATUS_TYPE_REVISED_TO_TEACHER = 7;
    
    private int applicationType;//申请类型
    @Column(length = 64)
    private String activityName;//活动名称
    @Column(length = 5000)
    private String activityContent;//活动说明
    @Column(columnDefinition="DATETIME")
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    private Date startTime;//开始时间
    @Column(columnDefinition="DATETIME")
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    private Date endTime;//结束时间
    @Column(length = 32)
    private String applicatantName//申请人;
    @Column(length = 5000)
    private String LEDContent;//电子屏显示内容
    private String activityLocation;//活动地点
    @Column(length = 5000)
    private String activityMaterial;//活动材料（这项是干嘛..)
    @Column(length = 64)
    private String organizerName;//主办单位
    private int applicatantType;//申请单位
    @Column(length = 32)
    private String applicatantCell;//联系电话
    private String applicatantEmail;//电子邮箱
    private boolean isLecture;
    
    private int applyStatus;//申请状态
    private int applyUserID;//申请人ID
    @Column(columnDefinition="DATETIME")
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    private Date applyTime;//申请时间

    public ActivityApplyEntity()
    {
        
    }
    
    public int getApplicationType() {
        return applicationType;
    }

    public void setApplicationType(int applicationType) {
        this.applicationType = applicationType;
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

    public String getApplicatantName() {
        return applicatantName;
    }

    public void setApplicatantName(String applicatantName) {
        this.applicatantName = applicatantName;
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

    public int getApplicatantType() {
        return applicatantType;
    }

    public void setApplicatantType(int applicatantType) {
        this.applicatantType = applicatantType;
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

    public boolean isIsLecture() {
        return isLecture;
    }

    public void setIsLecture(boolean isLecture) {
        this.isLecture = isLecture;
    }

    public int getApplyStatus() {
        return applyStatus;
    }

    public void setApplyStatus(int applyStatus) {
        this.applyStatus = applyStatus;
    }

    public int getApplyUserID() {
        return applyUserID;
    }

    public void setApplyUserID(int applyUserID) {
        this.applyUserID = applyUserID;
    }

    public Date getApplyTime() {
        return applyTime;
    }

    public void setApplyTime(Date applyTime) {
        this.applyTime = applyTime;
    }
}
