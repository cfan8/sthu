/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message.outdoor;

import cn.edu.tsinghua.sthu.message.BaseMessage;
import cn.edu.tsinghua.sthu.entity.ActivityApplyEntity;

/**
 *
 * @author luzhen
 */
public class ShowActivityApplyMessage extends BaseMessage {
    private ActivityApplyEntity applyEntity;
    private boolean showConfirm;
    private boolean showApprove;
    private int approveType;
    
    public static final int APPROVE_TYPE_IDENTITY = 1;
    public static final int APPROVE_TYPE_RESOURCE = 2;

    public ActivityApplyEntity getApplyEntity() {
        return applyEntity;
    }

    public void setApplyEntity(ActivityApplyEntity applyEntity) {
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
    
}
