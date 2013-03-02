/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message;

import cn.edu.tsinghua.sthu.entity.AuthEntity;

/**
 *
 * @author linangran
 */
public class HomeMessage extends BaseMessage {
    
    private AuthEntity auth;

    public AuthEntity getAuth() {
	return auth;
    }

    public void setAuth(AuthEntity auth) {
	this.auth = auth;
    }   
    
}
