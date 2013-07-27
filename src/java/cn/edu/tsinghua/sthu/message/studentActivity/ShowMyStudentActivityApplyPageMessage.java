/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message.studentActivity;

import cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity;
import cn.edu.tsinghua.sthu.message.BaseMessage;
import java.util.List;

/**
 *
 * @author xiaobo
 */
public class ShowMyStudentActivityApplyPageMessage extends BaseMessage{
    private List<StudentActivityApplyEntity> list;

    /**
     * @return the list
     */
    public List<StudentActivityApplyEntity> getList() {
        return list;
    }

    /**
     * @param list the list to set
     */
    public void setList(List<StudentActivityApplyEntity> list) {
        this.list = list;
    }
    
}
