/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.entity.UserEntity;
import cn.edu.tsinghua.sthu.message.AlertMessage;
import cn.edu.tsinghua.sthu.service.UserService;
import org.apache.catalina.User;

/**
 *
 * @author xiaobo
 */
public class ChangePasswordAction extends BaseAction{
    private String editUserAccount;
    private String editUserPassword;
    private UserService userService;

    @Override
    public String onExecute() throws Exception {
        String[] list = editUserAccount.split(",");
        String[] passwordList = editUserPassword.split(",");

        for(int i = 0; i < list.length; i ++){
            UserEntity user = userService.getUserEntityByUsername(list[i]);
            userService.updateUserPassword(passwordList[i], user);
            
        }
        alertMessage.setAlertTitle("修改成功");
	return ALERT;
    }

    
    @Override
    public boolean valid() {
        return true;
    }
    
    @Override
    public boolean hasAuth(){
        if(getCurrentUser().getAuth().getOpUserCode() > 0)
            return true;
        return false;
    }

    @Override
    public boolean needLogin() {
        return true;
    }

    /**
     * @return the editUserAccount
     */
    public String getEditUserAccount() {
        return editUserAccount;
    }

    /**
     * @param editUserAccount the editUserAccount to set
     */
    public void setEditUserAccount(String editUserAccount) {
        this.editUserAccount = editUserAccount;
    }

    /**
     * @return the editUserPassword
     */
    public String getEditUserPassword() {
        return editUserPassword;
    }

    /**
     * @param editUserPassword the editUserPassword to set
     */
    public void setEditUserPassword(String editUserPassword) {
        this.editUserPassword = editUserPassword;
    }

    /**
     * @return the userService
     */
    public UserService getUserService() {
        return userService;
    }

    /**
     * @param userService the userService to set
     */
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
    
}
