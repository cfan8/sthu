/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.entity.NewEntity;
import cn.edu.tsinghua.sthu.service.NewService;
import java.util.List;

/**
 *
 * @author wuhz
 */
public class ShowAllNewsAction extends BaseAction
{
    private NewService newService;
    private List<NewEntity> news;
    
    @Override
    public String onExecute() {
        news = newService.getAllNewsByTimeDESC();
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

    public NewService getNewService() {
        return newService;
    }

    public void setNewService(NewService newService) {
        this.newService = newService;
    }

    public List<NewEntity> getNews() {
        return news;
    }

    public void setNews(List<NewEntity> news) {
        this.news = news;
    }
    
}
