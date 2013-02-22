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
public class ShowOneColumnMessage {
    private int pageNumber;
    private ColumnEntity columnEntity;
    private List<NewEntity> otherNewsInSameColumn;

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    public ColumnEntity getColumnEntity() {
        return columnEntity;
    }

    public void setColumnEntity(ColumnEntity columnEntity) {
        this.columnEntity = columnEntity;
    }

    public List<NewEntity> getOtherNewsInSameColumn() {
        return otherNewsInSameColumn;
    }

    public void setOtherNewsInSameColumn(List<NewEntity> otherNewsInSameColumn) {
        this.otherNewsInSameColumn = otherNewsInSameColumn;
    }
}
