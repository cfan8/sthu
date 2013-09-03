/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action.StudentActivity;

import cn.edu.tsinghua.sthu.action.BaseAction;
import cn.edu.tsinghua.sthu.message.studentActivity.ShowActivitiesListMessage;
import cn.edu.tsinghua.sthu.service.ApplyStudentActivityService;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author xiaobo
 */
public class ShowActivitiesListAction extends BaseAction{
    private Integer activityClass;
    private Integer digest;
    private Date selectedDate;
    private ShowActivitiesListMessage showActivitiesListMessage;
    private ApplyStudentActivityService applyStudentActivityService;
    public static final DateFormat formatter = new SimpleDateFormat( "yyyy-MM-dd "); 

    @Override
    public String onExecute() throws Exception {
        if(activityClass == null)
            activityClass = ShowActivitiesPageAction.ACTIVITY_ALL;
        if(digest == null)
            digest = ShowActivitiesPageAction.COMMON_ACTIVITY;
        showActivitiesListMessage.setActivityClass(activityClass);
        showActivitiesListMessage.setDigest(digest);
        if(selectedDate == null){
            showActivitiesListMessage.setTotalPageNumber(applyStudentActivityService.getAcceptedPublicActivitiesTotalPageNumber(10, activityClass, digest));
            showActivitiesListMessage.setSelectedDate(null);
        }
        else{
            showActivitiesListMessage.setSelectedDate(selectedDate);
            showActivitiesListMessage.setTotalPageNumber(applyStudentActivityService.getAcceptedPublicActivitiesTotalPageNumberByDate(10, activityClass, digest, selectedDate));
        }
        return SUCCESS;
    }
    
    @Override
    public boolean hasAuth(){
        return true;
    }

    @Override
    public boolean valid() {
        if(activityClass != null){
            if(activityClass != ShowActivitiesPageAction.ACTIVITY_ALL && activityClass != ShowActivitiesPageAction.ACTIVITY_GROUP && activityClass != ShowActivitiesPageAction.ACTIVITY_SPORTS &&
                activityClass != ShowActivitiesPageAction.ACTIVITY_LECTURE && activityClass != ShowActivitiesPageAction.ACTIVITY_CULTURE && activityClass != ShowActivitiesPageAction.ACTIVITY_AMUSE &&
                activityClass != ShowActivitiesPageAction.ACTIVITY_OTHER){
                alertMessage.setSimpleAlert("参数错误！");
                return false;
            }
        }
        if(digest != null){
            if(digest != ShowActivitiesPageAction.COMMON_ACTIVITY && digest != ShowActivitiesPageAction.DIGEST_ACTIVITY){
               alertMessage.setSimpleAlert("参数错误！");
                return false;
            }
        }

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

    /**
     * @return the digest
     */
    public Integer getDigest() {
        return digest;
    }

    /**
     * @param digest the digest to set
     */
    public void setDigest(Integer digest) {
        this.digest = digest;
    }

    /**
     * @return the selectedDate
     */
    public Date getSelectedDate() {
        return selectedDate;
    }

    /**
     * @param selectedDate the selectedDate to set
     */
    public void setSelectedDate(Date selectedDate) {
        this.selectedDate = selectedDate;
    }
}
