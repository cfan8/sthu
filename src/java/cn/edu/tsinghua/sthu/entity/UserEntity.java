/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.*;
import org.hibernate.FetchMode;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.Index;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

/**
 *
 * @author linangran
 */

@Entity
@Table(name="t_user")
public class UserEntity extends BaseEntity
{
    @Column(name="username", length=32)
    @Index(name="usernameIndex")
    private String username;

    @Column(name="password", length=64)
    private String password;

    @Column(name="nickname", length=32)
    private String nickname;

    @Column(name="lastlogintime", columnDefinition="DATETIME")
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    private Date lastLoginTime;
    
    @Column(name="lastloginip", length=20)
    private String lastLoginIP;
    
    @Column(name="introduction", length=4000)
    private String introduction;
    
    private String mainImg;
    private String logoImg;
    
    @OneToOne(cascade={CascadeType.ALL})
    private AuthEntity auth;
    
    @Transient
    private List<GroupImgEntity> images;

     //重写hash
    public boolean equals(Object o){
        if(this == o){
            return true;
        }
        if(o.getClass() == UserEntity.class){
            UserEntity e = (UserEntity)o;
            return (e.getID() == getID());
        }
        return false;
    }
    public int hashCode(){
        return getID();
    }
    
    public UserEntity()
    {
    }

    public UserEntity(String username, String password, String nickname)
    {
	this.username = username;
	this.password = password;
	this.nickname = nickname;
    }

    public String getUsername()
    {
	return username;
    }

    public void setUsername(String username)
    {
	this.username = username;
    }

    public String getPassword()
    {
	return password;
    }

    public void setPassword(String password)
    {
	this.password = password;
    }

    public String getNickname()
    {
	return nickname;
    }

    public void setNickname(String nickname)
    {
	this.nickname = nickname;
    }

    public Date getLastlogintime()
    {
	return lastLoginTime;
    }

    public void setLastlogintime(Date lastlogintime)
    {
	this.lastLoginTime = lastlogintime;
    }

    public AuthEntity getAuth() {
	return auth;
    }

    public void setAuth(AuthEntity auth) {
	this.auth = auth;
    }


    /**
     * @return the introduction
     */
    public String getIntroduction() {
        return introduction;
    }

    /**
     * @param introduction the introduction to set
     */
    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    /**
     * @return the mainimg
     */
    public String getMainImg() {
        return mainImg;
    }

    /**
     * @param mainimg the mainimg to set
     */
    public void setMainImg(String mainImg) {
        this.mainImg = mainImg;
    }

    /**
     * @return the logoimg
     */
    public String getLogoImg() {
        return logoImg;
    }

    /**
     * @param logoimg the logoimg to set
     */
    public void setLogoImg(String logoImg) {
        this.logoImg = logoImg;
    }

    /**
     * @return the images
     */
    public List<GroupImgEntity> getImages() {
        return images;
    }

    /**
     * @param images the images to set
     */
    public void setImages(List<GroupImgEntity> images) {
        this.images = images;
    }

    

}
