/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message.studentActivity;

import cn.edu.tsinghua.sthu.entity.UserEntity;
import cn.edu.tsinghua.sthu.message.BaseMessage;
import java.util.List;

/**
 *
 * @author xiaoyou
 */
public class ShowTicketRandomResultMessage extends BaseMessage{
    private List<UserEntity> resultList;

    /**
     * @return the resultList
     */
    public List<UserEntity> getResultList() {
        return resultList;
    }

    /**
     * @param resultList the resultList to set
     */
    public void setResultList(List<UserEntity> resultList) {
        this.resultList = resultList;
    }
}
