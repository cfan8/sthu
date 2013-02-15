/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.entity;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Temporal;

/**
 *
 * @author linangran
 */
@Entity
@Table(name="t_apply_comment")
public class ApplyCommentEntity extends BaseEntity implements Comparable<ApplyCommentEntity> {
    
    public static final int COMMENT_STATUS_NEW = 1;
    public static final int COMMENT_STATUS_OLD = 2;
    
    public static final int COMMENT_TYPE_ACCEPT = 1;
    public static final int COMMENT_TYPE_REJECT = 2;
    
    private int userid;
    private String nickname;
    
    @Column(length=5000)
    private String comment;
    private int commentStatus;
    private int commentType;
    @Column(columnDefinition="DATETIME")
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    private Date pubDate;

    public String getComment() {
	return comment;
    }

    public void setComment(String comment) {
	this.comment = comment;
    }

    public int getCommentStatus() {
	return commentStatus;
    }

    public void setCommentStatus(int commentStatus) {
	this.commentStatus = commentStatus;
    }

    public int getCommentType() {
	return commentType;
    }

    public void setCommentType(int commentType) {
	this.commentType = commentType;
    }

    public Date getPubDate() {
	return pubDate;
    }

    public void setPubDate(Date pubDate) {
	this.pubDate = pubDate;
    }

    public int getUserid() {
	return userid;
    }

    public void setUserid(int userid) {
	this.userid = userid;
    }

    public String getNickname() {
	return nickname;
    }

    public void setNickname(String nickname) {
	this.nickname = nickname;
    }

    @Override
    public int compareTo(ApplyCommentEntity o) {
	if (this.pubDate.before(o.pubDate)) {
	    return 1;
	}
	else if (this.pubDate.after(o.pubDate)) {
	    return -1;
	}
	else {
	    return 0;
	}
    }
    
}
