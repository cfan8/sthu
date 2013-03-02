/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message;

import cn.edu.tsinghua.sthu.entity.IndexSettingEntity;
import cn.edu.tsinghua.sthu.entity.NewEntity;
import java.util.List;

/**
 *
 * @author wuhz
 */
public class ShowIndexMessage {
    private List<NewEntity> indexTopNews;
    private List<NewEntity> indexBottomLeftNews;
    private List<NewEntity> indexBottomCenterNews;
    private List<NewEntity> indexBottomRightNews;
    private List<IndexSettingEntity> indexSettings;

    public List<NewEntity> getIndexTopNews() {
        return indexTopNews;
    }

    public void setIndexTopNews(List<NewEntity> indexTopNews) {
        this.indexTopNews = indexTopNews;
    }

    public List<NewEntity> getIndexBottomLeftNews() {
        return indexBottomLeftNews;
    }

    public void setIndexBottomLeftNews(List<NewEntity> indexBottomLeftNews) {
        this.indexBottomLeftNews = indexBottomLeftNews;
    }

    public List<NewEntity> getIndexBottomCenterNews() {
        return indexBottomCenterNews;
    }

    public void setIndexBottomCenterNews(List<NewEntity> indexBottomCenterNews) {
        this.indexBottomCenterNews = indexBottomCenterNews;
    }

    public List<NewEntity> getIndexBottomRightNews() {
        return indexBottomRightNews;
    }

    public void setIndexBottomRightNews(List<NewEntity> indexBottomRightNews) {
        this.indexBottomRightNews = indexBottomRightNews;
    }

    public List<IndexSettingEntity> getIndexSettings() {
	return indexSettings;
    }

    public void setIndexSettings(List<IndexSettingEntity> indexSettings) {
	this.indexSettings = indexSettings;
    }

}
