/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.service.ColumnService;
import java.util.List;

/**
 *
 * @author wuhz
 */
public class ShowNewEditPageAction extends BaseAction{
    private ColumnService columnService;
    private List<String> columnNames;
    private int id = -1;

    @Override
    public String onExecute() {
        columnNames = columnService.getAllColumnName();
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

    public List<String> getColumnNames() {
        return columnNames;
    }

    public void setColumnNames(List<String> columnNames) {
        this.columnNames = columnNames;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
}
