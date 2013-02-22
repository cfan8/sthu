/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.constant.Constant;
import cn.edu.tsinghua.sthu.entity.ColumnEntity;
import cn.edu.tsinghua.sthu.message.AlertMessage;
import cn.edu.tsinghua.sthu.message.ColumnNewListPageMessage;
import cn.edu.tsinghua.sthu.message.ColumnPageMessage;
import cn.edu.tsinghua.sthu.service.ColumnService;
import cn.edu.tsinghua.sthu.service.NewService;

/**
 *
 * @author wuhz
 */
public class GetColumnNewListPageAction extends BaseAction{
    private ColumnService columnService;
    private NewService newService;
    private int page;
    private int id = -1;
    private ColumnNewListPageMessage columnNewListPageMessage;  

    @Override
    public String onExecute() {
        int startIndex = (getPage() - 1) * Constant.NEW_NUMBER_ONE_PAGE_IN_SHOWONECOLUMN;
        int endIndex = startIndex + Constant.NEW_NUMBER_ONE_PAGE_IN_SHOWONECOLUMN - 1;
        columnNewListPageMessage.setNewList(newService.getNewsByColumn(startIndex, endIndex, columnNewListPageMessage.getColumEntity()));
        return SUCCESS;
    }

    @Override
    public boolean valid() {
        if (getPage() < 1) {
	    setPage(1);
	}
        ColumnEntity entity = columnService.getColumnById(id);
        if ((entity == null) || (entity.isIsVisibleForUser() == false))
        {
            alertMessage.setAlertTitle("访问无效栏目！");
            alertMessage.setAlertContent("点击继续进行跳转");
            alertMessage.setAlertType(AlertMessage.BOX_TYPE);
            alertMessage.setRedirectURL(AlertMessage.REFERER_URL);
            return false;
        }
        columnNewListPageMessage.setColumEntity(entity);
        int count = newService.getNewPageCountByColumn(entity);
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

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public ColumnNewListPageMessage getColumnNewListPageMessage() {
        return columnNewListPageMessage;
    }

    public void setColumnNewListPageMessage(ColumnNewListPageMessage columnNewListPageMessage) {
        this.columnNewListPageMessage = columnNewListPageMessage;
    }

    public ColumnService getColumnService() {
        return columnService;
    }

    public void setColumnService(ColumnService columnService) {
        this.columnService = columnService;
    }

    public NewService getNewService() {
        return newService;
    }

    public void setNewService(NewService newService) {
        this.newService = newService;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
