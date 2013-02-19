/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message;

import cn.edu.tsinghua.sthu.entity.ColumnEntity;

/**
 *
 * @author wuhz
 */
public class ColumnEditPageMessage {
    private ColumnEntity columnEntity;
    private int id;

    public ColumnEntity getColumnEntity() {
        return columnEntity;
    }

    public void setColumnEntity(ColumnEntity columnEntity) {
        this.columnEntity = columnEntity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
