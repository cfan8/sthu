/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message.studentActivity;

import cn.edu.tsinghua.sthu.entity.FollowEntity;
import cn.edu.tsinghua.sthu.entity.UserEntity;
import cn.edu.tsinghua.sthu.message.BaseMessage;
import java.util.List;

/**
 *
 * @author xiaoyou
 */
public class ShowTicketRandomResultMessage extends BaseMessage{
    private List<FollowEntity> resultList;

    /**
     * @return the resultList
     */
    public List<FollowEntity> getResultList() {
        return resultList;
    }

    /**
     * @param resultList the resultList to set
     */
    public void setResultList(List<FollowEntity> resultList) {
        this.resultList = resultList;
    }
}
