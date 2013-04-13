/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message.outdoor;
import cn.edu.tsinghua.sthu.entity.ActivityApplyEntity;
import cn.edu.tsinghua.sthu.message.BaseMessage;

/**
 *
 * @author luzhen
 */
public class ShowApplyActivityPageMessage extends BaseMessage{
    private ActivityApplyEntity applyEntity;
    private String applyUserNickname;

    public ActivityApplyEntity getApplyEntity() {
        return applyEntity;
    }

    public void setApplyEntity(ActivityApplyEntity applyEntity) {
        this.applyEntity = applyEntity;
    }

    public String getApplyUserNickname() {
	return applyUserNickname;
    }

    public void setApplyUserNickname(String applyUserNickname) {
	this.applyUserNickname = applyUserNickname;
    }

}
