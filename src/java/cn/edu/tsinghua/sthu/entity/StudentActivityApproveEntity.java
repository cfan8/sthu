/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.entity;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Temporal;
import org.hibernate.annotations.Index;

/**
 *
 * @author xiaobo
 */
@Entity
@Table(name="t_apply_approve")
public class StudentActivityApproveEntity extends BaseEntity{
    public static final int APPROVE_STEP_RESOURCE = 2;
    public static final int APPROVE_STEP_ALLOCATE = 3;
    
    @Index(name="applyIdIndex")
    private int applyId;
    
    private int approveStep;
    @Index(name="approveTypeIndex")
    private int approveType;
    @Index(name="approveStatusIndex")
    private int approveStatus;
    @Column(columnDefinition="DATETIME")
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    @Index(name="approveDateIndex")
    private Date approveDate;	

    /**
     * @return the applyId
     */
    public int getApplyId() {
        return applyId;
    }

    /**
     * @param applyId the applyId to set
     */
    public void setApplyId(int applyId) {
        this.applyId = applyId;
    }

    /**
     * @return the approveStep
     */
    public int getApproveStep() {
        return approveStep;
    }

    /**
     * @param approveStep the approveStep to set
     */
    public void setApproveStep(int approveStep) {
        this.approveStep = approveStep;
    }

    /**
     * @return the approveType
     */
    public int getApproveType() {
        return approveType;
    }

    /**
     * @param approveType the approveType to set
     */
    public void setApproveType(int approveType) {
        this.approveType = approveType;
    }

    /**
     * @return the approveStatus
     */
    public int getApproveStatus() {
        return approveStatus;
    }

    /**
     * @param approveStatus the approveStatus to set
     */
    public void setApproveStatus(int approveStatus) {
        this.approveStatus = approveStatus;
    }

    /**
     * @return the approveDate
     */
    public Date getApproveDate() {
        return approveDate;
    }

    /**
     * @param approveDate the approveDate to set
     */
    public void setApproveDate(Date approveDate) {
        this.approveDate = approveDate;
    }
    
    public String getApproveStatusText()
    {
	switch(this.approveStatus)
	{
	    case StudentActivityApplyEntity.ALLOCATE_STATUS_ACCEPTED:
		return "已通过";
	    case StudentActivityApplyEntity.ALLOCATE_STATUS_AWAIT:
		return "等待审批";
	    case StudentActivityApplyEntity.ALLOCATE_STATUS_TODO:
		return "正在审批";
	    case StudentActivityApplyEntity.ALLOCATE_STATUS_REJECTED:
		return "已驳回";
	}
	return "";
    }
}
