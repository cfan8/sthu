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
public class ShowMyStudentActivityApplyMessage extends BaseMessage{
    private int totalPageNumber;

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
