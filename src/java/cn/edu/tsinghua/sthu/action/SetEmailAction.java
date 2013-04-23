/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.entity.EmailEntity;
import cn.edu.tsinghua.sthu.service.EmailService;
import java.util.regex.Pattern;

/**
 *
 * @author elsie
 */
public class SetEmailAction extends BaseAction{
    private String email;
    private boolean isReceiveRemindEmail;
    private EmailService emailService;
    private EmailEntity emailEntity;
    @Override
    public String onExecute() throws Exception {
        emailEntity = new EmailEntity(getCurrentUser().getID(),email, isIsReceiveRemindEmail());
        if(emailService.updateEmail(emailEntity)){
            alertMessage.setSimpleAlert("邮箱修改成功！", "showEmail.do");
        }
        else{
            alertMessage.setSimpleAlert("邮箱修改失败！", "showEmail.do");
        }
        return ALERT;
    }

    @Override
    public boolean valid() {
        if(isValid(getEmail())){
            if(isVaildEmail(getEmail())){
                alertMessage.setSimpleAlert("修改成功！");
                return true;
            }
            else{
                alertMessage.setSimpleAlert("请输入正确的邮箱！");
                return false;
            }
        }
        else{
            alertMessage.setSimpleAlert("您输入的信息有误！");
            return false;
        }
    }

    @Override
    public boolean needLogin() {
        return true;
    }
    
    public static boolean isVaildEmail(String email){ 
      String emailPattern="[a-zA-Z0-9][a-zA-Z0-9._-]{2,16}[a-zA-Z0-9]@[a-zA-Z0-9]+.[a-zA-Z0-9]+"; 
      boolean result=Pattern.matches(emailPattern, email); 
      return result; 
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the isReceiveRemindEmail
     */
    public boolean isIsReceiveRemindEmail() {
        return isReceiveRemindEmail;
    }

    /**
     * @param isReceiveRemindEmail the isReceiveRemindEmail to set
     */
    public void setIsReceiveRemindEmail(boolean isReceiveRemindEmail) {
        this.isReceiveRemindEmail = isReceiveRemindEmail;
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
