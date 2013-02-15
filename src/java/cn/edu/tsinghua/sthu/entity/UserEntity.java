/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.entity;

import java.util.Date;
import javax.persistence.*;

/**
 *
 * @author linangran
 */

@Entity
@Table(name="t_user")
public class UserEntity extends BaseEntity
{
    @Column(name="username", length=32)
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
}
