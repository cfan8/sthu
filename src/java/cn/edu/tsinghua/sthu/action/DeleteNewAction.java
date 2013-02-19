/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.message.AlertMessage;
import cn.edu.tsinghua.sthu.service.NewService;

/**
 *
 * @author wuhz
 */
public class DeleteNewAction extends BaseAction{
    private NewService newService;
    private int id;

    @Override
    public String onExecute() {
        if (newService.deleteNew(id))
        {
            return SUCCESS;
        }
        else
        {
            alertMessage.setAlertTitle("删除失败");
	    alertMessage.setAlertContent("该新闻不存在！");
	    alertMessage.setAlertType(AlertMessage.ALERT_TYPE);
	    alertMessage.setRedirectURL(AlertMessage.REFERER_URL);
            return ALERT;
        }
    }

    @Override
    public boolean valid() {
        return true;
    }

    @Override
    public boolean needLogin() {
        return false;
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
