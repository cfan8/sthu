/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message;

import cn.edu.tsinghua.sthu.entity.ColumnEntity;
import java.util.List;

/**
 *
 * @author wuhz
 */
public class ColumnPageMessage {
    private List<ColumnEntity> columns;

    public List<ColumnEntity> getColumns() {
        return columns;
    }

    public void setColumns(List<ColumnEntity> columns) {
        this.columns = columns;
    }
}
