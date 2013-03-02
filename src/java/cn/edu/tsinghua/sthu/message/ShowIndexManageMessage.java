/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message;

import cn.edu.tsinghua.sthu.entity.IndexSettingEntity;
import java.util.List;

/**
 *
 * @author linangran
 */
public class ShowIndexManageMessage extends BaseMessage{
    
    private List<IndexSettingEntity> list;

    public List<IndexSettingEntity> getList() {
	return list;
    }

    public void setList(List<IndexSettingEntity> list) {
	this.list = list;
    }
    
}
