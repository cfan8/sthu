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
import cn.edu.tsinghua.sthu.security.XSSProtect;
import cn.edu.tsinghua.sthu.security.XSSProtectLevel;
import cn.edu.tsinghua.sthu.service.ApplyStudentActivityService;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author anna
 */
public class SearchActivityAction extends BaseAction{
    
 
    @XSSProtect(XSSProtectLevel.Strict)
    private String searchKeywords ;  //
    private SearchActivitiesMessage searchActivitiesMessage;
    private ApplyStudentActivityService applyStudentActivityService;
 

    
    @Override
    public String onExecute() throws Exception {
   
    
    getSearchActivitiesMessage().setTotalPageNumber(getApplyStudentActivityService().getAcceptedActivitiesByContent(10, getSearchKeywords()));
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

 

   
   

 
    
}
