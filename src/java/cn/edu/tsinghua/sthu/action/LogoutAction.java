/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.Util;

/**
 *
 * @author linangran
 */
public class LogoutAction extends BaseAction {

    private String redirectURL;

    @Override
    public String onExecute() {
	if (isLogin()) {
	    session.remove("isLogin");
	    session.remove("userinfo");
	}
	alertMessage.setSimpleAlert("您已成功登出！", redirectURL);
	return ALERT;
    }

    @Override
    public boolean valid() {
	if (isValid(redirectURL) == false) {
	    redirectURL = "/index.do";
	} else {
	    redirectURL = Util.decodeURL(redirectURL);
	}
	return true;
    }

    public String getRedirectURL() {
	return redirectURL;
    }

    public void setRedirectURL(String redirectURL) {
	this.redirectURL = redirectURL;
    }

    @Override
    public boolean needLogin() {
	return false;
    }
}
