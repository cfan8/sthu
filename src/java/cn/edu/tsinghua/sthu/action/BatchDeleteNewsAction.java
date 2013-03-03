/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.CRoomApplyEntity;
import cn.edu.tsinghua.sthu.message.AlertMessage;
import cn.edu.tsinghua.sthu.service.NewService;

/**
 *
 * @author wuhz
 */
public class BatchDeleteNewsAction extends BaseAction{
    private NewService newService;
    private String referer;
    
    @Override
    public String onExecute() {
        boolean flag = true;
        String newids[];
        
        newids = request.getParameterValues("newids[]");
        if (newids == null)
        {
            referer = request.getHeader("REFERER");
            return SUCCESS;
        }
        for (int i = 0; i < newids.length; i++)
        {
            int temp;
            try
            {
                temp = Integer.parseInt(newids[i]);
            }
            catch (Exception ex)
            {
                flag = false;
                continue;
            }
            if (newService.deleteNew(temp) == false)
            {
                flag = false;
            }
        }
        if (flag) 
        {
            referer = request.getHeader("REFERER");
            return SUCCESS;
        }
        else
        {
            alertMessage.setAlertTitle("警告");
	    alertMessage.setAlertContent("部分新闻删除失败！");
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
    
    public NewService getNewService() {
        return newService;
    }

    public void setNewService(NewService newService) {
        this.newService = newService;
    }

    public String getReferer() {
        return referer;
    }

    public void setReferer(String referer) {
        this.referer = referer;
    }

}
