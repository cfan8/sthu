/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;

import cn.edu.tsinghua.sthu.security.XSSProtect;
import cn.edu.tsinghua.sthu.security.XSSProtectLevel;
import cn.edu.tsinghua.sthu.security.XSSProtectedClass;
import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.GroupImgEntity;
import cn.edu.tsinghua.sthu.entity.UserEntity;
import cn.edu.tsinghua.sthu.service.UserService;
import java.util.List;

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
    @XSSProtect(XSSProtectLevel.Strict)
    private String image;
    @XSSProtect(XSSProtectLevel.Strict)
    private String title;
    @XSSProtect(XSSProtectLevel.Strict)
    private String enable;
    private boolean passwordFlag;
    @XSSProtect(XSSProtectLevel.Strict)
    private String originPassword;
    @XSSProtect(XSSProtectLevel.Strict)
    private String newPassword;
    
    @Override
    public String onExecute() throws Exception {
        getUserService().modifyGroupInfo(groupId, introduction, mainImg, logoImg);
        List<GroupImgEntity> list = userService.getImagesByGroupId(groupId);
	String[] images = getImage().split("\\|\\|", -1);
	String[] titles = getTitle().split("\\|\\|", -1);
	String[] enables = getEnable().split("\\|\\|", -1);
	for (int i = 0; i < list.size(); i++)
	{
	    GroupImgEntity entity = list.get(i);
	    entity.setImg(images[i]);
	    entity.setTitle(titles[i]);
	    entity.setEnabled("true".equals(enables[i]) ? true:false);
	}
	userService.updateImgs(list);
        alertMessage.setSimpleAlert("已保存！", "showGroupHome.do?groupId=" + groupId);
        if(passwordFlag){
            if(!userService.updateUserPassword(originPassword, newPassword, getCurrentUser())){
                alertMessage.setSimpleAlert("原密码输入错误！", "showGroupHome.do?groupId=" + groupId);
            }
        }
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
    public boolean hasAuth(){
        if(getCurrentUser().getID() != groupId){
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

    /**
     * @return the image
     */
    public String getImage() {
        return image;
    }

    /**
     * @param image the image to set
     */
    public void setImage(String image) {
        this.image = image;
    }

    /**
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * @return the enable
     */
    public String getEnable() {
        return enable;
    }

    /**
     * @param enable the enable to set
     */
    public void setEnable(String enable) {
        this.enable = enable;
    }

    /**
     * @return the originPassword
     */
    public String getOriginPassword() {
        return originPassword;
    }

    /**
     * @param originPassword the originPassword to set
     */
    public void setOriginPassword(String originPassword) {
        this.originPassword = originPassword;
    }

    /**
     * @return the newPassword
     */
    public String getNewPassword() {
        return newPassword;
    }

    /**
     * @param newPassword the newPassword to set
     */
    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    /**
     * @return the passwordFlag
     */
    public boolean isPasswordFlag() {
        return passwordFlag;
    }

    /**
     * @param passwordFlag the passwordFlag to set
     */
    public void setPasswordFlag(boolean passwordFlag) {
        this.passwordFlag = passwordFlag;
    }
}
