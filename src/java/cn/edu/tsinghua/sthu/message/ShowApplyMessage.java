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

    public CRoomApplyEntity getApplyEntity() {
	return applyEntity;
    }

    public void setApplyEntity(CRoomApplyEntity applyEntity) {
	this.applyEntity = applyEntity;
    }
}
