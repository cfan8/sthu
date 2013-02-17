/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message;

/**
 *
 * @author linangran
 */
public class ShowMyClassroomApplyMessage extends BaseMessage{
    
    private int totalPageNumber;

    public int getTotalPageNumber() {
	return totalPageNumber;
    }

    public void setTotalPageNumber(int totalPageNumber) {
	this.totalPageNumber = totalPageNumber;
    }
}
