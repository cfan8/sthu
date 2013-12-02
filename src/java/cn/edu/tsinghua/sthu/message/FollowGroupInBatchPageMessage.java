/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message;

import cn.edu.tsinghua.sthu.entity.UserEntity;
import java.util.List;

/**
 *
 * @author anna
 */
public class FollowGroupInBatchPageMessage extends BaseMessage{
    //private int userID;
   // private String username;
    private List<Integer> groupsFollowNum;
    private List<UserEntity> allGroups;
    private List<Integer> isFollowed;

   

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
     * @return the allGroups
     */
    public List<UserEntity> getAllGroups() {
        return allGroups;
    }

    /**
     * @param allGroups the allGroups to set
     */
    public void setAllGroups(List<UserEntity> allGroups) {
        this.allGroups = allGroups;
    }

    /**
     * @return the isFollowed
     */
    public List<Integer> getIsFollowed() {
        return isFollowed;
    }

    /**
     * @param isFollowed the isFollowed to set
     */
    public void setIsFollowed(List<Integer> isFollowed) {
        this.isFollowed = isFollowed;
    }
}
