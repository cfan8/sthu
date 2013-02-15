/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message;

import cn.edu.tsinghua.sthu.entity.CRoomApplyEntity;

/**
 *
 * @author linangran
 */
public class ShowApplyClassroomPageMessage extends BaseMessage{
    
    private CRoomApplyEntity applyEntity;
    private boolean modify;

    public CRoomApplyEntity getApplyEntity() {
	return applyEntity;
    }

    public void setApplyEntity(CRoomApplyEntity applyEntity) {
	this.applyEntity = applyEntity;
    }

    public boolean isModify() {
	return modify;
    }

    public void setModify(boolean modify) {
	this.modify = modify;
    }
    
}
