/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message.studentActivity;

import cn.edu.tsinghua.sthu.message.BaseMessage;
import java.util.Date;

/**
 *
 * @author xiaobo
 */
public class ShowActivitiesListMessage extends BaseMessage{
    private int activityClass;
    private int digest;
    private Date selectedDate;
    private int totalPageNumber;

    /**
     * @return the activityClass
     */
    public int getActivityClass() {
        return activityClass;
    }

    /**
     * @param activityClass the activityClass to set
     */
    public void setActivityClass(int activityClass) {
        this.activityClass = activityClass;
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
     * @return the digest
     */
    public int getDigest() {
        return digest;
    }

    /**
     * @param digest the digest to set
     */
    public void setDigest(int digest) {
        this.digest = digest;
    }

    /**
     * @return the selectedDate
     */
    public Date getSelectedDate() {
        return selectedDate;
    }

    /**
     * @param selectedDate the selectedDate to set
     */
    public void setSelectedDate(Date selectedDate) {
        this.selectedDate = selectedDate;
    }

    
}
