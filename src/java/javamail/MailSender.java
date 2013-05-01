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
public class MailSender {

    private Session session;
    public MailSender()
    {
        
    }
    public MailSender(Session session){
        this.session = session;
    }
    public void send(MailMessage mailMessage) throws  Exception{
        /*Transport transport = getSession().getTransport();
        if(!transport.isConnected()){
            transport.connect();
        }
        MimeMessage message = mailMessage.getMimeMessageFromMailMessage(session);
        transport.sendMessage(message, message.getRecipients(Message.RecipientType.TO));*/
        Transport.send(mailMessage.getMimeMessageFromMailMessage(session));
    }

}
