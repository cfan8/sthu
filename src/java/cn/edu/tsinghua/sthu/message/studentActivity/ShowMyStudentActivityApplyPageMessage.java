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
    private int type;
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

    /**
     * @return the type
     */
    public int getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(int type) {
        this.type = type;
    }
    
}
