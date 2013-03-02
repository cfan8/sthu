/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.ColumnEntity;
import cn.edu.tsinghua.sthu.message.ShowColumnsMessage;
import cn.edu.tsinghua.sthu.service.ColumnService;
import java.util.List;

/**
 *
 * @author wuhz
 */
public class ShowColumnsAction extends BaseAction{
    private ColumnService columnService;
    private ShowColumnsMessage showColumnsMessage;

    @Override
    public String onExecute() {
        if ((getCurrentUser() != null) && (getCurrentUser().getAuth().getRole() == AuthEntity.ADMIN_ROLE) && (getCurrentUser().getAuth().getOpArticle() > -1)) 
        {
            showColumnsMessage.setColumnNumber(columnService.getColumnPageCount());
            return SUCCESS;
        }
        showColumnsMessage.setColumnNumber(columnService.getVisibleColumnPageCount());
        return SUCCESS;
    }

    @Override
    public boolean valid() {
        return true;
    }

    @Override
    public boolean needLogin() {
        return false;
    }

    public ColumnService getColumnService() {
        return columnService;
    }

    public void setColumnService(ColumnService columnService) {
        this.columnService = columnService;
    }    

    public ShowColumnsMessage getShowColumnsMessage() {
        return showColumnsMessage;
    }

    public void setShowColumnsMessage(ShowColumnsMessage showColumnsMessage) {
        this.showColumnsMessage = showColumnsMessage;
    }
}
