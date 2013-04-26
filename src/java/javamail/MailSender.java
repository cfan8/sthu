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

/**
 *
 * @author elsie
 */
public class MailSender {
    private String host="mail.tsinghua.edu.cn";
    private String username = "xxx@mails.tsinghua.edu.cn";//改成你的邮箱
    private String password = "****";//改成你的密码
    private String mail_from = "xxx@mails.tsinghua.edu.cn";//改成你的邮箱
    private String mail_head_name = "学生清华";
    private String mail_head_value = "学生清华邮件提醒";
    private String mail_to = "xiaobothu10@gmail.com";
    private String mail_subject = "this is the subject of this test mail";
    private String mail_body = "您好！您有新的教室/活动需要审批，请登录学生清华查看 <a href='www.student.tsinghua.edu.cn/login.do?redirectURL=%2factivity%2fshowApply.do%3fapplyId%3d4420'>点我查看</a>";
    private String personalName = "学生清华";
    public MailSender()
    {
        
    }
    public void send() throws Exception
    {
        try
        {
            Properties props = new Properties(); // 获取系统环境
            Authenticator auth = new Email_Autherticator(); // 进行邮件服务器用户认证
            props.put("mail.smtp.host", getHost());
            props.put("mail.smtp.auth", "true");
            Session session = Session.getDefaultInstance(props, auth);
            // 设置session,和邮件服务器进行通讯。
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
            Transport.send(message); // 发送邮件
            System.out.println("send ok!");
        } catch (Exception ex)
        {
            ex.printStackTrace();
            throw new Exception(ex.getMessage());
        }
    }

    /**
     * @return the host
     */
    public String getHost() {
        return host;
    }

    /**
     * @param host the host to set
     */
    public void setHost(String host) {
        this.host = host;
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
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
    public void setMail_body(String mail_body) {
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

    /**
     * 用来进行服务器对用户的认证
     */
    public class Email_Autherticator extends Authenticator
    {
        public Email_Autherticator()
        {
            super();
        }

        public Email_Autherticator(String user, String pwd)
        {
            super();
            setUsername(user);
            setPassword(pwd);
        }

        public PasswordAuthentication getPasswordAuthentication()
        {
            return new PasswordAuthentication(getUsername(), getPassword());
        }
    }
    public static void main(String[] args)
    {
        MailSender sendmail = new MailSender();
        try
        {
            sendmail.send();
        } catch (Exception ex)
        {
        }
    }
}
