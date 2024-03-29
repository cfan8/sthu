/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.ColumnEntity;
import cn.edu.tsinghua.sthu.message.AlertMessage;
import cn.edu.tsinghua.sthu.message.ColumnEditPageMessage;
import cn.edu.tsinghua.sthu.service.ColumnService;

/**
 *
 * @author wuhz
 */
public class ShowColumnEditPageAction extends BaseAction{
    private ColumnService columnService;
    private int id = -1;
    private ColumnEditPageMessage columnEditPageMessage;

    @Override
    public String onExecute() {
        return SUCCESS;
    }

    @Override
    public boolean valid() {
        if (id >= 0)
        {
            ColumnEntity entity = columnService.getColumnById(id);
            if (entity == null)
            {
                alertMessage.setAlertTitle("更新失败");
                alertMessage.setAlertContent("该栏目不存在！");
                alertMessage.setAlertType(AlertMessage.ALERT_TYPE);
                alertMessage.setRedirectURL(AlertMessage.REFERER_URL);
                return false;
            }
            columnEditPageMessage.setColumnEntity(entity);
        }
        columnEditPageMessage.setId(id);
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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public ColumnEditPageMessage getColumnEditPageMessage() {
        return columnEditPageMessage;
    }

    public void setColumnEditPageMessage(ColumnEditPageMessage columnEditPageMessage) {
        this.columnEditPageMessage = columnEditPageMessage;
    }
    
}
