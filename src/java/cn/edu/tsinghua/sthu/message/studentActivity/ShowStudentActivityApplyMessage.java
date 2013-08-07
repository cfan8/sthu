/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message.studentActivity;

import cn.edu.tsinghua.sthu.entity.CommentEntity;
import cn.edu.tsinghua.sthu.message.BaseMessage;
import cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity;
import cn.edu.tsinghua.sthu.entity.StudentApplyOptionsEntity;
/**
 *
 * @author xiaobo
 */
public class ShowStudentActivityApplyMessage extends BaseMessage{
    private StudentActivityApplyEntity applyEntity;
    private StudentApplyOptionsEntity optionsEntity;
    private boolean showConfirm;
    private boolean showApprove;
    private int approveType;
    private CommentEntity commentEntity;
    public static final int APPROVE_TYPE_IDENTITY = 1;
    public static final int APPROVE_TYPE_RESOURCE = 2;
     public static final int APPROVE_TYPE_ALLOCATE = 3;
     public static final int APPROVE_TYPE_GROUP = 4;

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

    /**
     * @return the commentEntity
     */
    public CommentEntity getCommentEntity() {
        return commentEntity;
    }

    /**
     * @param commentEntity the commentEntity to set
     */
    public void setCommentEntity(CommentEntity commentEntity) {
        this.commentEntity = commentEntity;
    }

    /**
     * @return the optionsEntity
     */
    public StudentApplyOptionsEntity getOptionsEntity() {
        return optionsEntity;
    }

    /**
     * @param optionsEntity the optionsEntity to set
     */
    public void setOptionsEntity(StudentApplyOptionsEntity optionsEntity) {
        this.optionsEntity = optionsEntity;
    }
}
