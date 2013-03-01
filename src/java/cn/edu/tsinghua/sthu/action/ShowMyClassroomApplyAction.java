/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.message.ShowMyClassroomApplyMessage;
import cn.edu.tsinghua.sthu.service.ApplyClassroomService;

/**
 *
 * @author linangran
 */
public class ShowMyClassroomApplyAction extends BaseAction{
    
    private ShowMyClassroomApplyMessage showMyClassroomApplyMessage;
    private ApplyClassroomService applyClassroomService;
    
    @Override
    public String onExecute() {
	showMyClassroomApplyMessage.setTotalPageNumber(applyClassroomService.getMyApplyTotalPageNumber(getCurrentUser().getID(), 10));
	return SUCCESS;
    }

    @Override
    public boolean hasAuth()
    {
	if (getCurrentUser().getAuth().getRole() != AuthEntity.USER_ROLE) {
	    return false;
	}
	else {
	    return true;
	}
    }
    
    @Override
    public boolean valid() {
	return true;
    }

    @Override
    public boolean needLogin() {
	return true;
    }

    public ShowMyClassroomApplyMessage getShowMyClassroomApplyMessage() {
	return showMyClassroomApplyMessage;
    }

    public void setShowMyClassroomApplyMessage(ShowMyClassroomApplyMessage showMyClassroomApplyMessage) {
	this.showMyClassroomApplyMessage = showMyClassroomApplyMessage;
    }

    public ApplyClassroomService getApplyClassroomService() {
	return applyClassroomService;
    }

    public void setApplyClassroomService(ApplyClassroomService applyClassroomService) {
	this.applyClassroomService = applyClassroomService;
    }
    
    
    
}
