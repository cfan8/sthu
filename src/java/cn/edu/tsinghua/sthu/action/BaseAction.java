/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.entity.UserEntity;
import cn.edu.tsinghua.sthu.message.AlertMessage;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import java.util.Map;


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

    protected ActionContext context;
    protected Map<String, Object> session;

    @Override
    public String execute() throws Exception
    {
	this.context = ActionContext.getContext();
	this.session = this.context.getSession();
	if (hasAuth() == false)
	{
	    alertMessage.setAlertTitle("无法访问页面！");
	    alertMessage.setAlertContent("您请求的内容不存在，或者您缺少访问此内容的权限。");
	    alertMessage.setAlertType(AlertMessage.BOX_TYPE);
	    alertMessage.setRedirectURL(AlertMessage.REFERER_URL);
	    return ALERT;
	}
	if (valid())
	{
	    return onExecute();
	}
	else
	{
	    return ALERT;
	}
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

    public abstract boolean valid();
    
    public boolean hasAuth()
    {
	return true;
    }
    
    public boolean isLogin()
    {
	Boolean isLogin = (Boolean)session.get("isLogin");
	if (isLogin == null || isLogin.booleanValue() == false)
	{
	    return false;
	}
	else
	{
	    return true;
	}
    }
    
    public UserEntity getCurrentUser()
    {
	if (isLogin() == false) {
	    return null;
	}
	else
	{
	    UserEntity entity = (UserEntity) session.get("userinfo");
	    return entity;
	}
    }
    
    public void setSession(String key, Object value)
    {
	session.put(key, value);
    }
    
    public Object getSession(String key)
    {
	return session.get(key);
    }
}
