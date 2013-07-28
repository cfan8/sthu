/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.entity;

import java.util.*;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.Transient;
import org.hibernate.annotations.Index;
/**
 *
 * @author Wang Silun
 */
@Entity
@Table(name="t_apply_comment")
public class CommentEntity extends BaseEntity{
    
    public static final int COMMENT_STATUS_NEW = 1;
    public static final int COMMENT_STATUS_OLD = 2;
    
    public static final int COMMENT_TYPE_ACCEPT = 1;
    public static final int COMMENT_TYPE_REJECT = 2;
    public static final int COMMENT_TYPE_COMMENT = 3;

   @Index(name="applyIDIndex")
    private int applyID;
    @Column(length = 5000)
    private String comment;
    private int commentType;
    @Column(length = 255)
    private String nickname;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date pubDate;
    @Index(name="userIDIndex")
    private int userid;
    private int commentStatus;



    /**
     * @return the applyID
     */
    public int getApplyID() {
        return applyID;
    }

    /**
     * @param applyID the applyID to set
     */
    public void setApplyID(int applyID) {
        this.applyID = applyID;
    }

    /**
     * @return the comment
     */
    public String getComment() {
        return comment;
    }

    /**
     * @param comment the comment to set
     */
    public void setComment(String comment) {
        this.comment = comment;
    }

    /**
     * @return the commentType
     */
    public int getCommentType() {
        return commentType;
    }

    /**
     * @param commentType the commentType to set
     */
    public void setCommentType(int commentType) {
        this.commentType = commentType;
    }

    /**
     * @return the nickname
     */
    public String getNickname() {
        return nickname;
    }

    /**
     * @param nickname the nickname to set
     */
    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    /**
     * @return the pubDate
     */
    public Date getPubDate() {
        return pubDate;
    }

    /**
     * @param pubDate the pubDate to set
     */
    public void setPubDate(Date pubDate) {
        this.pubDate = pubDate;
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

    /**
     * @return the commentStatus
     */
    public int getCommentStatus() {
        return commentStatus;
    }

    /**
     * @param commentStatus the commentStatus to set
     */
    public void setCommentStatus(int commentStatus) {
        this.commentStatus = commentStatus;
    }
}
