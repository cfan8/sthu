/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package javamail;

import java.io.InputStream;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.internet.MimeMessage;
import javax.mail.Session;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;

/**
 *
 * @author elsie
 */
public class MailSenderPool extends Thread{
    private MailSender mailSender;
    private Thread thread;
    private Queue queue = new Queue();
    private Object mutex = new Object();
    private Session session;
    private String host="mail.tsinghua.edu.cn";
    private String username = "xxx@mails.tsinghua.edu.cn";//改成你的邮箱
    private String password = "******";//改成你的密码
    public MailSenderPool(){
        init();
   
    }
    private void init(){
        Properties props = new Properties(); // 获取系统环境
        Authenticator auth = new Email_Autherticator(); // 进行邮件服务器用户认证
        props.put("mail.smtp.host", getHost());
        props.put("mail.smtp.auth", "true");
        session = Session.getDefaultInstance(props, auth);
        mailSender = new MailSender(session);
    }
    public void run(){
        while (!isClose()) {
            while (!isEmpty()) {
                Object object = poll();
                try {
                // 执行实际发送
                    doSend(object);
                } 
                catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
   // 等~直到add方法的通知!
            synchronized (mutex) {
                try {
                    mutex.wait();
                } 
                catch (InterruptedException e) {
                }
            }
        }
    }
    public MailSender getMailSender(){
        return mailSender;
    } 
    public void setMailSender(MailSender mailSender){
        this.mailSender = mailSender;
    }
    public void close(){
        queue.clear();
        queue = null;
    }
    public boolean isClose(){
        return queue==null;
    }
    protected boolean isEmpty(){
        return queue!=null&&queue.isEmpty();
    }
    protected void add(Object obj){
        queue.add(obj);
        synchronized(mutex){
            mutex.notify();
        }
    }
    protected Object poll(){
        return queue.poll();
    }

    public void send(MailMessage mailMessage)throws MailException{
        add(mailMessage);
    }
    public void send(MailMessage[] mailMessages)throws MailException{
        MailMessage[] messages = mailMessages;
        for(int i = 0; i < messages.length; i ++){
            MailMessage message = messages[i];
            add(message);
        }
    }

    public void doSend(Object object) throws Exception{
        if(object instanceof MailMessage){
            doSend((MailMessage)object);
        }
    }

    public void doSend(MailMessage mailMessage) throws Exception {
        synchronized(this){
            mailSender.send(mailMessage);
        }
    }

    /**
     * @return the session
     */
    public Session getSession() {
        return session;
    }

    /**
     * @param session the session to set
     */
    public void setSession(Session session) {
        this.session = session;
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
}
