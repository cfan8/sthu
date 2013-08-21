/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.message.studentActivity;

import cn.edu.tsinghua.sthu.entity.CommentEntity;
import cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity;
import cn.edu.tsinghua.sthu.entity.StudentApplyOptionsEntity;
import cn.edu.tsinghua.sthu.message.BaseMessage;

/**
 *
 * @author user
 */
public class ShowApplyStudentActivityPageMessage extends BaseMessage{
    public static final int USER_APPLY = 1;
    public static final int GROUP_APPLY = 2;
    private StudentActivityApplyEntity studentActivityApplyEntity;
    private StudentApplyOptionsEntity studentApplyOptionsEntity;
    private String applyUserNickname;
    private String organizerName;
    private int applyType = USER_APPLY;
    private CommentEntity commentEntity;
    private boolean showConfirm;
    private boolean showApprove; 
    private boolean showComment;
    private boolean showProcess;
    
    /**
     * @return the studentActivityApplyEntity
     */
    public StudentActivityApplyEntity getStudentActivityApplyEntity() {
        return studentActivityApplyEntity;
    }

    /**
     * @param studentActivityApplyEntity the studentActivityApplyEntity to set
     */
    public void setStudentActivityApplyEntity(StudentActivityApplyEntity studentActivityApplyEntity) {
        this.studentActivityApplyEntity = studentActivityApplyEntity;
    }
    
    

    /**
     * @return the applyUserNickname
     */
    public String getApplyUserNickname() {
        return applyUserNickname;
    }

    /**
     * @param applyUserNickname the applyUserNickname to set
     */
    public void setApplyUserNickname(String applyUserNickname) {
        this.applyUserNickname = applyUserNickname;
    }

    /**
     * @return the commentEntity
     */
    public CommentEntity getCommentEntity() {
        return commentEntity;
    }

    /**
     * @param commentEntity the commentEntity to set
     */
    public void setCommentEntity(CommentEntity commentEntity) {
        this.commentEntity = commentEntity;
    }

    /**
     * @return the showConfirm
     */
    public boolean isShowConfirm() {
        return showConfirm;
    }

    /**
     * @param showConfirm the showConfirm to set
     */
    public void setShowConfirm(boolean showConfirm) {
        this.showConfirm = showConfirm;
    }

    /**
     * @return the showApprove
     */
    public boolean isShowApprove() {
        return showApprove;
    }

    /**
     * @param showApprove the showApprove to set
     */
    public void setShowApprove(boolean showApprove) {
        this.showApprove = showApprove;
    }

    /**
     * @return the showComment
     */
    public boolean isShowComment() {
        return showComment;
    }

    /**
     * @param showComment the showComment to set
     */
    public void setShowComment(boolean showComment) {
        this.showComment = showComment;
    }

    /**
     * @return the studentApplyOptionsEntity
     */
    public StudentApplyOptionsEntity getStudentApplyOptionsEntity() {
        return studentApplyOptionsEntity;
    }

    /**
     * @param studentApplyOptionsEntity the studentApplyOptionsEntity to set
     */
    public void setStudentApplyOptionsEntity(StudentApplyOptionsEntity studentApplyOptionsEntity) {
        this.studentApplyOptionsEntity = studentApplyOptionsEntity;
    }

    /**
     * @return the applyType
     */
    public int getApplyType() {
        return applyType;
    }

    /**
     * @param applyType the applyType to set
     */
    public void setApplyType(int applyType) {
        this.applyType = applyType;
    }

    /**
     * @return the organizerName
     */
    public String getOrganizerName() {
        return organizerName;
    }

    /**
     * @param organizerName the organizerName to set
     */
    public void setOrganizerName(String organizerName) {
        this.organizerName = organizerName;
    }

    /**
     * @return the showProcess
     */
    public boolean isShowProcess() {
        return showProcess;
    }

    /**
     * @param showProcess the showProcess to set
     */
    public void setShowProcess(boolean showProcess) {
        this.showProcess = showProcess;
    }
}
