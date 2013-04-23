/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.service;

import cn.edu.tsinghua.sthu.dao.EmailDAO;
import cn.edu.tsinghua.sthu.entity.EmailEntity;
import cn.edu.tsinghua.sthu.entity.UserEntity;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author elsie
 */
public class EmailService extends BaseService{
    private EmailDAO emailDAO;
    
    @Transactional
    public boolean updateEmail(EmailEntity emailEntity){
        List<EmailEntity> emails = emailDAO.getEmailById(emailEntity.getUserid());
        if(emails.isEmpty())
            emailDAO.setEmail(emailEntity);
        else
            emailDAO.updateEmail(emailEntity);
        return true;
    }

    @Transactional
    public EmailEntity getEmailByUserid(int userid){
        List<EmailEntity> emails = emailDAO.getEmailById(userid);
        if(emails.isEmpty())
            return null;
        else
            return emails.get(0);

    }
    /**
     * @return the emailDAO
     */
    public EmailDAO getEmailDAO() {
        return emailDAO;
    }

    /**
     * @param emailDAO the emailDAO to set
     */
    public void setEmailDAO(EmailDAO emailDAO) {
        this.emailDAO = emailDAO;
    }


}
