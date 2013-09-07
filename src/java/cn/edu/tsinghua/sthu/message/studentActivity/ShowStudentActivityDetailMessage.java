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
    
}
