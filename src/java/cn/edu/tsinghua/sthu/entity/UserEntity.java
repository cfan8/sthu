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
    
    @OneToOne(cascade={CascadeType.ALL})
    private AuthEntity auth;

    @ManyToMany(cascade={CascadeType.ALL})
    @LazyCollection(LazyCollectionOption.FALSE)
    @JoinTable(name="user_activity", joinColumns={@JoinColumn(name="user_id")}, inverseJoinColumns={@JoinColumn(name="activity_id")})
    private Set<StudentActivityApplyEntity> interestedActivities = new HashSet<StudentActivityApplyEntity>();

    @ManyToMany(cascade={CascadeType.ALL})
    @LazyCollection(LazyCollectionOption.FALSE)
    @JoinTable(name="user_group", joinColumns={@JoinColumn(name="user_id")}, inverseJoinColumns={@JoinColumn(name="group_id")})
    private Set<UserEntity> interestedGroups = new HashSet<UserEntity>();
    
    @ManyToMany(cascade={CascadeType.ALL})
    @LazyCollection(LazyCollectionOption.FALSE)
    @JoinTable(name="user_group", joinColumns={@JoinColumn(name="group_id")}, inverseJoinColumns={@JoinColumn(name="user_id")})
    private Set<UserEntity> interestedGroupsOf = new HashSet<UserEntity>();
    
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
     * @return the interestedActivities
     */
    public Set<StudentActivityApplyEntity> getInterestedActivities() {
        return interestedActivities;
    }

    /**
     * @param interestedActivities the interestedActivities to set
     */
    public void setInterestedActivities(Set<StudentActivityApplyEntity> interestedActivities) {
        this.interestedActivities = interestedActivities;
    }

    /**
     * @return the interestedGroups
     */
    public Set<UserEntity> getInterestedGroups() {
        return interestedGroups;
    }

    /**
     * @param interestedGroups the interestedGroups to set
     */
    public void setInterestedGroups(Set<UserEntity> interestedGroups) {
        this.interestedGroups = interestedGroups;
    }

    /**
     * @return the interestedGroupsOf
     */
    public Set<UserEntity> getInterestedGroupsOf() {
        return interestedGroupsOf;
    }

    /**
     * @param interestedGroupsOf the interestedGroupsOf to set
     */
    public void setInterestedGroupsOf(Set<UserEntity> interestedGroupsOf) {
        this.interestedGroupsOf = interestedGroupsOf;
    }

    

}
