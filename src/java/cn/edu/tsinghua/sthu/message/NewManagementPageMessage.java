/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message;

import java.util.List;

/**
 *
 * @author wuhz
 */
public class NewManagementPageMessage {
    private int pageNumber;
    private List<String> columnNames;
    private String titleFilter = "";
    private String authorFilter = "";
    private String columnBelongFilter = "";
    private String startDateFilter = "";
    private String endDateFilter = "";
    private boolean isPlacedInColumnTopFilter = false;
    private boolean withRedirectURLFilter = false;
    private String param = "";

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    public List<String> getColumnNames() {
        return columnNames;
    }

    public void setColumnNames(List<String> columnNames) {
        this.columnNames = columnNames;
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

    public String getParam() {
        return param;
    }

    public void setParam(String param) {
        this.param = param;
    }
}
