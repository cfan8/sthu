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
    @Column(name="title", length=32, nullable = false)
    private String title;

    @Column(name="content", length=6000)
    private String content;
    
    @Column(name="author", length=8)
    private String author;
    
    @Column(name="updatetime")
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    private Date updateTime;
    
    @Column(name="redirectURL")
    private String redirectURL;
    
    @Column(name="isPlacedInColumnTop")
    private boolean isPlacedInColumnTop;
    
    @Column(name="browseNumber")
    private int browseNumber;
    
    @OneToOne(cascade={CascadeType.DETACH})
    private ColumnEntity columnBelong;

    public NewEntity() {
    }

    public NewEntity(String title, String content, String author, Date updateTime, String redirectURL, boolean isPlacedInColumnTop, ColumnEntity columnBelong) {
        this.title = title;
        this.content = content;
        this.author = author;
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
}
