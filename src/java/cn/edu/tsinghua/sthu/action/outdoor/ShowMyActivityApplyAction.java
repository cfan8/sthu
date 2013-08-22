/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action.outdoor;

import cn.edu.tsinghua.sthu.action.BaseAction;
import cn.edu.tsinghua.sthu.message.outdoor.ShowMyActivityApplyMessage;
import cn.edu.tsinghua.sthu.service.ApplyActivityService;
import cn.edu.tsinghua.sthu.entity.AuthEntity;


/**
 *
 * @author luzhen
 */
public class ShowMyActivityApplyAction extends BaseAction{
    private ShowMyActivityApplyMessage showMyActivityApplyMessage;
    private ApplyActivityService applyActivityService;
    
    @Override
    public String onExecute() {
	getShowMyActivityApplyMessage().setTotalPageNumber(getApplyActivityService().getMyApplyTotalPageNumber(getCurrentUser().getID(), 5));
	return SUCCESS;
    }

    @Override
    public boolean hasAuth()
    {
	if (getCurrentUser().getAuth().getRole() != AuthEntity.USER_ROLE  && getCurrentUser().getAuth().getRole() != AuthEntity.GROUP_ROLE) {
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

    public ShowMyActivityApplyMessage getShowMyActivityApplyMessage() {
        return showMyActivityApplyMessage;
    }

    public void setShowMyActivityApplyMessage(ShowMyActivityApplyMessage showMyActivityApplyMessage) {
        this.showMyActivityApplyMessage = showMyActivityApplyMessage;
    }

    public ApplyActivityService getApplyActivityService() {
        return applyActivityService;
    }

    public void setApplyActivityService(ApplyActivityService applyActivityService) {
        this.applyActivityService = applyActivityService;
    }
}
