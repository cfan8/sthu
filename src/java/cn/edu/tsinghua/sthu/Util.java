/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu;

import cn.edu.tsinghua.sthu.action.BaseAction;
import cn.edu.tsinghua.sthu.message.AlertMessage;
import cn.edu.tsinghua.sthu.message.BaseMessage;
import com.mchange.lang.ByteUtils;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import java.io.*;
import java.lang.reflect.Field;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author linangran
 */
public class Util
{

    public static AlertMessage getAlertMessage()
    {
	HttpServletRequest request = ServletActionContext.getRequest();
	return (AlertMessage)request.getAttribute("alertMessage");
    }
    
    public static <T, P extends BaseAction> T getMessage(Class<P> type)
    {
	HttpServletRequest request = ServletActionContext.getRequest();
	String fieldName = null;
	Field[] declaredFields = type.getDeclaredFields();
	for (int i = 0; i < declaredFields.length; i++)
	{
	    if (BaseMessage.class.isAssignableFrom(declaredFields[i].getType()))
	    {
		fieldName = declaredFields[i].getName();
		break;
	    }
	}
	if (fieldName == null)
	{
	    return null;
	}
	else
	{
	    return (T) request.getAttribute(fieldName);
	}
    }
    
    public static String getMD5(String input)
    {
	String output = null;
	try {
	    byte[] hashBytes = MessageDigest.getInstance("MD5").digest(input.getBytes());
	    StringBuffer buffer = new StringBuffer();
	    for (int i = 0; i < hashBytes.length; i++)
	    {
		buffer.append(Integer.toHexString((int)(hashBytes[i] & 0xFF)));
	    }
	    output = buffer.toString();
	} catch (NoSuchAlgorithmException ex) {
	    Logger.getLogger(Util.class.getName()).log(Level.SEVERE, null, ex);
	}
	return output;
    }
    
    public static String encodeURL(String url)
    {
	try {
	    return URLEncoder.encode(url, "UTF-8");
	} catch (UnsupportedEncodingException ex) {
	    Logger.getLogger(Util.class.getName()).log(Level.SEVERE, null, ex);
	}
	return null;
    }
    
    public static String decodeURL(String url)
    {
	try {
	    return URLDecoder.decode(url, "UTF-8");
	} catch (UnsupportedEncodingException ex) {
	    Logger.getLogger(Util.class.getName()).log(Level.SEVERE, null, ex);
	}
	return null;
    }
    
    public static String dateToStringAccurateToMinute(Date date)
    {
        SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日 HH:mm");
        return format.format(date);
    }
    
    public static String dateToStringAccurateToDay(Date date)
    {
        SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日");
        return format.format(date);
    }
    
    public static Date getBeforeDate(long shift)
    {
        Date date = new Date();
        return new Date(date.getTime() - shift);
    }

    /*
     使用ClassLoader查找templates可能会产生各种问题，弃用！
     public static final String TEMPALTE_PATH = "templates/";

     public static final String GENETAL_TEMPLATE = "general.jsp";
     public static final String[] TEMPLATES = {GENETAL_TEMPLATE};

     private static String t;
     public static void showT()
     {
     System.out.println(t);
     }


     private static Hashtable<String, StringBuffer[]> templateTable;
     static{
     //Loading all templates
     templateTable = new Hashtable<String, StringBuffer[]>();
     File file = new File("");
     String path = Util.class.getClassLoader().getResource("").getPath();
     File[] listFiles = file.getParentFile().listFiles();
     for (int i = 0; i < TEMPLATES.length; i++)
     {
     try {
     BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(TEMPALTE_PATH + TEMPLATES[i])));
     StringBuffer buffer = new StringBuffer();
     String line = "";
     while (line != null)
     {
     line = reader.readLine();
     buffer.append(line);
     }
     reader.close();
     String[] name = TEMPLATES[i].split(".");
     String[] content = buffer.toString().split("%body%");
     StringBuffer[] contentBuffer = new StringBuffer[2];
     contentBuffer[0] = new StringBuffer(content[0]);
     contentBuffer[1] = new StringBuffer(content[1]);
     templateTable.put(name[0], contentBuffer);
     } catch (IOException ex) {
     Logger.getLogger(Util.class.getName()).log(Level.SEVERE, null, ex);
     }
     }
     }

     public static String getTemplateHeader(String templateName, String title)
     {
     StringBuffer[] content = templateTable.get(templateName);
     StringBuffer header = content[0];
     int start = header.indexOf("%title%");
     header = header.replace(start, start+ 7, title);
     return header.toString();
     }

     public static String getTemplateFooter(String templateName)
     {
     StringBuffer[] content = templateTable.get(templateName);
     return content[1].toString();
     }*/
}
