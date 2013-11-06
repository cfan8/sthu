/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.entity.UserEntity;
import cn.edu.tsinghua.sthu.service.UserService;

/**
 *
 * @author xiaobo
 */
public class ChangeNicknameAction extends BaseAction{

    private String nickUserAccount;
    private String nickUserNickname;
    private UserService userService;
    @Override
    public String onExecute() throws Exception {
        
        String[] list = nickUserAccount.split(",");
        String[] nicknameList = nickUserNickname.split(",");

        for(int i = 0; i < list.length; i ++){
            UserEntity user = userService.getUserEntityByUsername(list[i]);
            userService.updateUserNickname(nicknameList[i], user);
            
        }
        alertMessage.setAlertTitle("修改成功");
	return ALERT;
    }

    @Override
    public boolean valid() {
        return true;
    }

    @Override
    public boolean needLogin() {
        return true;
    }
    
    @Override
    public boolean hasAuth(){
        if(getCurrentUser().getAuth().getOpUserCode() > 0)
            return true;
        return false;
    }

    /**
     * @return the nickUserAccount
     */
    public String getNickUserAccount() {
        return nickUserAccount;
    }

    /**
     * @param nickUserAccount the nickUserAccount to set
     */
    public void setNickUserAccount(String nickUserAccount) {
        this.nickUserAccount = nickUserAccount;
    }

    /**
     * @return the nickUserNickname
     */
    public String getNickUserNickname() {
        return nickUserNickname;
    }

    /**
     * @param nickUserNickname the nickUserNickname to set
     */
    public void setNickUserNickname(String nickUserNickname) {
        this.nickUserNickname = nickUserNickname;
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
