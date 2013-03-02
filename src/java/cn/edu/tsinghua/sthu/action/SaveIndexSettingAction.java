/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.entity.IndexSettingEntity;
import cn.edu.tsinghua.sthu.service.IndexManageService;
import java.util.List;

/**
 *
 * @author linangran
 */
public class SaveIndexSettingAction extends BaseAction{

    private IndexManageService indexManageService;
    private String image;
    private String title;
    private String link;
    private String enable;
    
    @Override
    public String onExecute() {
	List<IndexSettingEntity> list = indexManageService.getIndexSetting();
	String[] images = image.split("\\|\\|", -1);
	String[] titles = title.split("\\|\\|", -1);
	String[] links = link.split("\\|\\|", -1);
	String[] enables = enable.split("\\|\\|", -1);
	for (int i = 0; i < list.size(); i++)
	{
	    IndexSettingEntity entity = list.get(i);
	    entity.setImage(images[i]);
	    entity.setTitle(titles[i]);
	    entity.setLink(links[i]);
	    entity.setEnabled("true".equals(enables[i]) ? true:false);
	}
	indexManageService.updateSetting(list);
	alertMessage.setSimpleAlert("更新成功！");
	return ALERT;
    }
    
    @Override
    public boolean hasAuth()
    {
	if (getCurrentUser().getAuth().getOpArticle() == -1) {
	    return false;
	}
	else
	{
	    return true;
	}
    }

    @Override
    public boolean valid() {
	if (isValid(image) && isValid(title) && isValid(link) && isValid(enable))
	{
	    return true;
	}
	else
	{
	    alertMessage.setSimpleAlert("输入错误！");
	    return false;
	}
    }

    @Override
    public boolean needLogin() {
	return true;
    }

    public IndexManageService getIndexManageService() {
	return indexManageService;
    }

    public void setIndexManageService(IndexManageService indexManageService) {
	this.indexManageService = indexManageService;
    }

    public String getImage() {
	return image;
    }

    public void setImage(String image) {
	this.image = image;
    }

    public String getTitle() {
	return title;
    }

    public void setTitle(String title) {
	this.title = title;
    }

    public String getLink() {
	return link;
    }

    public void setLink(String link) {
	this.link = link;
    }

    public String getEnable() {
	return enable;
    }

    public void setEnable(String enable) {
	this.enable = enable;
    }
    
}
