/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message;

import cn.edu.tsinghua.sthu.entity.NewEntity;
import java.util.List;

/**
 *
 * @author wuhz
 */
public class ShowOneNewMessage {
    private NewEntity newEnity;
    private List<NewEntity> otherNewsInSameColumn;

    public NewEntity getNewEnity() {
        return newEnity;
    }

    public void setNewEnity(NewEntity newEnity) {
        this.newEnity = newEnity;
    }

    public List<NewEntity> getOtherNewsInSameColumn() {
        return otherNewsInSameColumn;
    }

    public void setOtherNewsInSameColumn(List<NewEntity> otherNewsInSameColumn) {
        this.otherNewsInSameColumn = otherNewsInSameColumn;
    }
}
