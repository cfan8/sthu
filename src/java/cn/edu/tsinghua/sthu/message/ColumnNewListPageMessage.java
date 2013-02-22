/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message;

import cn.edu.tsinghua.sthu.entity.ColumnEntity;
import cn.edu.tsinghua.sthu.entity.NewEntity;
import java.util.List;

/**
 *
 * @author wuhz
 */
public class ColumnNewListPageMessage {
    private List<NewEntity> newList;
    private ColumnEntity columEntity;

    public List<NewEntity> getNewList() {
        return newList;
    }

    public void setNewList(List<NewEntity> newList) {
        this.newList = newList;
    }

    public ColumnEntity getColumEntity() {
        return columEntity;
    }

    public void setColumEntity(ColumnEntity columEntity) {
        this.columEntity = columEntity;
    }
}
