/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.entity;

import java.io.Serializable;
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

    @Column(name="lastlogintime")
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date lastlogintime;

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
	return lastlogintime;
    }

    public void setLastlogintime(Date lastlogintime)
    {
	this.lastlogintime = lastlogintime;
    }
}
