/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message;

import cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity;
import java.util.List;

/**
 *
 * @author xiaobo
 */
public class ShowGroupHomeMessage extends BaseMessage{
    private int showFollow;
    private int totalPageNumber;
    private int groupId;
    private int isGroupFollowed;
    private String OrganizeName;
    private boolean showManage;
    private String introduction;
    private String mainImg;
    private String logoImg;
    /**
     * @return the showFollow
     */
    public int getShowFollow() {
        return showFollow;
    }

    /**
     * @param showFollow the showFollow to set
     */
    public void setShowFollow(int showFollow) {
        this.showFollow = showFollow;
    }

    /**
     * @return the totalPageNumber
     */
    public int getTotalPageNumber() {
        return totalPageNumber;
    }

    /**
     * @param totalPageNumber the totalPageNumber to set
     */
    public void setTotalPageNumber(int totalPageNumber) {
        this.totalPageNumber = totalPageNumber;
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
     * @return the isGroupFollowed
     */
    public int getIsGroupFollowed() {
        return isGroupFollowed;
    }

    /**
     * @param isGroupFollowed the isGroupFollowed to set
     */
    public void setIsGroupFollowed(int isGroupFollowed) {
        this.isGroupFollowed = isGroupFollowed;
    }
    
    /**
     * @return the OrganizeName
     */
    public String getOrganizeName() {
        return OrganizeName;
    }

    /**
     * @param OrganizeName the isGroupFollowed to set
     */
    public void setOrganizeName(String OrganizeName) {
        this.OrganizeName = OrganizeName;
    }

    /**
     * @return the showManage
     */
    public boolean isShowManage() {
        return showManage;
    }

    /**
     * @param showManage the showManage to set
     */
    public void setShowManage(boolean showManage) {
        this.showManage = showManage;
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
     * @return the mainImg
     */
    public String getMainImg() {
        return mainImg;
    }

    /**
     * @param mainImg the mainImg to set
     */
    public void setMainImg(String mainImg) {
        this.mainImg = mainImg;
    }

    /**
     * @return the logoImg
     */
    public String getLogoImg() {
        return logoImg;
    }

    /**
     * @param logoImg the logoImg to set
     */
    public void setLogoImg(String logoImg) {
        this.logoImg = logoImg;
    }

}
