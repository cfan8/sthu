/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message;
import cn.edu.tsinghua.sthu.entity.EmailEntity;
/**
 *
 * @author elsie
 */
public class ShowEmailMessage extends BaseMessage{
    private EmailEntity emailEntity;

    /**
     * @return the emailEntity
     */
    public EmailEntity getEmailEntity() {
        return emailEntity;
    }

    /**
     * @param emailEntity the emailEntity to set
     */
    public void setEmailEntity(EmailEntity emailEntity) {
        this.emailEntity = emailEntity;
    }
    
}
