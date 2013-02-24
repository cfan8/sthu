/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message.outdoor;

import cn.edu.tsinghua.sthu.entity.ActivityApplyEntity;
import java.util.List;
import cn.edu.tsinghua.sthu.message.BaseMessage;
/**
 *
 * @author elsie
 */
public class ShowActivityApplyListPageMessage extends BaseMessage{
        private List<ActivityApplyEntity> list;

    public List<ActivityApplyEntity> getList() {
	return list;
    }

    public void setList(List<ActivityApplyEntity> list) {
	this.list = list;
    }
}
