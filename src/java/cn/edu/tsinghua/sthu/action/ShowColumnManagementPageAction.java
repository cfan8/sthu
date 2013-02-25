/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.message.ColumnManagementPageMessage;
import cn.edu.tsinghua.sthu.service.ColumnService;

/**
 *
 * @author wuhz
 */
public class ShowColumnManagementPageAction extends BaseAction{
    private ColumnService columnService;
    private ColumnManagementPageMessage columnManagementPageMessage;

    @Override
    public String onExecute() {
        columnManagementPageMessage.setPageNumber(columnService.getColumnPageCount());
        return SUCCESS;
    }

    @Override
    public boolean valid() {
        return true;
    }

    @Override
    public boolean needLogin() {
        return true;
    }
    
    public boolean hasAuth() {
	if (getCurrentUser().getAuth().getRole() == AuthEntity.USER_ROLE) {
	    return false;
	}
	if (getCurrentUser().getAuth().getOpArticle() == -1)
        {
            return false;
        }
	return true;
    }

    public ColumnService getColumnService() {
        return columnService;
    }

    public void setColumnService(ColumnService columnService) {
        this.columnService = columnService;
    }

    public ColumnManagementPageMessage getColumnManagementPageMessage() {
        return columnManagementPageMessage;
    }

    public void setColumnManagementPageMessage(ColumnManagementPageMessage columnManagementPageMessage) {
        this.columnManagementPageMessage = columnManagementPageMessage;
    }
    
}
