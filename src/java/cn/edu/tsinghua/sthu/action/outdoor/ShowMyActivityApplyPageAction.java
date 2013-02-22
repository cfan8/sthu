/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action.outdoor;

import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.message.outdoor.ShowMyActivityApplyPageMessage;
import cn.edu.tsinghua.sthu.service.ApplyActivityService;
import cn.edu.tsinghua.sthu.action.BaseAction;

/**
 *
 * @author luzhen
 */
public class ShowMyActivityApplyPageAction extends BaseAction{
    
    private Integer page;
    private ApplyActivityService applyActivityService;
    private ShowMyActivityApplyPageMessage showMyActivityApplyPageMessage;
    
    @Override
    public String onExecute() {
	getShowMyActivityApplyPageMessage().setList(getApplyActivityService().getMyApplyList(getCurrentUser().getID(), getPage(), 20));
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

    public ApplyActivityService getApplyActivityService() {
        return applyActivityService;
    }

    public void setApplyActivityService(ApplyActivityService applyActivityService) {
        this.applyActivityService = applyActivityService;
    }

    public ShowMyActivityApplyPageMessage getShowMyActivityApplyPageMessage() {
        return showMyActivityApplyPageMessage;
    }

    public void setShowMyActivityApplyPageMessage(ShowMyActivityApplyPageMessage showMyActivityApplyPageMessage) {
        this.showMyActivityApplyPageMessage = showMyActivityApplyPageMessage;
    }
}
