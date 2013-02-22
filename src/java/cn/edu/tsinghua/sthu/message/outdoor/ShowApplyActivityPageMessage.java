/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message.outdoor;
import cn.edu.tsinghua.sthu.message.BaseMessage;
import cn.edu.tsinghua.sthu.entity.ActivityApplyEntity;

/**
 *
 * @author luzhen
 */
public class ShowApplyActivityPageMessage extends BaseMessage{
    private ActivityApplyEntity applyEntity;

    public ActivityApplyEntity getApplyEntity() {
        return applyEntity;
    }

    public void setApplyEntity(ActivityApplyEntity applyEntity) {
        this.applyEntity = applyEntity;
    }

}
