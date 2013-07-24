/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message.studentActivity;

import cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity;
import cn.edu.tsinghua.sthu.message.BaseMessage;

/**
 *
 * @author user
 */
public class ShowApplyStudentActivityPageMessage extends BaseMessage{
    private StudentActivityApplyEntity studentActivityApplyEntity;
    private String applyUserNickname;

    /**
     * @return the studentActivityApplyEntity
     */
    public StudentActivityApplyEntity getStudentActivityApplyEntity() {
        return studentActivityApplyEntity;
    }

    /**
     * @param studentActivityApplyEntity the studentActivityApplyEntity to set
     */
    public void setStudentActivityApplyEntity(StudentActivityApplyEntity studentActivityApplyEntity) {
        this.studentActivityApplyEntity = studentActivityApplyEntity;
    }

    /**
     * @return the applyUserNickname
     */
    public String getApplyUserNickname() {
        return applyUserNickname;
    }

    /**
     * @param applyUserNickname the applyUserNickname to set
     */
    public void setApplyUserNickname(String applyUserNickname) {
        this.applyUserNickname = applyUserNickname;
    }
}
