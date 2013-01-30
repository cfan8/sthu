/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message;

import java.util.Date;

/**
 *
 * @author linangran
 */
public class LoginMessage extends BaseMessage{

    private String nickName;
    private Date loginDate;

    public LoginMessage()
    {
    }

    public LoginMessage(String nickName, Date loginDate)
    {
	this.nickName = nickName;
	this.loginDate = loginDate;
    }

    public String getNickName() {
	return nickName;
    }

    public void setNickName(String nickName) {
	this.nickName = nickName;
    }

    public Date getLoginDate() {
	return loginDate;
    }

    public void setLoginDate(Date loginDate) {
	this.loginDate = loginDate;
    }
}
