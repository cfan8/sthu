/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action.StudentActivity;

import cn.edu.tsinghua.sthu.action.BaseAction;
import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity;
import cn.edu.tsinghua.sthu.entity.UserEntity;
import cn.edu.tsinghua.sthu.message.studentActivity.ShowActivitiesPageMessage;
import cn.edu.tsinghua.sthu.service.ApplyStudentActivityService;
import cn.edu.tsinghua.sthu.service.UserService;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author xiaobo
 */
public class ShowActivitiesPageAction extends BaseAction{
    public static final int ACTIVITY_ALL = 0;
    public static final int ACTIVITY_GROUP = 1;
    public static final int ACTIVITY_SPORTS = 2;
    public static final int ACTIVITY_LECTURE = 3;
    public static final int ACTIVITY_CULTURE = 4;
    public static final int ACTIVITY_AMUSE = 5;
    public static final int ACTIVITY_OTHER = 6;
    public static final int DIGEST_ACTIVITY = 1;
    public static final int COMMON_ACTIVITY = 0;
    public static final DateFormat formatter = new SimpleDateFormat( "yyyy-MM-dd "); 
    
    private Integer activityClass;
    private Integer digest;
    private Date selectedDate;
    private Integer page;
    private ApplyStudentActivityService applyStudentActivityService;
    private UserService userService;
    private ShowActivitiesPageMessage showActivitiesPageMessage;
    
    @Override
    public String onExecute() throws Exception {
        if(getCurrentUser() == null || getCurrentUser().getAuth().getRole() != AuthEntity.USER_ROLE){
            getShowActivitiesPageMessage().setShowFollow(0);
        }
        else
            getShowActivitiesPageMessage().setShowFollow(1);
        if(activityClass == null)
            activityClass = ACTIVITY_ALL;
        if(digest == null)
            digest = COMMON_ACTIVITY;
        if(selectedDate == null)
            getShowActivitiesPageMessage().setList(applyStudentActivityService.getAcceptedPublicActivitiesList(getPage(), 10, activityClass, digest));
        else
            getShowActivitiesPageMessage().setList(applyStudentActivityService.getAcceptedPublicActivitiesListByDate(getPage(), 10, activityClass, digest, selectedDate));
        List<Boolean> isFollowedList = new ArrayList<Boolean>();
        List<Boolean> isGroupList = new ArrayList<Boolean>();
        if(getShowActivitiesPageMessage().getShowFollow() == 1){
            for (StudentActivityApplyEntity entity : getShowActivitiesPageMessage().getList()) {  
                isFollowedList.add(applyStudentActivityService.checkActivityFollowedByUser(getCurrentUser(), entity));
                if(userService.getUserEntityById(entity.getApplyUserid()).getAuth().getRole() == AuthEntity.GROUP_ROLE){
                    isGroupList.add(Boolean.TRUE);
                }
                else{
                    isGroupList.add(Boolean.FALSE);
                }
            }
        }
        else{
            for (StudentActivityApplyEntity entity : getShowActivitiesPageMessage().getList()) {  
                isFollowedList.add(Boolean.FALSE);
            }
        }
        for (StudentActivityApplyEntity entity : getShowActivitiesPageMessage().getList()) {  
            if(userService.getUserEntityById(entity.getApplyUserid()).getAuth().getRole() == AuthEntity.GROUP_ROLE){
                 isGroupList.add(Boolean.TRUE);
             }
             else{
                 isGroupList.add(Boolean.FALSE);
             }
         }
        getShowActivitiesPageMessage().setIsGroupList(isGroupList);
        getShowActivitiesPageMessage().setIsFollowedList(isFollowedList);
        return SUCCESS;
    }

    @Override
    public boolean valid() {
        if (getPage() == null || getPage() <= 0) {
            alertMessage.setSimpleAlert("参数错误！");
	    return false;
	}
        if(activityClass != null){
            if(activityClass != ShowActivitiesPageAction.ACTIVITY_ALL && activityClass != ShowActivitiesPageAction.ACTIVITY_GROUP && activityClass != ShowActivitiesPageAction.ACTIVITY_SPORTS &&
                activityClass != ShowActivitiesPageAction.ACTIVITY_LECTURE && activityClass != ShowActivitiesPageAction.ACTIVITY_CULTURE && activityClass != ShowActivitiesPageAction.ACTIVITY_AMUSE &&
                activityClass != ShowActivitiesPageAction.ACTIVITY_OTHER){
                alertMessage.setSimpleAlert("参数错误！");
                return false;
            }
        }
        if(digest != null){
            if(digest != ShowActivitiesPageAction.COMMON_ACTIVITY && digest != ShowActivitiesPageAction.DIGEST_ACTIVITY)
            {
                alertMessage.setSimpleAlert("参数错误！");
                return false;
            }
        }
        return true;
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

    /**
     * @return the userService
     */
    public UserService getUserService() {
        return userService;
    }

    /**
     * @param userService the userService to set
     */
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
    
}
