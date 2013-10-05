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
 * @author extends
 */
public class ShowRandomHotActivitiesMessage extends BaseMessage{
    private List<StudentActivityApplyEntity> hotActivities;

    /**
     * @return the hotActivities
     */
    public List<StudentActivityApplyEntity> getHotActivities() {
        return hotActivities;
    }

    /**
     * @param hotActivities the hotActivities to set
     */
    public void setHotActivities(List<StudentActivityApplyEntity> hotActivities) {
        this.hotActivities = hotActivities;
    }
}
