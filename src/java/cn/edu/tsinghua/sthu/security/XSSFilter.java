/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.security;

import cn.edu.tsinghua.sthu.action.BaseAction;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.owasp.validator.html.*;

/**
 *
 * @author linangran
 */
public class XSSFilter {

    private static Policy policy = null;
    private static AntiSamy antiSamy = null;
    static 
    {
	try {
	    policy = Policy.getInstance(XSSFilter.class.getResource("").getPath() + "antisamy-myspace-1.4.4.xml");
	    antiSamy = new AntiSamy(policy);
	} catch (PolicyException ex) {
	    Logger.getLogger(XSSFilter.class.getName()).log(Level.SEVERE, null, ex);
	}
    }
    
    public static void xssClean(Class cls, BaseAction obj) {
	Field[] declaredFields = cls.getDeclaredFields();
	for (Field f : declaredFields) {
	    XSSProtect annotation = f.getAnnotation(XSSProtect.class);
	    if (annotation != null && annotation.value() != XSSProtectLevel.None) {
		try {
		    String filedName = f.getName();
		    filedName = filedName.substring(0, 1).toUpperCase() + filedName.substring(1);
		    Method getMethod = cls.getMethod("get" + filedName);
		    Method setMethod = cls.getMethod("set" + filedName, String.class);
		    if (annotation.value() == XSSProtectLevel.Strict)
		    {
			String text = (String) getMethod.invoke(obj);
			setMethod.invoke(obj, strictFilter(text));
		    }
		    else if (annotation.value() == XSSProtectLevel.RichText)
		    {
			String text = (String) getMethod.invoke(obj);
			setMethod.invoke(obj, richTextFilter(text));
		    }
		} catch (Exception ex) {
		    Logger.getLogger(XSSFilter.class.getName()).log(Level.SEVERE, null, ex);
		    continue;
		}
	    }
	}
    }

    public static String strictFilter(String text) {
	StringBuilder builder = new StringBuilder(text);
	String[] toReplace = {"&", "<", ">", "\"", "'", "/"};
	String[] toFill = {"&amp;", "&lt;", "&gt;", "&quot;", "&#x27;", "&#x2F;"};
	for (int i = 0; i < toReplace.length; i++)
	{
	    int t = 0;
	    while(true)
	    {
		t = builder.indexOf(toReplace[i], t);
		if (t == -1) {
		    break;
		}
		else{
		    builder.replace(t, t + 1, toFill[i]);
		    t += toFill[i].length();
		}
	    }
	}
	return builder.toString();
    }
    
    public static String richTextFilter(String text)
    {
	try {
	    String cleanText = antiSamy.scan(text).getCleanHTML();
	    return cleanText;
	} catch (Exception ex) {
	    Logger.getLogger(XSSFilter.class.getName()).log(Level.SEVERE, null, ex);
	    return text;
	}
    }
}
