/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.NewEntity;
import cn.edu.tsinghua.sthu.message.AlertMessage;
import cn.edu.tsinghua.sthu.message.ShowOneNewMessage;
import cn.edu.tsinghua.sthu.service.NewService;

/**
 *
 * @author wuhz
 */
public class ShowOneNewAction extends BaseAction{
    private int id = -1;
    private ShowOneNewMessage showOneNewMessage;
    private NewService newService;

    @Override
    public String onExecute() {
        if ((showOneNewMessage.getNewEnity().getRedirectURL().length() != 0))
        {
            return NEW_REDIRECT;
        }
        showOneNewMessage.setOtherNewsInSameColumn(newService.getRecommendNewsByColumn(showOneNewMessage.getNewEnity().getColumnBelong()));
        return SUCCESS;
    }
    
    @Override
    public boolean valid() {
        NewEntity entity = newService.getNewById(id);
        if ((entity == null) || 
                ((entity.getColumnBelong().isIsVisibleForUser() == false) && 
                (!(getCurrentUser() != null && getCurrentUser().getAuth().getRole() == AuthEntity.ADMIN_ROLE && getCurrentUser().getAuth().getOpArticle() > -1))))
        {
            alertMessage.setAlertTitle("访问无效新闻！");
            alertMessage.setAlertContent("点击继续进行跳转");
            alertMessage.setAlertType(AlertMessage.BOX_TYPE);
            alertMessage.setRedirectURL(AlertMessage.REFERER_URL);
            return false;
        }
        newService.addBrowseNumber(entity);
        showOneNewMessage.setNewEnity(entity);
        return true;
    }

    @Override
    public boolean needLogin() {
        return false;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public ShowOneNewMessage getShowOneNewMessage() {
        return showOneNewMessage;
    }

    public void setShowOneNewMessage(ShowOneNewMessage showOneNewMessage) {
        this.showOneNewMessage = showOneNewMessage;
    }

    public NewService getNewService() {
        return newService;
    }

    public void setNewService(NewService newService) {
        this.newService = newService;
    }
    
}
