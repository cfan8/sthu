/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.message.AlertMessage;
import cn.edu.tsinghua.sthu.service.ColumnService;
import java.util.Date;

/**
 *
 * @author wuhz
 */
public class EditColumnAction extends BaseAction
{
    private int id = -1;
    private String name;
    private String description;
    private boolean isVisibleForUser;
    private boolean isFixedInHomePage;
    private ColumnService columnService;
    
    @Override
    public String onExecute() 
    {
        if (id < 0)
	{
            if (columnService.addColumn(name, description, isVisibleForUser, isFixedInHomePage))
            {
                return SUCCESS;
            }
	}
        else
        {
            int ret = columnService.updateColumn(id, name, description, isVisibleForUser, isFixedInHomePage);
            if (ret == 0)
            {
                return SUCCESS;
            }
            else if (ret == -1)
            {
                alertMessage.setAlertContent("该栏目不存在，无法进行更新");
                return ALERT;
            }
        }
        alertMessage.setAlertContent("该栏目名已存在");
        return ALERT;
    }

    @Override
    public boolean valid() 
    {
        if (id < 0)
        {
            alertMessage.setAlertTitle("添加失败");
        }
        else
        {
            alertMessage.setAlertTitle("更新失败");
        }
        alertMessage.setAlertType(AlertMessage.ALERT_TYPE);
        alertMessage.setRedirectURL(AlertMessage.REFERER_URL);
        if ((name == null) || (name.length() > 32) || (name.length() < 1))
        {
	    alertMessage.setAlertContent("栏目名长度应该在1~32个字符之间");
            return false;
        }
        if (description.length() > 1024)
        {
            alertMessage.setAlertContent("栏目描述长度应该在1024个字符之内");
            return false;
        }
        return true;
    }

    @Override
    public boolean needLogin() 
    {
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ColumnService getColumnService() {
        return columnService;
    }

    public void setColumnService(ColumnService columnService) {
        this.columnService = columnService;
    }

    public boolean isIsVisibleForUser() {
        return isVisibleForUser;
    }

    public void setIsVisibleForUser(boolean isVisibleForUser) {
        this.isVisibleForUser = isVisibleForUser;
    }

    public boolean isIsFixedInHomePage() {
        return isFixedInHomePage;
    }

    public void setIsFixedInHomePage(boolean isFixedInHomePage) {
        this.isFixedInHomePage = isFixedInHomePage;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
