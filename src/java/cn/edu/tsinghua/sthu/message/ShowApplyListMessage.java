/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message;

/**
 *
 * @author linangran
 */
public class ShowApplyListMessage extends BaseMessage{
    
    private int viewType;
    private int approveType;
    private int totalPageNumber;

    public int getViewType() {
	return viewType;
    }

    public void setViewType(int viewType) {
	this.viewType = viewType;
    }

    public int getApproveType() {
	return approveType;
    }

    public void setApproveType(int approveType) {
	this.approveType = approveType;
    }

    public int getTotalPageNumber() {
	return totalPageNumber;
    }

    public void setTotalPageNumber(int totalPageNumber) {
	this.totalPageNumber = totalPageNumber;
    }
    
}
