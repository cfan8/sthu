/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message;

/**
 *
 * @author linangran
 */
public class ShowLoginPageMessage extends BaseMessage{
    private String redirectURL;

    public String getRedirectURL() {
	return redirectURL;
    }

    public void setRedirectURL(String redirectURL) {
	this.redirectURL = redirectURL;
    }
}
