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
    private int identityAuth;
    private StudentActivityApplyEntity applyEntity;
    private StudentApplyOptionsEntity optionsEntity;
    private boolean showConfirm;
    private boolean showApprove;
    private boolean showPublishEdit;
    private boolean showCancel;
    private boolean showModify; //校团委修改申请
    private String otherApproveString; //校团委选择的其他部门的审批状态
    private int digestButtonStatus; //是否显示加精按钮或者显示取消按钮
    private int approveType;
    private int showTicket;//抽票按钮
    private CommentEntity commentEntity;
    public static final int APPROVE_TYPE_IDENTITY = 1;
    public static final int APPROVE_TYPE_RESOURCE = 2;
    public static final int APPROVE_TYPE_ALLOCATE = 3;
    public static final int APPROVE_TYPE_GROUP = 4;
    public static final int APPROVE_TYPE_PUBLISH = 5;
    public static final int IDENTITY_SHETUANBU = 1;
    public static final int DIGEST_BUTTON_HIDE = 0;
    public static final int DIGEST_BUTTON_SHOW = 1;
    public static final int CANCEL_DIGEST_BUTTON_SHOW = 2;

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

    /**
     * @return the showPublishEdit
     */
    public boolean isShowPublishEdit() {
        return showPublishEdit;
    }

    /**
     * @param showPublishEdit the showPublishEdit to set
     */
    public void setShowPublishEdit(boolean showPublishEdit) {
        this.showPublishEdit = showPublishEdit;
    }

    /**
     * @return the identityAuth
     */
    public int getIdentityAuth() {
        return identityAuth;
    }

    /**
     * @param identityAuth the identityAuth to set
     */
    public void setIdentityAuth(int identityAuth) {
        this.identityAuth = identityAuth;
    }

    /**
     * @return the showCancel
     */
    public boolean isShowCancel() {
        return showCancel;
    }

    /**
     * @param showCancel the showCancel to set
     */
    public void setShowCancel(boolean showCancel) {
        this.showCancel = showCancel;
    }

    /**
     * @return the showModify
     */
    public boolean isShowModify() {
        return showModify;
    }

    /**
     * @param showModify the showModify to set
     */
    public void setShowModify(boolean showModify) {
        this.showModify = showModify;
    }

    /**
     * @return the otherApproveString
     */
    public String getOtherApproveString() {
        return otherApproveString;
    }

    /**
     * @param otherApproveString the otherApproveString to set
     */
    public void setOtherApproveString(String otherApproveString) {
        this.otherApproveString = otherApproveString;
    }

    /**
     * @return the digestButtonStatus
     */
    public int getDigestButtonStatus() {
        return digestButtonStatus;
    }

    /**
     * @param digestButtonStatus the digestButtonStatus to set
     */
    public void setDigestButtonStatus(int digestButtonStatus) {
        this.digestButtonStatus = digestButtonStatus;
    }

    /**
     * @return the showTicket
     */
    public int getShowTicket() {
        return showTicket;
    }

    /**
     * @param showTicket the showTicket to set
     */
    public void setShowTicket(int showTicket) {
        this.showTicket = showTicket;
    }
}
