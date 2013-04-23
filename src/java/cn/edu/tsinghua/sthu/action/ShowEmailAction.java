/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;
import cn.edu.tsinghua.sthu.message.ShowEmailMessage;
import cn.edu.tsinghua.sthu.service.EmailService;
/**
 *
 * @author elsie
 */
public class ShowEmailAction extends BaseAction{
    private ShowEmailMessage showEmailMessage;
    private EmailService emailService;
    @Override
    public String onExecute(){
        
        getShowEmailMessage().setEmailEntity(emailService.getEmailByUserid(getCurrentUser().getID()));
        return SUCCESS;
    }

    @Override
    public boolean valid() {
        return true;
    }

    @Override
    public boolean needLogin() {
        return true;
    }

    /**
     * @return the showEmailMessage
     */
    public ShowEmailMessage getShowEmailMessage() {
        return showEmailMessage;
    }

    /**
     * @param showEmailMessage the showEmailMessage to set
     */
    public void setShowEmailMessage(ShowEmailMessage showEmailMessage) {
        this.showEmailMessage = showEmailMessage;
    }

    /**
     * @return the emailService
     */
    public EmailService getEmailService() {
        return emailService;
    }

    /**
     * @param emailService the emailService to set
     */
    public void setEmailService(EmailService emailService) {
        this.emailService = emailService;
    }
    
}
