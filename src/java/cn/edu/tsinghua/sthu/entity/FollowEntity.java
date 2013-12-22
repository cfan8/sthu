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
    public static final int FOLLOW_TYPE_TICKET = 3;
    public static final int TICKET_RESULT_UNPUBLISH = 0;
    public static final int TICKET_RESULT_PUBLISH = 1;
    public static final int TICKET_STATUS_WAIT = 1;
    public static final int TICKET_STATUS_SUCCESS = 2;
    public static final int TICKET_STATUS_FAIL = 3;
    @Index(name="userIDIndex") 
    private int userID;
    private String userName;
    @Index(name="groupIDIndex")
    private int groupID;
    @Index(name="activityIDIndex")
    private int activityID;
    private int followType;
    private int ticketStatus;
    private int isResultPublished = TICKET_RESULT_UNPUBLISH;
    
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

    /**
     * @return the ticketStatus
     */
    public int getTicketStatus() {
        return ticketStatus;
    }

    /**
     * @param ticketStatus the ticketStatus to set
     */
    public void setTicketStatus(int ticketStatus) {
        this.ticketStatus = ticketStatus;
    }

    /**
     * @return the isResultPublished
     */
    public int getIsResultPublished() {
        return isResultPublished;
    }

    /**
     * @param isResultPublished the isResultPublished to set
     */
    public void setIsResultPublished(int isResultPublished) {
        this.isResultPublished = isResultPublished;
    }

    /**
     * @return the userName
     */
    public String getUserName() {
        return userName;
    }

    /**
     * @param userName the userName to set
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    
}
