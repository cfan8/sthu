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
import cn.edu.tsinghua.sthu.entity.NewEntity;
import cn.edu.tsinghua.sthu.service.ColumnService;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

/**
 *
 * @author wuhz
 */
public class EditNewAction extends BaseAction
{
    private String title;
    private String content;
    private String author;
    private String newAbstract;
    private String columnBelong;
    private String redirectURL;
    private boolean isPlacedInColumnTop;
    private NewService newService;
    private ColumnService columnService;
    private int id = -1;
    
    @Override
    public String onExecute() 
    {
        Date date = new Date();
        if (id < 0)
        {
            if (columnBelong == null)
            {
                columnBelong = Constant.DEFAULT_COLUMN;
            }
            int ret = newService.addNew(title, content, author, newAbstract, date, redirectURL, isPlacedInColumnTop, columnBelong);
            if (ret == 0)
            {
                return SUCCESS;
            }
            else if (ret == -1)
            {
                alertMessage.setAlertContent("分组" + columnBelong + "置顶新闻最多设置" + Constant.ONTOP_NEW_NUMBER_ONE_COLUMN + "篇");
                return ALERT;
            }
            else
            {
                alertMessage.setAlertContent("分组" + columnBelong + "不存在!");
                return ALERT;
            } 
        }
        else
        {
            int ret = newService.updateNew(id, title, content, author, newAbstract, date, redirectURL, isPlacedInColumnTop, columnBelong);
            switch (ret)
            {
                case 0:
                        return SUCCESS;
                case -1:
                        alertMessage.setAlertContent("该新闻不存在!");
                        return ALERT;
                case -2:
                        alertMessage.setAlertContent("分组" + columnBelong + "置顶新闻最多设置" + Constant.ONTOP_NEW_NUMBER_ONE_COLUMN + "篇");
                        return ALERT;
                case -3:
                        alertMessage.setAlertContent("分组" + columnBelong + "不存在!");
                        return ALERT;
            }
        }
        return SUCCESS;
    }

    @Override
    public boolean valid() 
    {
        if (id < 0)
        {
            alertMessage.setAlertTitle("添加失败");
        }
        else
        {
            alertMessage.setAlertTitle("更新失败");
        }
        alertMessage.setAlertType(AlertMessage.ALERT_TYPE);
	alertMessage.setRedirectURL(AlertMessage.REFERER_URL);
        if ((title == null) || (title.length() > 64) || (title.length() < 3))
        {
	    alertMessage.setAlertContent("标题长度应该在3~64个字符之间");
            return false;
        }
        if (content.length() > 80000)
        {
            alertMessage.setAlertContent("新闻内容字数过多");
            return false;
        }
        if (author.length() > 16)
        {
            alertMessage.setAlertContent("作者应该在16个字符之内");
            return false;
        }
        if (newAbstract.length() > 250)
        {
            alertMessage.setAlertContent("新闻摘要应该在250个字符之内");
            return false;
        }
        return true;
    }

    @Override
    public boolean needLogin() 
    {
        return true;
    }
    
    public boolean hasAuth() {
	if (getCurrentUser().getAuth().getRole() == AuthEntity.USER_ROLE) {
	    return false;
	}
	if (getCurrentUser().getAuth().getOpArticle() == -1)
        {
            return false;
        }
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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNewAbstract() {
        return newAbstract;
    }

    public void setNewAbstract(String newAbstract) {
        this.newAbstract = newAbstract;
    }
    
}
