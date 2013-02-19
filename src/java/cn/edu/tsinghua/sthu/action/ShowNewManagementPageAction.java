/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.service.NewService;
import cn.edu.tsinghua.sthu.constant.Constant;
import cn.edu.tsinghua.sthu.message.AlertMessage;
import cn.edu.tsinghua.sthu.message.NewManagementPageMessage;
import cn.edu.tsinghua.sthu.service.ColumnService;
import java.util.List;

/**
 *
 * @author wuhz
 */
public class ShowNewManagementPageAction extends BaseAction{
    private NewService newService;
    private ColumnService columnService;
    private NewManagementPageMessage newManagementPageMessage;
    private String titleFilter = "";
    private String authorFilter = "";
    private String columnBelongFilter = "";
    private String startDateFilter = "";
    private String endDateFilter = "";
    private boolean isPlacedInColumnTopFilter = false;
    private boolean withRedirectURLFilter = false;
     
    @Override
    public String onExecute() {
        getNewManagementPageMessage().setColumnNames(columnService.getAllColumnName());
        getNewManagementPageMessage().setTitleFilter(getTitleFilter());
        getNewManagementPageMessage().setAuthorFilter(getAuthorFilter());
        getNewManagementPageMessage().setColumnBelongFilter(getColumnBelongFilter());
        getNewManagementPageMessage().setStartDateFilter(getStartDateFilter());
        getNewManagementPageMessage().setEndDateFilter(getEndDateFilter());
        getNewManagementPageMessage().setIsPlacedInColumnTopFilter(isIsPlacedInColumnTopFilter());
        getNewManagementPageMessage().setWithRedirectURLFilter(isWithRedirectURLFilter());
        getNewManagementPageMessage().setParam(request.getQueryString());
        getNewManagementPageMessage().setPageNumber(newService.getQueryNewPageCount(newManagementPageMessage));
        return SUCCESS;
    }
    
    /*
    private String generateParam()
    {
        StringBuffer str = new StringBuffer();
        str.append("titleFilter=" + getNewManagementPageMessage().getTitleFilter() + "&");
        str.append("authorFilter=" + getNewManagementPageMessage().getAuthorFilter() + "&");
        str.append("columnBelongFilter=" + getNewManagementPageMessage().getColumnBelongFilter() + "&");
        str.append("startDateFilter=" + getNewManagementPageMessage().getStartDateFilter() + "&");
        str.append("endDateFilter=" + getNewManagementPageMessage().getEndDateFilter() + "&");
        str.append("isPlacedInColumnTopFilter=" + getNewManagementPageMessage().isIsPlacedInColumnTopFilter() + "&");
        str.append("withRedirectURLFilter=" + getNewManagementPageMessage().isWithRedirectURLFilter());
        return str.toString();
    }*/

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

    public ColumnService getColumnService() {
        return columnService;
    }

    public void setColumnService(ColumnService columnService) {
        this.columnService = columnService;
    }

    public NewManagementPageMessage getNewManagementPageMessage() {
        return newManagementPageMessage;
    }

    public void setNewManagementPageMessage(NewManagementPageMessage newManagementPageMessage) {
        this.newManagementPageMessage = newManagementPageMessage;
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

    public String getStartDateFilter() {
        return startDateFilter;
    }

    public void setStartDateFilter(String startDateFilter) {
        this.startDateFilter = startDateFilter;
    }

    public String getEndDateFilter() {
        return endDateFilter;
    }

    public void setEndDateFilter(String endDateFilter) {
        this.endDateFilter = endDateFilter;
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
    
}
