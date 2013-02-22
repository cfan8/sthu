/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.entity.ColumnEntity;
import cn.edu.tsinghua.sthu.service.ColumnService;
import java.util.List;

/**
 *
 * @author wuhz
 */
public class GetAllColumnForUserAction extends BaseAction{
    private ColumnService columnService;
    private List<ColumnEntity> columns;

    @Override
    public String onExecute() {
        columns = columnService.getColumnsVisibleForUser();
        return SUCCESS;
    }

    @Override
    public boolean valid() {
        return true;
    }

    @Override
    public boolean needLogin() {
        return false;
    }

    public ColumnService getColumnService() {
        return columnService;
    }

    public void setColumnService(ColumnService columnService) {
        this.columnService = columnService;
    }

    public List<ColumnEntity> getColumns() {
        return columns;
    }

    public void setColumns(List<ColumnEntity> columns) {
        this.columns = columns;
    }
    
}
