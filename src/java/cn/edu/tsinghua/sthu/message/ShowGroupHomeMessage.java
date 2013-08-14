/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message;

import cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity;
import java.util.List;

/**
 *
 * @author xiaobo
 */
public class ShowGroupHomeMessage extends BaseMessage{
    private int showFollow;
    private int totalPageNumber;
    private int groupId;
    private int isGroupFollowed;

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
     * @return the groupId
     */
    public int getGroupId() {
        return groupId;
    }

    /**
     * @param groupId the groupId to set
     */
    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    /**
     * @return the isGroupFollowed
     */
    public int getIsGroupFollowed() {
        return isGroupFollowed;
    }

    /**
     * @param isGroupFollowed the isGroupFollowed to set
     */
    public void setIsGroupFollowed(int isGroupFollowed) {
        this.isGroupFollowed = isGroupFollowed;
    }

}
