/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.message.AlertMessage;
import cn.edu.tsinghua.sthu.service.UserService;

/**
 *
 * @author xiaobo
 */
public class InsertUserAction extends BaseAction{
    
    private int userrole;
    private int opAllocateCode;
    private int opArticleCode;
    private int opIdentityCode;
    private int opResourceCode;
    private int opGroupCode;
    private int opPublishCode;
    private int opOtherCode;
    private int opUserCode;
    private int groupType;
    
    private String userlist;
    private String userAccountList;
    private String userPasswordList;
    private UserService userService;
    
    @Override
    public String onExecute() throws Exception {
        String[] list = userlist.split(",");
        String[] accountList = userAccountList.split(",");
        String[] passwordList = userPasswordList.split(",");

        for(int i = 0; i < list.length; i ++){
            
            if (!getUserService().addUser(accountList[i], passwordList[i], list[i], userrole, opAllocateCode,
        opArticleCode, opIdentityCode, opResourceCode, opGroupCode, opPublishCode, opOtherCode,
        opUserCode, groupType))
            {
                alertMessage.setAlertTitle("创建失败");
                alertMessage.setAlertContent("已有重名用户！");
                alertMessage.setAlertType(AlertMessage.ALERT_TYPE);
                alertMessage.setRedirectURL(AlertMessage.REFERER_URL);
                return ALERT;
            }
        }
        alertMessage.setAlertTitle("创建成功");
                alertMessage.setAlertContent("创建成功，点击确定登录！");
                alertMessage.setAlertType(AlertMessage.BOX_TYPE);
                alertMessage.setRedirectURL("login.jsp");
	return ALERT;
    }

    @Override
    public boolean hasAuth(){
        if(getCurrentUser().getAuth().getOpUserCode() > 0)
            return true;
        return false;
    }
    
    @Override
    public boolean valid() {
        return true;
    }

    @Override
    public boolean needLogin() {
        return true;
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

    /**
     * @return the userlist
     */
    public String getUserlist() {
        return userlist;
    }

    /**
     * @param userlist the userlist to set
     */
    public void setUserlist(String userlist) {
        this.userlist = userlist;
    }

    /**
     * @return the userAccountList
     */
    public String getUserAccountList() {
        return userAccountList;
    }

    /**
     * @param userAccountList the userAccountList to set
     */
    public void setUserAccountList(String userAccountList) {
        this.userAccountList = userAccountList;
    }

    /**
     * @return the userPasswordList
     */
    public String getUserPasswordList() {
        return userPasswordList;
    }

    /**
     * @param userPasswordList the userPasswordList to set
     */
    public void setUserPasswordList(String userPasswordList) {
        this.userPasswordList = userPasswordList;
    }

    /**
     * @return the userrole
     */
    public int getUserrole() {
        return userrole;
    }

    /**
     * @param userrole the userrole to set
     */
    public void setUserrole(int userrole) {
        this.userrole = userrole;
    }

    /**
     * @return the opAllocateCode
     */
    public int getOpAllocateCode() {
        return opAllocateCode;
    }

    /**
     * @param opAllocateCode the opAllocateCode to set
     */
    public void setOpAllocateCode(int opAllocateCode) {
        this.opAllocateCode = opAllocateCode;
    }

    /**
     * @return the opArticleCode
     */
    public int getOpArticleCode() {
        return opArticleCode;
    }

    /**
     * @param opArticleCode the opArticleCode to set
     */
    public void setOpArticleCode(int opArticleCode) {
        this.opArticleCode = opArticleCode;
    }

    /**
     * @return the opIdentityCode
     */
    public int getOpIdentityCode() {
        return opIdentityCode;
    }

    /**
     * @param opIdentityCode the opIdentityCode to set
     */
    public void setOpIdentityCode(int opIdentityCode) {
        this.opIdentityCode = opIdentityCode;
    }

    /**
     * @return the opResourceCode
     */
    public int getOpResourceCode() {
        return opResourceCode;
    }

    /**
     * @param opResourceCode the opResourceCode to set
     */
    public void setOpResourceCode(int opResourceCode) {
        this.opResourceCode = opResourceCode;
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

    /**
     * @return the opOtherCode
     */
    public int getOpOtherCode() {
        return opOtherCode;
    }

    /**
     * @param opOtherCode the opOtherCode to set
     */
    public void setOpOtherCode(int opOtherCode) {
        this.opOtherCode = opOtherCode;
    }

    /**
     * @return the opUserCode
     */
    public int getOpUserCode() {
        return opUserCode;
    }

    /**
     * @param opUserCode the opUserCode to set
     */
    public void setOpUserCode(int opUserCode) {
        this.opUserCode = opUserCode;
    }

    /**
     * @return the groupType
     */
    public int getGroupType() {
        return groupType;
    }

    /**
     * @param groupType the groupType to set
     */
    public void setGroupType(int groupType) {
        this.groupType = groupType;
    }
    
}
