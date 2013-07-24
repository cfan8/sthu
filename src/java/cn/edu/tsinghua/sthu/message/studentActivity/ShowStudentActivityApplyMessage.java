/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message.studentActivity;

import cn.edu.tsinghua.sthu.message.BaseMessage;
import cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity;
/**
 *
 * @author xiaobo
 */
public class ShowStudentActivityApplyMessage extends BaseMessage{
    private StudentActivityApplyEntity applyEntity;
    private boolean showConfirm;
    private boolean showApprove;
    private int approveType;
    
    public static final int APPROVE_TYPE_IDENTITY = 1;
    public static final int APPROVE_TYPE_RESOURCE = 2;

    /**
     * @return the applyEntity
     */
    public StudentActivityApplyEntity getApplyEntity() {
        return applyEntity;
    }

    /**
     * @param applyEntity the applyEntity to set
     */
    public void setApplyEntity(StudentActivityApplyEntity applyEntity) {
        this.applyEntity = applyEntity;
    }

    /**
     * @return the showConfirm
     */
    public boolean isShowConfirm() {
        return showConfirm;
    }

    /**
     * @param showConfirm the showConfirm to set
     */
    public void setShowConfirm(boolean showConfirm) {
        this.showConfirm = showConfirm;
    }

    /**
     * @return the showApprove
     */
    public boolean isShowApprove() {
        return showApprove;
    }

    /**
     * @param showApprove the showApprove to set
     */
    public void setShowApprove(boolean showApprove) {
        this.showApprove = showApprove;
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
}
