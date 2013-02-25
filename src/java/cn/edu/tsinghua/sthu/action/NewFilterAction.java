/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.message.AlertMessage;
import cn.edu.tsinghua.sthu.message.NewManagementPageMessage;

/**
 *
 * @author wuhz
 */
public class NewFilterAction extends BaseAction{
    private String param;
    
    @Override
    public String onExecute() {
        setParam(request.getQueryString());
        if (getParam().length() > 800)
        {
            alertMessage.setAlertTitle("查询失败");
            alertMessage.setAlertType(AlertMessage.ALERT_TYPE);
            alertMessage.setRedirectURL("/new/newsManage.do");
            alertMessage.setAlertContent("查询参数长度过长");
            return ALERT;
        }
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

    public String getParam() {
        return param;
    }

    public void setParam(String param) {
        this.param = param;
    }

    
}
