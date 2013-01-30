/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.message.AlertMessage;
import com.opensymphony.xwork2.Action;


/**
 *
 * @author linangran
 */
public abstract class BaseAction implements Action
{
    public static final String ALERT = "alert";

    public static final int XSS_STRICT_FILTER = 1;
    public static final int XSS_RICHTEXT_FILTER = 2;
    public static final int XSS_NONE_FILTER = 3;

    public static final int XSS_DEFAULT_FILTER = XSS_NONE_FILTER;

    protected AlertMessage alertMessage;
    private int xssFilterLevel = XSS_DEFAULT_FILTER;


    @Override
    public String execute() throws Exception
    {
	return onExecute();
    }

    public abstract String onExecute();

    public int getXssFilterLevel()
    {
	return xssFilterLevel;
    }

    public void setXssFilterLevel(int xssFilterLevel)
    {
	this.xssFilterLevel = xssFilterLevel;
    }

    public AlertMessage getAlertMessage()
    {
	return alertMessage;
    }

    public void setAlertMessage(AlertMessage alertMessage)
    {
	this.alertMessage = alertMessage;
    }

    public static boolean isValid(String t)
    {
	if (t == null || t.trim().length() == 0)
	    return false;
	else
	    return true;
    }
}
