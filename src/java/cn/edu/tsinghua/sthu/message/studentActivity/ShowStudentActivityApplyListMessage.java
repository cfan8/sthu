/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message.studentActivity;

import cn.edu.tsinghua.sthu.message.BaseMessage;

/**
 *
 * @author xiaobo
 */
public class ShowStudentActivityApplyListMessage extends BaseMessage{
    private int viewType;
    private int approveType;
    private int totalPageNumber;
    
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
}
