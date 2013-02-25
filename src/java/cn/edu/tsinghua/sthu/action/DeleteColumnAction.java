/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.message.AlertMessage;
import cn.edu.tsinghua.sthu.service.ColumnService;

/**
 *
 * @author wuhz
 */
public class DeleteColumnAction extends BaseAction{
    private ColumnService columnService;
    private int id;

    @Override
    public String onExecute() {
        int ret = columnService.deleteColumn(id);
        alertMessage.setAlertTitle("删除失败");
	alertMessage.setAlertType(AlertMessage.ALERT_TYPE);
	alertMessage.setRedirectURL(AlertMessage.REFERER_URL);
            
        if (ret == 0)
        {
            return SUCCESS;
        }
        else if (ret == -1)
        {
            alertMessage.setAlertContent("该栏目不存在！");
        }
        else
        {
            alertMessage.setAlertContent("请先删除改栏目下的所有新闻，再删除栏目");
        }
        return ALERT;
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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
}
