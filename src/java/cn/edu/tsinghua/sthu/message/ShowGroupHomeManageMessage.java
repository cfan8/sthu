/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message;

import cn.edu.tsinghua.sthu.entity.GroupImgEntity;
import java.util.List;

/**
 *
 * @author xiaoyou
 */
public class ShowGroupHomeManageMessage extends BaseMessage{
    private String introduction;
    private String mainImg;
    private String logoImg;
    private int groupId;
    private List<GroupImgEntity> images;
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

    /**
     * @return the images
     */
    public List<GroupImgEntity> getImages() {
        return images;
    }

    /**
     * @param images the images to set
     */
    public void setImages(List<GroupImgEntity> images) {
        this.images = images;
    }
}
