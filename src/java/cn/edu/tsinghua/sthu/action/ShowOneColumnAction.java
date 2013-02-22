/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.entity.ColumnEntity;
import cn.edu.tsinghua.sthu.entity.NewEntity;
import cn.edu.tsinghua.sthu.message.AlertMessage;
import cn.edu.tsinghua.sthu.message.ShowOneColumnMessage;
import cn.edu.tsinghua.sthu.service.ColumnService;
import cn.edu.tsinghua.sthu.service.NewService;

/**
 *
 * @author wuhz
 */
public class ShowOneColumnAction extends BaseAction{
    private ColumnService columnService;
    private NewService newService;
    private int id = -1;
    private ShowOneColumnMessage showOneColumnMessage;

    @Override
    public String onExecute() {
        showOneColumnMessage.setPageNumber(newService.getNewPageCountByColumn(showOneColumnMessage.getColumnEntity()));
        showOneColumnMessage.setOtherNewsInSameColumn(newService.getRecommendNewsByColumn(showOneColumnMessage.getColumnEntity()));
        return SUCCESS;
    }

    @Override
    public boolean valid() {
        ColumnEntity entity = columnService.getColumnById(id);
        if ((entity == null) || (entity.isIsVisibleForUser() == false))
        {
            alertMessage.setAlertTitle("访问无效栏目！");
            alertMessage.setAlertContent("点击继续进行跳转");
            alertMessage.setAlertType(AlertMessage.BOX_TYPE);
            alertMessage.setRedirectURL(AlertMessage.REFERER_URL);
            return false;
        }
        showOneColumnMessage.setColumnEntity(entity);
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

    public ShowOneColumnMessage getShowOneColumnMessage() {
        return showOneColumnMessage;
    }

    public void setShowOneColumnMessage(ShowOneColumnMessage showOneColumnMessage) {
        this.showOneColumnMessage = showOneColumnMessage;
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
    
}
