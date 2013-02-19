/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.message.AlertMessage;
import cn.edu.tsinghua.sthu.service.NewService;
import java.util.Date;
import cn.edu.tsinghua.sthu.constant.Constant;
import cn.edu.tsinghua.sthu.entity.ColumnEntity;
import cn.edu.tsinghua.sthu.service.ColumnService;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

/**
 *
 * @author wuhz
 */
public class AddNewAction extends BaseAction
{
    private String title;
    private String content;
    private String author;
    private String columnBelong;
    private String redirectURL;
    private boolean isPlacedInColumnTop;
    private NewService newService;
    private ColumnService columnService;
    
    @Override
    public String onExecute() 
    {
        Date date = new Date();
        if (columnBelong == null)
        {
            columnBelong = Constant.DEFAULT_COLUMN;
        }
        if ((isPlacedInColumnTop == true) && (newService.getOnTopCountByColumn(columnBelong) >= Constant.ONTOP_NEW_NUMBER_ONE_COLUMN))
        {
            alertMessage.setAlertTitle("添加失败");
            alertMessage.setAlertContent("分组" + columnBelong + "置顶新闻最多设置" + Constant.ONTOP_NEW_NUMBER_ONE_COLUMN + "篇");
            return ALERT;
        }
        if (newService.addNew(title, content, author, date, redirectURL, isPlacedInColumnTop, columnBelong))
	{
            return SUCCESS;
	}
        else
        {
            alertMessage.setAlertTitle("添加失败");
            alertMessage.setAlertContent("分组" + columnBelong + "不存在!");
            return ALERT;
        } 
    }

    @Override
    public boolean valid() 
    {
        alertMessage.setAlertTitle("添加失败");
        alertMessage.setAlertType(AlertMessage.ALERT_TYPE);
	alertMessage.setRedirectURL(AlertMessage.REFERER_URL);
        if ((title == null) || (title.length() > 32) || (title.length() < 3))
        {
	    alertMessage.setAlertContent("标题长度应该在3~32个字符之间");
            return false;
        }
        if (content.length() > 6000)
        {
            alertMessage.setAlertContent("正文长度应该在6000个字符之内");
            return false;
        }
        if (author.length() > 8)
        {
            alertMessage.setAlertContent("作者应该在8个字符之内");
            return false;
        }
        return true;
    }

    @Override
    public boolean needLogin() 
    {
        return false;
    }
    
    @Override
    public boolean hasAuth() 
    {
	/*if (getCurrentUser().getAuth().getRole() != AuthEntity.ADMIN_ROLE) 
        {
	    return false;
	}
	else
	{
	    return true;
	}*/
        return true;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getColumnBelong() {
        return columnBelong;
    }

    public void setColumnBelong(String columnBelong) {
        this.columnBelong = columnBelong;
    }

    public NewService getNewService() {
        return newService;
    }

    public void setNewService(NewService newService) {
        this.newService = newService;
    }

    public String getRedirectURL() {
        return redirectURL;
    }

    public void setRedirectURL(String redirectURL) {
        this.redirectURL = redirectURL;
    }

    public boolean isIsPlacedInColumnTop() {
        return isPlacedInColumnTop;
    }

    public void setIsPlacedInColumnTop(boolean isPlacedInColumnTop) {
        this.isPlacedInColumnTop = isPlacedInColumnTop;
    }

    public ColumnService getColumnService() {
        return columnService;
    }

    public void setColumnService(ColumnService columnService) {
        this.columnService = columnService;
    }
    
}
