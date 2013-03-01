/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.message.ShowMyClassroomApplyPageMessage;
import cn.edu.tsinghua.sthu.service.ApplyClassroomService;

/**
 *
 * @author linangran
 */
public class ShowMyClassroomApplyPageAction extends BaseAction{

    private Integer page;
    private ApplyClassroomService applyClassroomService;
    private ShowMyClassroomApplyPageMessage showMyClassroomApplyPageMessage;
    
    @Override
    public String onExecute() {
	showMyClassroomApplyPageMessage.setList(applyClassroomService.getPagedMyApplyList(getCurrentUser().getID(), page, 10));
	return SUCCESS;
    }

    @Override
    public boolean valid() {
	if (getPage() != null && getPage() > 0) {
	    return true;
	}
	else {
	    alertMessage.setSimpleAlert("参数错误！");
	    return false;
	}
    }
    
    @Override
    public boolean hasAuth() {
	if (getCurrentUser().getAuth().getRole() != AuthEntity.USER_ROLE)
	{
	    return false;
	}
	else
	{
	    return true;
	}
    }

    @Override
    public boolean needLogin() {
	return true;
    }

    public Integer getPage() {
	return page;
    }

    public void setPage(Integer page) {
	this.page = page;
    }

    public ApplyClassroomService getApplyClassroomService() {
	return applyClassroomService;
    }

    public void setApplyClassroomService(ApplyClassroomService applyClassroomService) {
	this.applyClassroomService = applyClassroomService;
    }

    public ShowMyClassroomApplyPageMessage getShowMyClassroomApplyPageMessage() {
	return showMyClassroomApplyPageMessage;
    }

    public void setShowMyClassroomApplyPageMessage(ShowMyClassroomApplyPageMessage showMyClassroomApplyPageMessage) {
	this.showMyClassroomApplyPageMessage = showMyClassroomApplyPageMessage;
    }
    
}
