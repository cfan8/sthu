/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message.studentActivity;

import cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity;
import cn.edu.tsinghua.sthu.message.BaseMessage;
import java.util.List;

/**
 *
 * @author xiaobo
 */
public class ShowActivitiesPageMessage extends BaseMessage{
    private List<StudentActivityApplyEntity> list;
    private List<Boolean> isFollowedList;
    private Integer showFollow;

    /**
     * @return the list
     */
    public List<StudentActivityApplyEntity> getList() {
        return list;
    }

    /**
     * @param list the list to set
     */
    public void setList(List<StudentActivityApplyEntity> list) {
        this.list = list;
    }

    /**
     * @return the isFollowedList
     */
    public List<Boolean> getIsFollowedList() {
        return isFollowedList;
    }

    /**
     * @param isFollowedList the isFollowedList to set
     */
    public void setIsFollowedList(List<Boolean> isFollowedList) {
        this.isFollowedList = isFollowedList;
    }

    /**
     * @return the showFollow
     */
    public Integer getShowFollow() {
        return showFollow;
    }

    /**
     * @param showFollow the showFollow to set
     */
    public void setShowFollow(Integer showFollow) {
        this.showFollow = showFollow;
    }
    
}
