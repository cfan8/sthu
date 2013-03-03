/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.entity.NewEntity;
import cn.edu.tsinghua.sthu.service.ColumnService;
import cn.edu.tsinghua.sthu.service.NewService;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import cn.edu.tsinghua.sthu.constant.Constant;
import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.message.NewManagementPageMessage;

/**
 *
 * @author wuhz
 */
public class GetNewPageAction extends BaseAction{
    private NewService newService;
    private ColumnService columnService;
    private int page;
    private List<NewEntity> news;
    private String titleFilter = "";
    private String authorFilter = "";
    private String columnBelongFilter = "";
    private boolean isPlacedInColumnTopFilter = false;
    private boolean withRedirectURLFilter = false;
    private String startTime = "";
    private String endTime = "";
    private NewManagementPageMessage newManagementPageMessage;
   
    @Override
    public String onExecute() 
    {
        int startIndex = (getPage() - 1) * Constant.NEW_NUMBER_ONE_PAGE_IN_MANAGEMENT;
        int endIndex = startIndex + Constant.NEW_NUMBER_ONE_PAGE_IN_MANAGEMENT - 1;
        setNews(newService.getAllNewsWithParam(startIndex, endIndex, newManagementPageMessage));
        return SUCCESS;
    }

    @Override
    public boolean valid() {
        if (getPage() < 1) {
	    setPage(1);
	}
        getNewManagementPageMessage().setTitleFilter(getTitleFilter());
        getNewManagementPageMessage().setAuthorFilter(getAuthorFilter());
        getNewManagementPageMessage().setColumnBelongFilter(getColumnBelongFilter());
        getNewManagementPageMessage().setIsPlacedInColumnTopFilter(isIsPlacedInColumnTopFilter());
        getNewManagementPageMessage().setWithRedirectURLFilter(isWithRedirectURLFilter());
        getNewManagementPageMessage().setStartTime(getStartTime());
        getNewManagementPageMessage().setEndTime(getEndTime());
        int count = newService.getQueryNewPageCount(newManagementPageMessage);
        if (getPage() > count)
        {
            setPage(count);
        }
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

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public ColumnService getColumnService() {
        return columnService;
    }

    public void setColumnService(ColumnService columnService) {
        this.columnService = columnService;
    }

    public List<NewEntity> getNews() {
        return news;
    }

    public void setNews(List<NewEntity> news) {
        this.news = news;
    }

    public String getTitleFilter() {
        return titleFilter;
    }

    public void setTitleFilter(String titleFilter) {
        this.titleFilter = titleFilter;
    }

    public String getAuthorFilter() {
        return authorFilter;
    }

    public void setAuthorFilter(String authorFilter) {
        this.authorFilter = authorFilter;
    }

    public String getColumnBelongFilter() {
        return columnBelongFilter;
    }

    public void setColumnBelongFilter(String columnBelongFilter) {
        this.columnBelongFilter = columnBelongFilter;
    }

    public boolean isIsPlacedInColumnTopFilter() {
        return isPlacedInColumnTopFilter;
    }

    public void setIsPlacedInColumnTopFilter(boolean isPlacedInColumnTopFilter) {
        this.isPlacedInColumnTopFilter = isPlacedInColumnTopFilter;
    }

    public boolean isWithRedirectURLFilter() {
        return withRedirectURLFilter;
    }

    public void setWithRedirectURLFilter(boolean withRedirectURLFilter) {
        this.withRedirectURLFilter = withRedirectURLFilter;
    }

    public NewManagementPageMessage getNewManagementPageMessage() {
        return newManagementPageMessage;
    }

    public void setNewManagementPageMessage(NewManagementPageMessage newManagementPageMessage) {
        this.newManagementPageMessage = newManagementPageMessage;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    
}
