/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.entity;
import javax.persistence.*;
import org.hibernate.annotations.Index;
/**
 *
 * @author elsie
 */
@Entity
@Table(name="t_email")
public class EmailEntity extends BaseEntity{
    @Column(name="userid")
    private int userid;
    
    @Column(name="email")
    private String email;
    
    @Column(name="isReceiveRemindEmail")
    private boolean isReceiveRemindEmail;

    public EmailEntity(){
        
    }
    
    public EmailEntity(int userid, String email, boolean isReceiveRemindEmail){
        this.userid = userid;
        this.email = email;
        this.isReceiveRemindEmail = isReceiveRemindEmail;
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
     * @return the userid
     */
    public int getUserid() {
        return userid;
    }

    /**
     * @param userid the userid to set
     */
    public void setUserid(int userid) {
        this.userid = userid;
    }
    
    
}
