/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action.info;

import cn.edu.tsinghua.sthu.action.BaseAction;
import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.ColumnEntity;
import cn.edu.tsinghua.sthu.message.AlertMessage;
import cn.edu.tsinghua.sthu.message.info.ForInfoNewBoxMessage;
import cn.edu.tsinghua.sthu.service.ColumnService;
import cn.edu.tsinghua.sthu.service.NewService;

/**
 *
 * @author wuhz
 */
public class GetNewsForInfoNewBoxAction extends BaseAction{
    private int columnId;
    private int style = 0;
    private ForInfoNewBoxMessage forInfoNewBoxMessage;
    private ColumnService columnService;
    private NewService newService;
    private final int NEW_NUMBER = 6;
    private ColumnEntity entity;

    @Override
    public String onExecute() throws Exception {
        forInfoNewBoxMessage.setNews(newService.getNewsByColumn(0, NEW_NUMBER - 1, entity));
        if (style == 0)
        {
            return "style0";
        }
        else
        {
            return "style1";
        }
    }

    @Override
    public boolean valid() {
        entity = columnService.getColumnById(columnId);
        if ((entity == null) || (entity.isIsVisibleForUser() == false))
        {
            alertMessage.setAlertTitle("访问无效栏目！");
            alertMessage.setAlertContent("点击继续进行跳转");
            alertMessage.setAlertType(AlertMessage.BOX_TYPE);
            alertMessage.setRedirectURL(AlertMessage.REFERER_URL);
            return false;
        }
        forInfoNewBoxMessage.setColumnEntity(entity);
        return true;
    }

    @Override
    public boolean needLogin() {
        return false;
    }

    public int getColumnId() {
        return columnId;
    }

    public void setColumnId(int columnId) {
        this.columnId = columnId;
    }

    public ForInfoNewBoxMessage getForInfoNewBoxMessage() {
        return forInfoNewBoxMessage;
    }

    public void setForInfoNewBoxMessage(ForInfoNewBoxMessage forInfoNewBoxMessage) {
        this.forInfoNewBoxMessage = forInfoNewBoxMessage;
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

    public int getStyle() {
        return style;
    }

    public void setStyle(int style) {
        this.style = style;
    }
    
}
