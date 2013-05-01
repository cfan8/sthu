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
    public boolean  updateEmail(EmailEntity emailEntity){
        EmailEntity email = emailDAO.getEmailById(emailEntity.getUserid());
        if(email == null)
            emailDAO.setEmail(emailEntity);
        else
            emailDAO.updateEmail(emailEntity);
        return true;
    }

    @Transactional
    public EmailEntity getEmailByUserid(int userid){
        EmailEntity email = emailDAO.getEmailById(userid);
        if(email == null)
            return null;
        else
            return email;

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
