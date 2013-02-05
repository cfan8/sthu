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
public class TestUEditorAction extends BaseAction{
    private String content;

    @Override
    public String onExecute() {
	alertMessage.setAlertTitle("UEditor提交的内容为：");
	alertMessage.setAlertContent(content);
	alertMessage.setAlertType(AlertMessage.BOX_TYPE);
	alertMessage.setRedirectURL(AlertMessage.REFERER_URL);
	return ALERT;
    }

    @Override
    public boolean valid() {
	return true;
    }

    @Override
    public boolean needLogin() {
	return false;
    }

    public String getContent() {
	return content;
    }

    public void setContent(String content) {
	this.content = content;
    }
}
