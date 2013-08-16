/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.entity;

import javax.persistence.*;
import org.hibernate.annotations.Index;
/**
 *
 * @author linangran
 */

@Entity
@Table(name="t_auth")
public class AuthEntity extends BaseEntity{
    
    public static final int USER_ROLE = 1;
    public static final int ADMIN_ROLE = 2;
    public static final int GROUP_ROLE = 3;
    
    @Column(name="userrole")
    private int role = USER_ROLE;
    
    private int opArticle = -1;  //审批文章权限
    
    @Index(name="opIdentityCodeIndex")
    private int opIdentityCode = -1;	//一级审批权限(确认申请人身份)

    @Index(name="opResouceCodeIndex")
    private int opResourceCode = -1;	//二级审批权限(确认申请合理性)
    
    @Index(name="opAllocateCodeIndex")
    private int opAllocateCode = -1;	//三级审批权限(按照申请要求分配申请)
    
    @Index(name="opGroupCodeIndex")
    private int opGroupCode = -1;   //校团委审批权限
    
    @Index(name="opPublishCodeIndex")
    private int opPublishCode = -1; //成才中心审批权限（确认发布合理性）

    public int getRole() {
	return role;
    }

    public void setRole(int role) {
	this.role = role;
    }

    public int getOpArticle() {
	return opArticle;
    }

    public void setOpArticle(int opArticle) {
	this.opArticle = opArticle;
    }

    public int getOpIdentityCode() {
	return opIdentityCode;
    }

    public void setOpIdentityCode(int opIdentityCode) {
	this.opIdentityCode = opIdentityCode;
    }

    public int getOpResourceCode() {
	return opResourceCode;
    }

    public void setOpResourceCode(int opResourceCode) {
	this.opResourceCode = opResourceCode;
    }

    public int getOpAllocateCode() {
	return opAllocateCode;
    }

    public void setOpAllocateCode(int opAllocateCode) {
	this.opAllocateCode = opAllocateCode;
    }

    /**
     * @return the opGroupCode
     */
    public int getOpGroupCode() {
        return opGroupCode;
    }

    /**
     * @param opGroupCode the opGroupCode to set
     */
    public void setOpGroupCode(int opGroupCode) {
        this.opGroupCode = opGroupCode;
    }

    /**
     * @return the opPublishCode
     */
    public int getOpPublishCode() {
        return opPublishCode;
    }

    /**
     * @param opPublishCode the opPublishCode to set
     */
    public void setOpPublishCode(int opPublishCode) {
        this.opPublishCode = opPublishCode;
    }
  
}
