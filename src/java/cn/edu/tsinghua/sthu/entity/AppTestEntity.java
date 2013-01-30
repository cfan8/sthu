/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.entity;

import javax.persistence.*;

/**
 *
 * @author linangran
 */
@Entity
@Table(name="t_apptest")
public class AppTestEntity extends BaseEntity
{
    @Column(name="username", length=16)
    private String username;

    @Column(name="password", length=64)
    private String password;

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
}
