package cn.edu.tsinghua.sthu.message;

import cn.edu.tsinghua.sthu.entity.CRoomApplyEntity;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author linangran
 */
public class ShowApplyMessage extends BaseMessage{
    private CRoomApplyEntity applyEntity;
    private boolean showConfirm;
    private boolean showApprove;
    private boolean showComment;
    private int approveType;
    
    public static final int APPROVE_TYPE_IDENTITY = 1;
    public static final int APPROVE_TYPE_RESOURCE = 2;
    public static final int APPROVE_TYPE_ALLOCATE = 3;
    

    public CRoomApplyEntity getApplyEntity() {
	return applyEntity;
    }

    public void setApplyEntity(CRoomApplyEntity applyEntity) {
	this.applyEntity = applyEntity;
    }

    public boolean isShowConfirm() {
	return showConfirm;
    }

    public void setShowConfirm(boolean showConfirm) {
	this.showConfirm = showConfirm;
    }

    public boolean isShowApprove() {
	return showApprove;
    }

    public void setShowApprove(boolean showApprove) {
	this.showApprove = showApprove;
    }

    public int getApproveType() {
	return approveType;
    }

    public void setApproveType(int approveType) {
	this.approveType = approveType;
    }

    public boolean isShowComment() {
        return showComment;
    }

    public void setShowComment(boolean showComment) {
        this.showComment = showComment;
    }

}
