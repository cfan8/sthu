/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message.studentActivity;

import cn.edu.tsinghua.sthu.message.BaseMessage;
import cn.edu.tsinghua.sthu.security.XSSProtect;
import cn.edu.tsinghua.sthu.security.XSSProtectLevel;

/**
 *
 * @author xiaobo
 */
public class ShowStudentActivityApplyListMessage extends BaseMessage{
   @XSSProtect(XSSProtectLevel.Strict)
    private String searchKeywords ;  //
    private int viewType;
    private int approveType;
    private int totalPageNumber;
   @XSSProtect(XSSProtectLevel.Strict)
    private String searchStatus ;  //
   // private int[] searchStatus;
    /**
     * @return the viewType
     */
    public int getViewType() {
        return viewType;
    }

    /**
     * @param viewType the viewType to set
     */
    public void setViewType(int viewType) {
        this.viewType = viewType;
    }

    /**
     * @return the approveType
     */
    public int getApproveType() {
        return approveType;
    }

    /**
     * @param approveType the approveType to set
     */
    public void setApproveType(int approveType) {
        this.approveType = approveType;
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
     * @return the searchStatus
     */
    public String getSearchStatus() {
        return searchStatus;
    }

    /**
     * @param searchStatus the searchStatus to set
     */
    public void setSearchStatus(int[] searchStatus) {
        this.searchStatus = new String();
        for(int i=0;i<searchStatus.length-1;i++){
            this.searchStatus += Integer.toString(searchStatus[i]);
            this.searchStatus += ",";
        }
        this.searchStatus += Integer.toString(searchStatus[searchStatus.length-1]);
        //this.searchStatus = searchStatus;
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
        this.searchKeywords = searchKeywords;
    }
}
