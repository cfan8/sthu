/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.constant.IndexColumnMapping;
import cn.edu.tsinghua.sthu.entity.ColumnEntity;
import cn.edu.tsinghua.sthu.message.AlertMessage;
import cn.edu.tsinghua.sthu.message.ShowIndexMessage;
import cn.edu.tsinghua.sthu.service.ApplyStudentActivityService;
import cn.edu.tsinghua.sthu.service.ColumnService;
import cn.edu.tsinghua.sthu.service.IndexManageService;
import cn.edu.tsinghua.sthu.service.NewService;

/**
 *
 * @author wuhz
 */
public class ShowIndexAction extends BaseAction{
    private int newMaxResult = 10;
    private ShowIndexMessage showIndexMessage;
    private IndexManageService indexManageService;
    private NewService newService;
    private ColumnService columnService;
    private ApplyStudentActivityService applyStudentActivityService;

    @Override
    public String onExecute() {
        boolean flag = getNews();
        if (flag)
        {
	    showIndexMessage.setIndexSettings(indexManageService.getValidIndexSetting());
            return SUCCESS;
        }
        else
        {
            alertMessage.setAlertTitle("访问出错");
            alertMessage.setAlertType(AlertMessage.BOX_TYPE);
            alertMessage.setRedirectURL(AlertMessage.REFERER_URL);
            alertMessage.setAlertContent("该页面的内容已经被删除");
            return ALERT;
        }
    }
    
    public boolean getNews()
    {
        boolean flag = true;
        if (!getNewsInIndexTop()) {
            flag = false;
        }
        if (!getNewsInIndexBottomLeft()) {
            flag = false;
        }
        if (!getNewsInIndexBottomCenter()) {
            flag = false;
        }
        if (!getNewsInIndexBottomRight()) {
            flag = false;
        }
        return flag;
    }
    
    public boolean getNewsInIndexTop()
    {
        ColumnEntity entity = columnService.getColumnById(IndexColumnMapping.IndexTopColumnId);
        if (entity == null)
        {
            return false;
        }
        showIndexMessage.setIndexTopNews(newService.getNewsByColumn(0, newMaxResult-1, entity));
        return true;
    }
    
    public boolean getNewsInIndexBottomLeft()
    {
        ColumnEntity entity = columnService.getColumnById(IndexColumnMapping.IndexBottomLeftColumnId);
        if (entity == null)
        {
            return false;
        }
        showIndexMessage.setIndexBottomLeftNews(newService.getNewsByColumn(0, newMaxResult-1, entity));
        return true;
    }
    
    public boolean getNewsInIndexBottomCenter()
    {
        ColumnEntity entity = columnService.getColumnById(IndexColumnMapping.IndexBottomCenterColumnId);
        if (entity == null)
        {
            return false;
        }
        showIndexMessage.setIndexBottomCenterNews(newService.getNewsByColumn(0, newMaxResult-1, entity));
        return true;
    }
    
    public boolean getNewsInIndexBottomRight()
    {
        ColumnEntity entity = columnService.getColumnById(IndexColumnMapping.IndexBottomRightColumnId);
        if (entity == null)
        {
            return false;
        }
        //showIndexMessage.setIndexBottomRightNews(newService.getNewsByColumn(0, newMaxResult-1, entity));
        showIndexMessage.setStudentActivityApplyEntitys(applyStudentActivityService.getIndexActivities(newMaxResult));
        
        return true;
    }

    @Override
    public boolean valid() {
        return true;
    }

    @Override
    public boolean needLogin() {
        return false;
    }

    public ShowIndexMessage getShowIndexMessage() {
        return showIndexMessage;
    }

    public void setShowIndexMessage(ShowIndexMessage showIndexMessage) {
        this.showIndexMessage = showIndexMessage;
    }

    public NewService getNewService() {
        return newService;
    }

    public void setNewService(NewService newService) {
        this.newService = newService;
    }

    public ColumnService getColumnService() {
        return columnService;
    }

    public void setColumnService(ColumnService columnService) {
        this.columnService = columnService;
    }

    public IndexManageService getIndexManageService() {
	return indexManageService;
    }

    public void setIndexManageService(IndexManageService indexManageService) {
	this.indexManageService = indexManageService;
    }

    /**
     * @return the applyStudentActivityService
     */
    public ApplyStudentActivityService getApplyStudentActivityService() {
        return applyStudentActivityService;
    }

    /**
     * @param applyStudentActivityService the applyStudentActivityService to set
     */
    public void setApplyStudentActivityService(ApplyStudentActivityService applyStudentActivityService) {
        this.applyStudentActivityService = applyStudentActivityService;
    }
    
}
