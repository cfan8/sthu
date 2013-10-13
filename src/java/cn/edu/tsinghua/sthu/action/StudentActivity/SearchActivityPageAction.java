/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action.StudentActivity;
import cn.edu.tsinghua.sthu.Util;
import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.action.BaseAction;
import cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity;
import cn.edu.tsinghua.sthu.message.studentActivity.SearchActivitiesPageMessage;
import cn.edu.tsinghua.sthu.security.XSSProtect;
import cn.edu.tsinghua.sthu.security.XSSProtectLevel;
import cn.edu.tsinghua.sthu.service.ApplyStudentActivityService;
import cn.edu.tsinghua.sthu.service.UserService;
import java.util.List;
import java.util.ArrayList;
/**
 *
 * @author anna
 */
public class SearchActivityPageAction extends BaseAction{


   
    @XSSProtect(XSSProtectLevel.Strict)
    private String searchKeywords ;  //
    private SearchActivitiesPageMessage searchActivitiesPageMessage;
    private ApplyStudentActivityService applyStudentActivityService;
    private Integer activityClass;
    private Integer page;
    private UserService userService;
    @Override
    public String onExecute() throws Exception {
        List<StudentActivityApplyEntity> entityList;
        entityList = getApplyStudentActivityService().getAcceptedActivitiesByContent(getPage(),10,getSearchKeywords());
        getSearchActivitiesPageMessage().setList(entityList);
       // getSearchActivitiesMessage().setTotalPageNumber(getApplyStudentActivityService().getAcceptedActivitiesByContentAndType(10, getSearchKeywords(),getActivityClass()));
          
        if(getCurrentUser() == null || getCurrentUser().getAuth().getRole() != AuthEntity.USER_ROLE){
            getSearchActivitiesPageMessage().setShowFollow(0);
        }else {
            getSearchActivitiesPageMessage().setShowFollow(1);
        }
        List<Boolean> isFollowedList = new ArrayList<Boolean>();
        if(getSearchActivitiesPageMessage().getShowFollow() == 1){
            for (StudentActivityApplyEntity entity : getSearchActivitiesPageMessage().getList()) {  
                isFollowedList.add(applyStudentActivityService.checkActivityFollowedByUser(getCurrentUser(), entity));
            }
        }
        else{
            for (StudentActivityApplyEntity entity : getSearchActivitiesPageMessage().getList()) {  
                isFollowedList.add(Boolean.FALSE);
            }
        }
        List<Boolean> isGroupList = new ArrayList<Boolean>();
        for (StudentActivityApplyEntity entity : getSearchActivitiesPageMessage().getList()) {  
            if(getUserService().getUserEntityById(entity.getApplyUserid())!=null && getUserService().getUserEntityById(entity.getApplyUserid()).getAuth().getRole() == AuthEntity.GROUP_ROLE){
                 isGroupList.add(Boolean.TRUE);
             }
             else{
                 isGroupList.add(Boolean.FALSE);
             }
         }
        getSearchActivitiesPageMessage().setIsGroupList(isGroupList);
        getSearchActivitiesPageMessage().setIsFollowedList(isFollowedList); 
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
    public boolean needLogin() {
        return false;
    }

    /**
     * @return the searchKeywords
     */
    public String getSearchKeywords() {
        return searchKeywords;
    }

    /**
     * @param searchKeywords the searchKeywords to set
     */
    public void setSearchKeywords(String searchKeywords) {
        this.searchKeywords = Util.decodeURL(searchKeywords);
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
     * @return the searchActivitiesPageMessage
     */
    public SearchActivitiesPageMessage getSearchActivitiesPageMessage() {
        return searchActivitiesPageMessage;
    }

    /**
     * @param searchActivitiesPageMessage the searchActivitiesPageMessage to set
     */
    public void setSearchActivitiesPageMessage(SearchActivitiesPageMessage searchActivitiesPageMessage) {
        this.searchActivitiesPageMessage = searchActivitiesPageMessage;
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
