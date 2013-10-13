/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message.studentActivity;

import cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity;
import cn.edu.tsinghua.sthu.message.BaseMessage;

/**
 *
 * @author xiaobo
 */
public class ShowStudentActivityDetailMessage extends BaseMessage{
    private StudentActivityApplyEntity activity;
    private int followNumber = 0;
    private int showFollow;
    private int showTicket;
    private boolean isGroup;

    /**
     * @return the activity
     */
    public StudentActivityApplyEntity getActivity() {
        return activity;
    }

    /**
     * @param activity the activity to set
     */
    public void setActivity(StudentActivityApplyEntity activity) {
        this.activity = activity;
    }

    /**
     * @return the followNumber
     */
    public int getFollowNumber() {
        return followNumber;
    }

    /**
     * @param followNumber the followNumber to set
     */
    public void setFollowNumber(int followNumber) {
        this.followNumber = followNumber;
    }

    /**
     * @return the showFollow
     */
    public int getShowFollow() {
        return showFollow;
    }

    /**
     * @param showFollow the showFollow to set
     */
    public void setShowFollow(int showFollow) {
        this.showFollow = showFollow;
    }

    /**
     * @return the showTicket
     */
    public int getShowTicket() {
        return showTicket;
    }

    /**
     * @param showTicket the showTicket to set
     */
    public void setShowTicket(int showTicket) {
        this.showTicket = showTicket;
    }

    /**
     * @return the isGroup
     */
    public boolean isIsGroup() {
        return isGroup;
    }

    /**
     * @param isGroup the isGroup to set
     */
    public void setIsGroup(boolean isGroup) {
        this.isGroup = isGroup;
    }
    
}
