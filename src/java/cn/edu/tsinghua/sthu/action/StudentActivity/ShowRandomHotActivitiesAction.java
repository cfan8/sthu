/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action.StudentActivity;

import cn.edu.tsinghua.sthu.action.BaseAction;
import cn.edu.tsinghua.sthu.message.studentActivity.ShowRandomHotActivitiesMessage;
import cn.edu.tsinghua.sthu.service.ApplyStudentActivityService;

/**
 *
 * @author xiaobo
 */
public class ShowRandomHotActivitiesAction extends BaseAction{
    private ApplyStudentActivityService applyStudentActivityService;
    private ShowRandomHotActivitiesMessage showRandomHotActivitiesMessage;
    @Override
    public String onExecute() throws Exception {
        showRandomHotActivitiesMessage.setHotActivities(applyStudentActivityService.getRandomHotActivities(5));
        return SUCCESS;
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
     * @return the showRandomHotActivitiesMessage
     */
    public ShowRandomHotActivitiesMessage getShowRandomHotActivitiesMessage() {
        return showRandomHotActivitiesMessage;
    }

    /**
     * @param showRandomHotActivitiesMessage the showRandomHotActivitiesMessage to set
     */
    public void setShowRandomHotActivitiesMessage(ShowRandomHotActivitiesMessage showRandomHotActivitiesMessage) {
        this.showRandomHotActivitiesMessage = showRandomHotActivitiesMessage;
    }
    
}
