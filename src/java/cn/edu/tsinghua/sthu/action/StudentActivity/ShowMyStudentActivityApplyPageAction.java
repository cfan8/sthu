/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action.StudentActivity;

import cn.edu.tsinghua.sthu.action.BaseAction;
import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.message.studentActivity.ShowMyStudentActivityApplyPageMessage;
import cn.edu.tsinghua.sthu.service.ApplyStudentActivityService;

/**
 *
 * @author xiaobo
 */
public class ShowMyStudentActivityApplyPageAction extends BaseAction{

    private Integer page;
    private Integer type;
    private ApplyStudentActivityService applyStudentActivityService;
    private ShowMyStudentActivityApplyPageMessage showMyStudentActivityApplyPageMessage;
    
    @Override
    public String onExecute() throws Exception {
        getShowMyStudentActivityApplyPageMessage().setType(type);
        getShowMyStudentActivityApplyPageMessage().setList(getApplyStudentActivityService().getMyApplyList(getCurrentUser().getID(), getPage(), 5));
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
	if (getCurrentUser().getAuth().getRole() != AuthEntity.USER_ROLE && getCurrentUser().getAuth().getRole() != AuthEntity.GROUP_ROLE)
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

    /**
     * @return the page
     */
    public Integer getPage() {
        return page;
    }

    /**
     * @param page the page to set
     */
    public void setPage(Integer page) {
        this.page = page;
    }

    /**
     * @return the applyStudentActivityService
     */
    public ApplyStudentActivityService getApplyStudentActivityService() {
        return applyStudentActivityService;
    }

    /**
     * @param applyStudentActivityService the applyStudentActivityService to set
     */
    public void setApplyStudentActivityService(ApplyStudentActivityService applyStudentActivityService) {
        this.applyStudentActivityService = applyStudentActivityService;
    }

    /**
     * @return the showMyStudentActivityApplyPageMessage
     */
    public ShowMyStudentActivityApplyPageMessage getShowMyStudentActivityApplyPageMessage() {
        return showMyStudentActivityApplyPageMessage;
    }

    /**
     * @param showMyStudentActivityApplyPageMessage the showMyStudentActivityApplyPageMessage to set
     */
    public void setShowMyStudentActivityApplyPageMessage(ShowMyStudentActivityApplyPageMessage showMyStudentActivityApplyPageMessage) {
        this.showMyStudentActivityApplyPageMessage = showMyStudentActivityApplyPageMessage;
    }

    /**
     * @return the type
     */
    public Integer getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(Integer type) {
        this.type = type;
    }
    
}
