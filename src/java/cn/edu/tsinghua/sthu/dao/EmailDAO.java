/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.dao;
import cn.edu.tsinghua.sthu.dao.BaseDAO;
import cn.edu.tsinghua.sthu.entity.EmailEntity;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import java.util.List;
/**
 *
 * @author elsie
 */
public class EmailDAO extends BaseDAO<EmailEntity>{
    public  EmailDAO(){
        super(EmailEntity.class);
    }
    public EmailEntity getEmailById(int userid){
        List<EmailEntity> list = select().add(Restrictions.eq("userid", userid)).list();
        if(list.size() == 1){
            return list.get(0);
        }
        else 
            return null;
    }
    public void setEmail(EmailEntity emailEntity){
        insert(emailEntity);
    }
    public void updateEmail(EmailEntity emailEntity){
        EmailEntity email = (EmailEntity) select().add(Restrictions.eq("userid", emailEntity.getUserid())).list().get(0);
        email.setEmail(emailEntity.getEmail());
        email.setIsReceiveRemindEmail(emailEntity.isIsReceiveRemindEmail());
        update(email);
    }
}
