/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.entity;

import javax.persistence.*;

/**
 *
 * @author wuhz
 */

@Entity
@Table(name="t_column")
public class ColumnEntity extends BaseEntity
{
    @Column(name="name", length=32, nullable=false, unique=true)
    private String name;
    
    @Column(name="description", length=1024)
    private String description;
    
    @Column(name="isVisibleForUser", nullable=false)
    private boolean isVisibleForUser;
    
    @Column(name="isFixedInHomePage", nullable=false)
    private boolean isFixedInHomePage;
    
    public ColumnEntity() {
    }

    public ColumnEntity(String name, String description, boolean isVisibleForUser, boolean isFixedInHomePage) {
        this.name = name;
        this.description = description;
        this.isVisibleForUser = isVisibleForUser;
        this.isFixedInHomePage = isFixedInHomePage;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isIsVisibleForUser() {
        return isVisibleForUser;
    }

    public void setIsVisibleForUser(boolean isVisibleForUser) {
        this.isVisibleForUser = isVisibleForUser;
    }

    public boolean isIsFixedInHomePage() {
        return isFixedInHomePage;
    }

    public void setIsFixedInHomePage(boolean isFixedInHomePage) {
        this.isFixedInHomePage = isFixedInHomePage;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
