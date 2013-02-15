/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message;

/**
 *
 * @author linangran
 */
public class ApplyClassroomMessage extends BaseMessage{
    private int applyId;
    
    public int getApplyId() {
	return applyId;
    }

    public void setApplyId(int applyId) {
	this.applyId = applyId;
    }
}
