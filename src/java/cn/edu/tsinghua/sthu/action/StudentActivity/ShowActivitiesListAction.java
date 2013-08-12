/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action.StudentActivity;

import cn.edu.tsinghua.sthu.action.BaseAction;
import cn.edu.tsinghua.sthu.message.studentActivity.ShowActivitiesListMessage;
import cn.edu.tsinghua.sthu.service.ApplyStudentActivityService;

/**
 *
 * @author xiaobo
 */
public class ShowActivitiesListAction extends BaseAction{
    private Integer activityClass;
    private ShowActivitiesListMessage showActivitiesListMessage;
    private ApplyStudentActivityService applyStudentActivityService;

    @Override
    public String onExecute() throws Exception {
        if(activityClass == null)
            activityClass = ShowActivitiesPageAction.ACTIVITY_ALL;
        showActivitiesListMessage.setActivityClass(activityClass);
        showActivitiesListMessage.setTotalPageNumber(applyStudentActivityService.getAcceptedPublicActivitiesTotalPageNumber(10, activityClass));
        return SUCCESS;
    }
    
    @Override
    public boolean hasAuth(){
        return true;
    }

    @Override
    public boolean valid() {
        return true;
    }

    @Override
    public boolean needLogin() {
        return false;
    }

    /**
     * @return the activityClass
     */
    public Integer getActivityClass() {
        return activityClass;
    }

    /**
     * @param activityClass the activityClass to set
     */
    public void setActivityClass(Integer activityClass) {
        this.activityClass = activityClass;
    }

    /**
     * @return the showActivitiesListMessage
     */
    public ShowActivitiesListMessage getShowActivitiesListMessage() {
        return showActivitiesListMessage;
    }

    /**
     * @param showActivitiesListMessage the showActivitiesListMessage to set
     */
    public void setShowActivitiesListMessage(ShowActivitiesListMessage showActivitiesListMessage) {
        this.showActivitiesListMessage = showActivitiesListMessage;
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
}
