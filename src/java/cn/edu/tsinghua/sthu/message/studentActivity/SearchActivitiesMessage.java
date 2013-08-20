/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message.studentActivity;

import cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity;
import cn.edu.tsinghua.sthu.message.BaseMessage;
import java.util.List;

/**
 *
 * @author anna
 */
public class SearchActivitiesMessage extends BaseMessage{
    private String searchKeyword;
   // private List<StudentActivityApplyEntity> list;
    private int totalPageNumber;
     private Integer page;
    public String getSearchKeyword() {
        return searchKeyword;
    }

 

    public void setSearchKeyword(String searchKeyword) {
        this.searchKeyword = searchKeyword;
    }


    /**
     * @return the totalPageNumber
     */
    public int getTotalPageNumber() {
        return totalPageNumber;
    }

    /**
     * @param totalPageNumber the totalPageNumber to set
     */
    public void setTotalPageNumber(int totalPageNumber) {
        this.totalPageNumber = totalPageNumber;
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


    
}
