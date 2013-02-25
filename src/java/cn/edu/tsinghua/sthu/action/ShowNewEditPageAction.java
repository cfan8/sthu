/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.NewEntity;
import cn.edu.tsinghua.sthu.message.AlertMessage;
import cn.edu.tsinghua.sthu.message.NewEditPageMessage;
import cn.edu.tsinghua.sthu.service.ColumnService;
import cn.edu.tsinghua.sthu.service.NewService;

/**
 *
 * @author wuhz
 */
public class ShowNewEditPageAction extends BaseAction{
    private ColumnService columnService;
    private NewService newService;
    private NewEditPageMessage newEditPageMessage;
    private int id = -1;

    @Override
    public String onExecute() {
        getNewEditPageMessage().setColumnNames(columnService.getAllColumnName());
        return SUCCESS;
    }

    @Override
    public boolean valid() {
        if (id >= 0)
        {
            NewEntity entity = newService.getNewById(id);
            if (entity == null)
            {
                alertMessage.setAlertTitle("更新失败");
                alertMessage.setAlertContent("该新闻不存在！");
                alertMessage.setAlertType(AlertMessage.ALERT_TYPE);
                alertMessage.setRedirectURL(AlertMessage.REFERER_URL);
                return false;
            }
            newEditPageMessage.setNewEntity(entity);
        }
        newEditPageMessage.setId(id);
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

    public NewEditPageMessage getNewEditPageMessage() {
        return newEditPageMessage;
    }

    public void setNewEditPageMessage(NewEditPageMessage newEditPageMessage) {
        this.newEditPageMessage = newEditPageMessage;
    }

    public NewService getNewService() {
        return newService;
    }

    public void setNewService(NewService newService) {
        this.newService = newService;
    }
    
}
