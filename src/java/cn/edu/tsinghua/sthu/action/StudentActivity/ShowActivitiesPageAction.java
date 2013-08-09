/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action.StudentActivity;

import cn.edu.tsinghua.sthu.action.BaseAction;
import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.message.studentActivity.ShowActivitiesPageMessage;
import cn.edu.tsinghua.sthu.service.ApplyStudentActivityService;

/**
 *
 * @author xiaobo
 */
public class ShowActivitiesPageAction extends BaseAction{

    private Integer page;
    private ApplyStudentActivityService applyStudentActivityService;
    private ShowActivitiesPageMessage showActivitiesPageMessage;
    
    @Override
    public String onExecute() throws Exception {
        getShowActivitiesPageMessage().setList(applyStudentActivityService.getAcceptedPublicActivitiesList(getPage(), 10));
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
	return true;
    }
    
    @Override
    public boolean needLogin() {
       return false;
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
     * @return the showActivitiesPageMessage
     */
    public ShowActivitiesPageMessage getShowActivitiesPageMessage() {
        return showActivitiesPageMessage;
    }

    /**
     * @param showActivitiesPageMessage the showActivitiesPageMessage to set
     */
    public void setShowActivitiesPageMessage(ShowActivitiesPageMessage showActivitiesPageMessage) {
        this.showActivitiesPageMessage = showActivitiesPageMessage;
    }
    
}
