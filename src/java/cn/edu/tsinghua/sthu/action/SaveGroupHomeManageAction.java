/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.security.XSSProtect;
import cn.edu.tsinghua.sthu.security.XSSProtectLevel;
import cn.edu.tsinghua.sthu.security.XSSProtectedClass;
import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.UserEntity;
import cn.edu.tsinghua.sthu.service.UserService;

/**
 *
 * @author xiaoyou
 */
@XSSProtectedClass
public class SaveGroupHomeManageAction extends BaseAction{
    private int groupId;
    @XSSProtect(XSSProtectLevel.Strict)
    private String introduction;
    private UserService userService;
    @XSSProtect(XSSProtectLevel.Strict)
    private String mainImg;
    @XSSProtect(XSSProtectLevel.Strict)
    private String logoImg;
    
    @Override
    public String onExecute() throws Exception {
        getUserService().modifyGroupInfo(groupId, introduction, mainImg, logoImg);
        alertMessage.setSimpleAlert("已保存！", "showGroupHome.do?groupId=" + groupId);
        return ALERT;
    }
    @Override
    public boolean valid() {
        UserEntity user = getUserService().getUserEntityById(getGroupId());
        if(user == null){
            alertMessage.setSimpleAlert("该用户不存在！");
            return false;
        }
        if(user.getAuth().getRole() != AuthEntity.GROUP_ROLE){
            alertMessage.setSimpleAlert("非社团账户不开放浏览！");
            return false;
        }
        if(getCurrentUser().getID() != groupId){
            alertMessage.setSimpleAlert("权限错误！");
            return false;
        }
        return true;
    }

    @Override
    public boolean needLogin() {
        return false;
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
     * @return the groupId
     */
    public int getGroupId() {
        return groupId;
    }

    /**
     * @param groupId the groupId to set
     */
    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    /**
     * @return the introduction
     */
    public String getIntroduction() {
        return introduction;
    }

    /**
     * @param introduction the introduction to set
     */
    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    /**
     * @return the mainimg
     */
    public String getMainImg() {
        return mainImg;
    }

    /**
     * @param mainimg the mainimg to set
     */
    public void setMainImg(String mainImg) {
        this.mainImg = mainImg;
    }

    /**
     * @return the logoimg
     */
    public String getLogoImg() {
        return logoImg;
    }

    /**
     * @param logoimg the logoimg to set
     */
    public void setLogoImg(String logoImg) {
        this.logoImg = logoImg;
    }
}
