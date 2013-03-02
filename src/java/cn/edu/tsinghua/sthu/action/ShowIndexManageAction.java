/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.message.ShowIndexManageMessage;
import cn.edu.tsinghua.sthu.service.IndexManageService;

/**
 *
 * @author linangran
 */
public class ShowIndexManageAction extends BaseAction{

    private IndexManageService indexManageService;
    private ShowIndexManageMessage showIndexManageMessage;
    
    @Override
    public String onExecute() {
	showIndexManageMessage.setList(indexManageService.getIndexSetting());
	return SUCCESS;
    }

    @Override
    public boolean hasAuth()
    {
	if (getCurrentUser().getAuth().getOpArticle() != -1) {
	    return true;
    	}
	else
	{
	    return false;
	}
    }
    
    @Override
    public boolean valid() {
	return true;
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

    public ShowIndexManageMessage getShowIndexManageMessage() {
	return showIndexManageMessage;
    }

    public void setShowIndexManageMessage(ShowIndexManageMessage showIndexManageMessage) {
	this.showIndexManageMessage = showIndexManageMessage;
    }
    
}
