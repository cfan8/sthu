/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message;

import cn.edu.tsinghua.sthu.entity.UserEntity;
import java.util.List;

/**
 *
 * @author linangran
 */
public class InitMessage extends BaseMessage{
    
    private List<UserEntity> list;

    public List<UserEntity> getList() {
	return list;
    }

    public void setList(List<UserEntity> list) {
	this.list = list;
    }
    
}
