/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message;

import cn.edu.tsinghua.sthu.entity.CRoomApplyEntity;
import java.util.List;

/**
 *
 * @author linangran
 */
public class ShowApplyListPageMessage extends BaseMessage{
    
    private List<CRoomApplyEntity> list;

    public List<CRoomApplyEntity> getList() {
	return list;
    }

    public void setList(List<CRoomApplyEntity> list) {
	this.list = list;
    }
}
