/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.entity;

import javax.persistence.*;
/**
 *
 * @author linangran
 */

@Entity
@Table(name="t_auth")
public class AuthEntity extends BaseEntity{
    
    public static final int USER_ROLE = 1;
    public static final int ADMIN_ROLE = 2;
    
    @Column(name="userrole")
    private int role;
    
    private int opArticle;  //审批文章权限
    
    private int opIdentityCode;	//一级审批权限

    private int opResourceCode;	//二级审批权限
    
    private int opAllocateCode;	//三级审批权限
  
}
