/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.message.AlertMessage;

/**
 *
 * @author linangran
 */
public class TestPageAction extends BaseAction{

    private int page;
    
    @Override
    public String onExecute() {
	alertMessage.setAlertTitle("翻页内容");
	alertMessage.setAlertContent("这是第" + page + "的内容");
	alertMessage.setAlertType(AlertMessage.BOX_TYPE);
	return ALERT;
    }

    @Override
    public boolean valid() {
	if (page < 1) {
	    page = 1;
	}
	return true;
    }

    @Override
    public boolean needLogin() {
	return false;
    }

    public int getPage() {
	return page;
    }

    public void setPage(int page) {
	this.page = page;
    }
    
}
