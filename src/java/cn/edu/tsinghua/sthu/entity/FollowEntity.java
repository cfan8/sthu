/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.Index;

/**
 *
 * @author xiaobo
 */
@Entity
@Table(name="t_follow")
public class FollowEntity extends BaseEntity{
    public static final int FOLLOW_TYPE_GROUP = 1;
    public static final int FOLLOW_TYPE_ACTIVITY = 2;
    @Index(name="userIDIndex") 
    private int userID;
    @Index(name="groupIDIndex")
    private int groupID;
    @Index(name="activityIDIndex")
    private int activityID;
    private int followType;
    
    /**
     * @return the userID
     */
    public int getUserID() {
        return userID;
    }

    /**
     * @param userID the userID to set
     */
    public void setUserID(int userID) {
        this.userID = userID;
    }

   
    /**
     * @return the followType
     */
    public int getFollowType() {
        return followType;
    }

    /**
     * @param followType the followType to set
     */
    public void setFollowType(int followType) {
        this.followType = followType;
    }

    /**
     * @return the groupID
     */
    public int getGroupID() {
        return groupID;
    }

    /**
     * @param groupID the groupID to set
     */
    public void setGroupID(int groupID) {
        this.groupID = groupID;
    }

    /**
     * @return the activityID
     */
    public int getActivityID() {
        return activityID;
    }

    /**
     * @param activityID the activityID to set
     */
    public void setActivityID(int activityID) {
        this.activityID = activityID;
    }

    
}
