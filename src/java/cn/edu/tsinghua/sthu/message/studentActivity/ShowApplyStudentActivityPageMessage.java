/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message.studentActivity;

import cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity;

/**
 *
 * @author user
 */
public class ShowApplyStudentActivityPageMessage {
    private StudentActivityApplyEntity applyEntity;
    private String applyUserNickname;

    /**
     * @return the applyEntity
     */
    public StudentActivityApplyEntity getApplyEntity() {
        return applyEntity;
    }

    /**
     * @param applyEntity the applyEntity to set
     */
    public void setApplyEntity(StudentActivityApplyEntity applyEntity) {
        this.applyEntity = applyEntity;
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
