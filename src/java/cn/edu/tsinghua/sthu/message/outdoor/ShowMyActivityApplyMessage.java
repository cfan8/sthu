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
public class ShowMyActivityApplyMessage extends BaseMessage{
    private int totalPageNumber;

    public int getTotalPageNumber() {
	return totalPageNumber;
    }

    public void setTotalPageNumber(int totalPageNumber) {
	this.totalPageNumber = totalPageNumber;
    }
    
}
