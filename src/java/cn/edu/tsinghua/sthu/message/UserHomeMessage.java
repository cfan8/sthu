/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message;

import cn.edu.tsinghua.sthu.entity.UserEntity;
import java.util.List;

/**
 *
 * @author xiaobo
 */
public class UserHomeMessage extends BaseMessage{
    private String username;
    private int applyNum;
    private int ticketNum;
    private int followActivityNumber;
    private String activityInfo;
    private List<UserEntity> interestGroups;
    private List<Integer> groupsFollowNum;

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the applyNum
     */
    public int getApplyNum() {
        return applyNum;
    }

    /**
     * @param applyNum the applyNum to set
     */
    public void setApplyNum(int applyNum) {
        this.applyNum = applyNum;
    }

    /**
     * @return the ticketNum
     */
    public int getTicketNum() {
        return ticketNum;
    }

    /**
     * @param ticketNum the ticketNum to set
     */
    public void setTicketNum(int ticketNum) {
        this.ticketNum = ticketNum;
    }

    /**
     * @return the activityInfo
     */
    public String getActivityInfo() {
        return activityInfo;
    }

    /**
     * @param activityInfo the activityInfo to set
     */
    public void setActivityInfo(String activityInfo) {
        this.activityInfo = activityInfo;
    }

    /**
     * @return the interestGroups
     */
    public List<UserEntity> getInterestGroups() {
        return interestGroups;
    }

    /**
     * @param interestGroups the interestGroups to set
     */
    public void setInterestGroups(List<UserEntity> interestGroups) {
        this.interestGroups = interestGroups;
    }

    /**
     * @return the groupsFollowNum
     */
    public List<Integer> getGroupsFollowNum() {
        return groupsFollowNum;
    }

    /**
     * @param groupsFollowNum the groupsFollowNum to set
     */
    public void setGroupsFollowNum(List<Integer> groupsFollowNum) {
        this.groupsFollowNum = groupsFollowNum;
    }

    /**
     * @return the followActivityNumber
     */
    public int getFollowActivityNumber() {
        return followActivityNumber;
    }

    /**
     * @param followActivityNumber the followActivityNumber to set
     */
    public void setFollowActivityNumber(int followActivityNumber) {
        this.followActivityNumber = followActivityNumber;
    }
}
