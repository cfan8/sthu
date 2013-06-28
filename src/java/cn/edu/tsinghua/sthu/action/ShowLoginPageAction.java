/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.Util;
import cn.edu.tsinghua.sthu.message.ShowLoginPageMessage;

/**
 *
 * @author linangran
 */
public class ShowLoginPageAction extends BaseAction {

    private String redirectURL;
    private ShowLoginPageMessage showLoginPageMessage;
    private String url;
    public static final String REDIRECT = "redirect";

    @Override
    public String onExecute() {
	if (isLogin()) {
	    url = Util.decodeURL(redirectURL);
	    return REDIRECT;
	} else {
	    showLoginPageMessage.setRedirectURL(redirectURL);
	    showLoginPageMessage.setPublicKey(Util.publicString);
	    showLoginPageMessage.setModulus(Util.modulusString);
	    showLoginPageMessage.setTimestamp(System.currentTimeMillis());
	    return SUCCESS;
	}
    }

    @Override
    public boolean valid() {
	if (getRedirectURL() == null) {
	    setRedirectURL(getReferer());
	    if (isValid(redirectURL))
	    {
		redirectURL = Util.encodeURL(redirectURL);
	    }
	    else
	    {
		redirectURL = Util.encodeURL("/index.do");
	    }
	}
	return true;
    }

    public String getRedirectURL() {
	return redirectURL;
    }

    public void setRedirectURL(String redirectURL) {
	this.redirectURL = redirectURL;
    }

    public ShowLoginPageMessage getShowLoginPageMessage() {
	return showLoginPageMessage;
    }

    public void setShowLoginPageMessage(ShowLoginPageMessage showLoginPageMessage) {
	this.showLoginPageMessage = showLoginPageMessage;
    }

    public String getUrl() {
	return url;
    }

    public void setUrl(String url) {
	this.url = url;
    }

    @Override
    public boolean needLogin() {
	return false;
    }
}
