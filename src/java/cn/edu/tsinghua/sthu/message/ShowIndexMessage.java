/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message;

import cn.edu.tsinghua.sthu.entity.IndexSettingEntity;
import cn.edu.tsinghua.sthu.entity.NewEntity;
import cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity;
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
    private List<StudentActivityApplyEntity> studentActivityApplyEntitys;

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

    /**
     * @return the studentActivityApplyEntitys
     */
    public List<StudentActivityApplyEntity> getStudentActivityApplyEntitys() {
        return studentActivityApplyEntitys;
    }

    /**
     * @param studentActivityApplyEntitys the studentActivityApplyEntitys to set
     */
    public void setStudentActivityApplyEntitys(List<StudentActivityApplyEntity> studentActivityApplyEntitys) {
        this.studentActivityApplyEntitys = studentActivityApplyEntitys;
    }

}
