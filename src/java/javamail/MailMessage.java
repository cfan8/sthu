/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package javamail;

import java.util.Date;
import java.util.Properties;
import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;   
import javax.mail.Multipart;  
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeBodyPart;   
import javax.mail.internet.MimeMultipart;  
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.mail.BodyPart;
import org.springframework.mail.MailException;
/**
 *
 * @author elsie
 */
public class MailMessage {
    private String receiverName;
    private String applyLink;
    private String mail_from = "xxx@mails.tsinghua.edu.cn";
    private String mail_head_name = "学生清华";
    private String mail_head_value = "学生清华邮件提醒";
    private String mail_to = "xxx@gmail.com";
    private String mail_subject = "新教室申请/活动资源申请提醒";
    private String mail_body = "您好！您有新的教室/活动需要审批，请登录学生清华查看 <a href='www.student.tsinghua.edu.cn/login.do?redirectURL=%2factivity%2fshowApply.do%3fapplyId%3d4420'>点我查看</a>";
    private String personalName = "学生清华";
    public MailMessage(){
        
    }
    public MailMessage(String receiverName,String receiverEmail, String applyLink){
        this.receiverName = receiverName;
        this.mail_to = receiverEmail;
        this.applyLink = applyLink;
    }
    public MimeMessage getMimeMessageFromMailMessage(Session session) throws Exception{
        setMail_body();
        MimeMessage message = new MimeMessage(session);
        // message.setContent("foobar, "application/x-foobar"); // 设置邮件格式
        Multipart mainPart = new MimeMultipart(); 
        BodyPart mbp = new MimeBodyPart();
        mbp.setContent(getMail_body(),"text/html; charset=utf-8");
        mainPart.addBodyPart(mbp);
        message.setContent(mainPart);
        message.setSubject(getMail_subject()); // 设置邮件主题
        //message.setText(getMail_body()); // 设置邮件正文
        message.setHeader(getMail_head_name(), getMail_head_value()); // 设置邮件标题
        message.setSentDate(new Date()); // 设置邮件发送日期
        Address address = new InternetAddress(getMail_from(), getPersonalName());
        message.setFrom(address); // 设置邮件发送者的地址
        Address toAddress = new InternetAddress(getMail_to()); // 设置邮件接收方的地址
        message.addRecipient(Message.RecipientType.TO, toAddress);
        return message;
    }
    /**
     * @return the receiverName
     */
    public String getReceiverName() {
        return receiverName;
    }

    /**
     * @param receiverName the receiverName to set
     */
    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    /**
     * @return the applyLink
     */
    public String getApplyLink() {
        return applyLink;
    }

    /**
     * @param applyLink the applyLink to set
     */
    public void setApplyLink(String applyLink) {
        this.applyLink = applyLink;
    }

    /**
     * @return the mail_from
     */
    public String getMail_from() {
        return mail_from;
    }

    /**
     * @param mail_from the mail_from to set
     */
    public void setMail_from(String mail_from) {
        this.mail_from = mail_from;
    }

    /**
     * @return the mail_head_name
     */
    public String getMail_head_name() {
        return mail_head_name;
    }

    /**
     * @param mail_head_name the mail_head_name to set
     */
    public void setMail_head_name(String mail_head_name) {
        this.mail_head_name = mail_head_name;
    }

    /**
     * @return the mail_head_value
     */
    public String getMail_head_value() {
        return mail_head_value;
    }

    /**
     * @param mail_head_value the mail_head_value to set
     */
    public void setMail_head_value(String mail_head_value) {
        this.mail_head_value = mail_head_value;
    }

    /**
     * @return the mail_to
     */
    public String getMail_to() {
        return mail_to;
    }

    /**
     * @param mail_to the mail_to to set
     */
    public void setMail_to(String mail_to) {
        this.mail_to = mail_to;
    }

    /**
     * @return the mail_subject
     */
    public String getMail_subject() {
        return mail_subject;
    }

    /**
     * @param mail_subject the mail_subject to set
     */
    public void setMail_subject(String mail_subject) {
        this.mail_subject = mail_subject;
    }

    /**
     * @return the mail_body
     */
    public String getMail_body() {
        return mail_body;
    }

    /**
     * @param mail_body the mail_body to set
     */
    public void setMail_body() {
        String mail_body = "尊敬的" + getReceiverName() + "管理员您好！<br/>您有新的教室申请/活动资源申请需要审批，请登录学生清华进行审批。点此进入"
                +"<a href='"+getApplyLink()+"'>"+getApplyLink()+"</a>";
        this.mail_body = mail_body;
    }

    /**
     * @return the personalName
     */
    public String getPersonalName() {
        return personalName;
    }

    /**
     * @param personalName the personalName to set
     */
    public void setPersonalName(String personalName) {
        this.personalName = personalName;
    }
}
