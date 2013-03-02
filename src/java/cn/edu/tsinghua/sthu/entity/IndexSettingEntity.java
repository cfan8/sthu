/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 *
 * @author linangran
 */
@Entity
@Table(name="t_index_setting_entity")
public class IndexSettingEntity extends BaseEntity{
    
    private String link;
    private String title;
    private String image;
    private boolean enabled;

    public IndexSettingEntity()
    {
	this.link = "";
	this.title = "";
	this.image = "";
	this.enabled = false;
    }
    
    public String getLink() {
	return link;
    }

    public void setLink(String link) {
	this.link = link;
    }

    public String getTitle() {
	return title;
    }

    public void setTitle(String title) {
	this.title = title;
    }

    public String getImage() {
	return image;
    }

    public void setImage(String image) {
	this.image = image;
    }

    public boolean isEnabled() {
	return enabled;
    }

    public void setEnabled(boolean enabled) {
	this.enabled = enabled;
    }
    
}
