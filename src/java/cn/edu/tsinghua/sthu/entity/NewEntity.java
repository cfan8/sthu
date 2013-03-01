/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.entity;

import java.util.Date;
import javax.persistence.*;

/**
 *
 * @author wuhz
 */

@Entity
@Table(name="t_new")
public class NewEntity extends BaseEntity
{
    @Column(name="title", length=64, nullable = false)
    private String title;

    @Column(name="content", length=80000)
    private String content;
    
    @Column(name="author", length=16)
    private String author;
    
    @Column(name="newAbstract", length=250)
    private String newAbstract;
    
    @Column(name="updatetime")
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    private Date updateTime;
    
    @Column(name="redirectURL")
    private String redirectURL;
    
    @Column(name="isPlacedInColumnTop")
    private boolean isPlacedInColumnTop;
    
    @Column(name="browseNumber")
    private int browseNumber = 0;
    
    @ManyToOne(cascade={CascadeType.DETACH})
    private ColumnEntity columnBelong;

    public NewEntity() {
    }

    public NewEntity(String title, String content, String author, String newAbstract, Date updateTime, String redirectURL, boolean isPlacedInColumnTop, ColumnEntity columnBelong) {
        this.title = title;
        this.content = content;
        this.author = author;
        this.newAbstract = newAbstract;
        this.updateTime = updateTime;
        this.redirectURL = redirectURL;
        this.isPlacedInColumnTop = isPlacedInColumnTop;
        this.columnBelong = columnBelong;
        this.browseNumber = 0;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public ColumnEntity getColumnBelong() {
        return columnBelong;
    }

    public void setColumnBelong(ColumnEntity columnBelong) {
        this.columnBelong = columnBelong;
    }

    public String getRedirectURL() {
        return redirectURL;
    }

    public void setRedirectURL(String redirectURL) {
        this.redirectURL = redirectURL;
    }

    public boolean isIsPlacedInColumnTop() {
        return isPlacedInColumnTop;
    }

    public void setIsPlacedInColumnTop(boolean isPlacedInColumnTop) {
        this.isPlacedInColumnTop = isPlacedInColumnTop;
    }

    public int getBrowseNumber() {
        return browseNumber;
    }

    public void setBrowseNumber(int browseNumber) {
        this.browseNumber = browseNumber;
    }

    public String getNewAbstract() {
        return newAbstract;
    }

    public void setNewAbstract(String newAbstract) {
        this.newAbstract = newAbstract;
    }

}
