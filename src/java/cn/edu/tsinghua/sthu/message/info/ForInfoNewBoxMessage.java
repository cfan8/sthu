/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message.info;

import cn.edu.tsinghua.sthu.entity.ColumnEntity;
import cn.edu.tsinghua.sthu.entity.NewEntity;
import java.util.List;

/**
 *
 * @author wuhz
 */
public class ForInfoNewBoxMessage {
    private List<NewEntity> news;
    private ColumnEntity columnEntity;

    public List<NewEntity> getNews() {
        return news;
    }

    public void setNews(List<NewEntity> news) {
        this.news = news;
    }

    public ColumnEntity getColumnEntity() {
        return columnEntity;
    }

    public void setColumnEntity(ColumnEntity columnEntity) {
        this.columnEntity = columnEntity;
    }
}
