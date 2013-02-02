/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message;

/**
 *
 * @author linangran
 */
public class AlertMessage
{
    private String alertTitle;
    private String redirectURL = REFERER_URL;
    private String alertContent;
    private int alertType = ALERT_TYPE;

    public AlertMessage()
    {
    }

    public AlertMessage(String alertTitle, String alertContent, int alertType, String redirectURL)
    {
	this.alertTitle = alertTitle;
	this.alertContent = alertContent;
	this.alertType = alertType;
	this.redirectURL = redirectURL;
    }

    public static final int ALERT_TYPE = 1;
    public static final int BOX_TYPE = 2;

    //TODO: implement this function;

    public static final String REFERER_URL = "referer url";

    public String getAlertTitle() {
	return alertTitle;
    }

    public void setAlertTitle(String alertTitle) {
	this.alertTitle = alertTitle;
    }

    public void setSimpleAlert(String content)
    {
	this.alertTitle = content;
	this.alertContent = content;
	this.alertType = AlertMessage.ALERT_TYPE;
	this.redirectURL = AlertMessage.REFERER_URL;
    }
    
     public void setSimpleAlert(String content, String redirectURL)
    {
	this.alertTitle = content;
	this.alertContent = content;
	this.alertType = AlertMessage.ALERT_TYPE;
	this.redirectURL = redirectURL;
    }

    public String getAlertContent() {
	return alertContent;
    }

    public void setAlertContent(String alertContent) {
	this.alertContent = alertContent;
    }

    public int getAlertType() {
	return alertType;
    }

    public void setAlertType(int alertType) {
	this.alertType = alertType;
    }

    public String getRedirectURL() {
	return redirectURL;
    }

    public void setRedirectURL(String redirectURL) {
	this.redirectURL = redirectURL;
    }
}
