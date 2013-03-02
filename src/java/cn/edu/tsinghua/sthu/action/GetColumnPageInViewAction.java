/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.constant.Constant;
import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.message.ColumnPageMessage;
import cn.edu.tsinghua.sthu.service.ColumnService;

/**
 *
 * @author wuhz
 */
public class GetColumnPageInViewAction extends BaseAction{
    private ColumnService columnService;
    private int page;
    private ColumnPageMessage columnPageMessage;   

    @Override
    public String onExecute() {
        int startIndex = (getPage() - 1) * Constant.COLUMN_NUMBER_ONE_PAGE;
        int endIndex = startIndex + Constant.COLUMN_NUMBER_ONE_PAGE - 1;
        if (getCurrentUser() != null && getCurrentUser().getAuth().getRole() == AuthEntity.ADMIN_ROLE && getCurrentUser().getAuth().getOpArticle() > -1)
        {
            columnPageMessage.setColumns(columnService.getColumn(startIndex, endIndex));
            return SUCCESS;
        }
        columnPageMessage.setColumns(columnService.getColumnForUser(startIndex, endIndex));
        return SUCCESS;
    }

    @Override
    public boolean valid() {
        if (getPage() < 1) {
	    setPage(1);
	}
        int count;
        if ((getCurrentUser() != null) && (getCurrentUser().getAuth().getRole() == AuthEntity.ADMIN_ROLE) && (getCurrentUser().getAuth().getOpArticle() > -1))
        {
            count = columnService.getColumnPageCount();
        }
        else
        {
            count = columnService.getVisibleColumnPageCount();
        }
        if (getPage() > count)
        {
            setPage(count);
        }
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

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public ColumnPageMessage getColumnPageMessage() {
        return columnPageMessage;
    }

    public void setColumnPageMessage(ColumnPageMessage columnPageMessage) {
        this.columnPageMessage = columnPageMessage;
    }
    
}
