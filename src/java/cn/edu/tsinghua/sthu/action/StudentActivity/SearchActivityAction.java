/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action.StudentActivity;

import cn.edu.tsinghua.sthu.action.BaseAction;
import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity;
import cn.edu.tsinghua.sthu.message.studentActivity.SearchActivitiesMessage;
import cn.edu.tsinghua.sthu.message.studentActivity.ShowActivitiesPageMessage;
import cn.edu.tsinghua.sthu.service.ApplyStudentActivityService;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author anna
 */
public class SearchActivityAction extends BaseAction{
    
     public static int ACTIVITY_ALL = 0;
 public static int ACTIVITY_GROUP = 1;
 public static int ACTIVITY_SPORTS = 2;
 public static int ACTIVITY_LECTURE = 3;
 public static int ACTIVITY_CULTURE = 4;
 public static int ACTIVITY_AMUSE = 5;
 public static int ACTIVITY_OTHER = 6;
 
    private String searchKeywords ;  //
    private SearchActivitiesMessage searchActivitiesMessage;
    private ApplyStudentActivityService applyStudentActivityService;
    private Integer activityClass ;
 

    
    @Override
    public String onExecute() throws Exception {
     //  List<StudentActivityApplyEntity> entityList;
      if(getActivityClass() == null) setActivityClass(ACTIVITY_ALL);
     //  entityList = getApplyStudentActivityService().getAcceptedActivitiesByContent(getPage(),10,getSearchKeywords(),getActivityClass());
    //getSearchActivitiesMessage().setList(entityList);
    
    getSearchActivitiesMessage().setTotalPageNumber(getApplyStudentActivityService().getAcceptedActivitiesByContentAndType(10, getSearchKeywords(),getActivityClass()));
     getSearchActivitiesMessage().setActivityClass(getActivityClass()); 
   getSearchActivitiesMessage().setSearchKeyword(getSearchKeywords());
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
     * @return the searchKeywords
     */
    public String getSearchKeywords() {
        return searchKeywords;
    }

    public void setSearchKeywords(String searchKeywords) {
        this.searchKeywords = searchKeywords;
    }
    
        

    /**
     * @return the searchActivitiesMessage
     */
    public SearchActivitiesMessage getSearchActivitiesMessage() {
        return searchActivitiesMessage;
    }

    /**
     * @param searchActivitiesMessage the searchActivitiesMessage to set
     */
    public void setSearchActivitiesMessage(SearchActivitiesMessage searchActivitiesMessage) {
        this.searchActivitiesMessage = searchActivitiesMessage;
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

   
   

 
    
}
