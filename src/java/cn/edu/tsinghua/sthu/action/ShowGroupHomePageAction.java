/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity;
import cn.edu.tsinghua.sthu.message.ShowGroupHomePageMessage;
import cn.edu.tsinghua.sthu.service.ApplyStudentActivityService;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author xiaobo
 */
public class ShowGroupHomePageAction extends BaseAction{

    private Integer groupId;
    private Integer page;
    private ApplyStudentActivityService applyStudentActivityService;
    private ShowGroupHomePageMessage showGroupHomePageMessage;
    
    @Override
    public String onExecute() throws Exception {
        if(getCurrentUser() == null || getCurrentUser().getAuth().getRole() != AuthEntity.USER_ROLE){
            getShowGroupHomePageMessage().setShowFollow(0);
        }
        else
            getShowGroupHomePageMessage().setShowFollow(1);
        getShowGroupHomePageMessage().setList(applyStudentActivityService.getAcceptedPublicActivitiesListByUserId(page, 5, groupId));
        List<Boolean> isFollowedList = new ArrayList<Boolean>();
        if(getShowGroupHomePageMessage().getShowFollow() == 1){
            for (StudentActivityApplyEntity entity : getShowGroupHomePageMessage().getList()) {  
                isFollowedList.add(applyStudentActivityService.checkActivityFollowedByUser(getCurrentUser(), entity));
            }
        }
        else{
            for (StudentActivityApplyEntity entity : getShowGroupHomePageMessage().getList()) {  
                isFollowedList.add(Boolean.FALSE);
            }
        }
        getShowGroupHomePageMessage().setIsFollowedList(isFollowedList);
        
        return SUCCESS;
    }

    @Override
    public boolean valid() {
        if(getPage() != null && getPage() > 0){
            return true;
        }
        else{
            alertMessage.setSimpleAlert("参数错误");
            return false;
        }
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
     * @return the showGroupHomePageMessage
     */
    public ShowGroupHomePageMessage getShowGroupHomePageMessage() {
        return showGroupHomePageMessage;
    }

    /**
     * @param showGroupHomePageMessage the showGroupHomePageMessage to set
     */
    public void setShowGroupHomePageMessage(ShowGroupHomePageMessage showGroupHomePageMessage) {
        this.showGroupHomePageMessage = showGroupHomePageMessage;
    }

    /**
     * @return the groupId
     */
    public Integer getGroupId() {
        return groupId;
    }

    /**
     * @param groupId the groupId to set
     */
    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }
    
}
