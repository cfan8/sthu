/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.service;

import cn.edu.tsinghua.sthu.dao.ApplyCommentDAO;
import cn.edu.tsinghua.sthu.dao.ApplyStudentActivityDAO;
import cn.edu.tsinghua.sthu.dao.AuthDAO;
import cn.edu.tsinghua.sthu.dao.UserDAO;
import cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity;
import java.util.Date;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author user
 */
public class ApplyStudentActivityService extends BaseService{
    private ApplyStudentActivityDAO applyStudentActivityDAO;
    private ApplyCommentDAO applyCommentDAO;
    private AuthDAO authDAO;
    private UserDAO userDAO;

    @Transactional
    public StudentActivityApplyEntity getStudentActivityApplyEntityById(int applyId) {
	StudentActivityApplyEntity entity = applyStudentActivityDAO.getStudentActivityApplyEntityById(applyId);
	entity.setComments(applyCommentDAO.getCommentsByApplyId(applyId));
	return entity;
    }
    @Transactional
    public StudentActivityApplyEntity getStudentActivityApplyEntityById(int id, int userid) {
	StudentActivityApplyEntity entity = applyStudentActivityDAO.getStudentActivityApplyEntityById(id);
	if (entity == null || entity.getApplyUserid() != userid) {
	    return null;
	} else if (entity.getApplyStatus() != StudentActivityApplyEntity.APPLY_STATUS_UNCONFIRMED && entity.getApplyStatus() != StudentActivityApplyEntity.APPLY_STATUS_REJECTED) {
	    return null;
	} else {
	    return entity;
	}
    }
     @Transactional
    public StudentActivityApplyEntity createStudentActivityApply(String organizerName, String applicant,
	    String applicantCell, int activityType, String usageComment, String content,
	    String manager, String managerCell, Date activityDate, String timePeriod,
	     int number, String title, int userid, int applyRange) {
	StudentActivityApplyEntity entity = new StudentActivityApplyEntity();
	entity.setOrganizerName(organizerName);
	entity.setApplicantName(applicant);
	entity.setApplicantCell(applicantCell);
	entity.setActivityType(activityType);
	entity.setActivityContent(content);
	entity.setManagerName(manager);
	entity.setManagerCell(managerCell);
	entity.setActivityDate(activityDate);
	entity.setTimePeriod(timePeriod);
	entity.setParticipantsNumber(number);
	entity.setActivityTheme(title);
	entity.setApplyUserid(userid);
	entity.setApplyDate(new Date());
	entity.setActivityRange(applyRange);
	//configureApplyStatus(entity, applyType);
	applyStudentActivityDAO.saveStudentActivityApplyEntity(entity);
	return entity;
    }
     
    @Transactional
    public StudentActivityApplyEntity modifyStudentActivityApply(String organizerName, String applicant,
	    String applicantCell, int activityType, String usageComment, String content,
	    String manager, String managerCell, Date activityDate, String timePeriod,
	     int number, String title, int userid, int applyRange, int applyId) {
	StudentActivityApplyEntity entity = applyStudentActivityDAO.getStudentActivityApplyEntityById(applyId);
	/*if (entity.getApplyStatus() != CRoomApplyEntity.APPLY_STATUS_UNCONFIRMED
		&& entity.getApplyStatus() != CRoomApplyEntity.APPLY_STATUS_REJECTED) {
	    return null;
	}*/
        entity.setOrganizerName(organizerName);
	entity.setApplicantName(applicant);
	entity.setApplicantCell(applicantCell);
	entity.setActivityType(activityType);
	entity.setActivityContent(content);
	entity.setManagerName(manager);
	entity.setManagerCell(managerCell);
	entity.setActivityDate(activityDate);
	entity.setTimePeriod(timePeriod);
	entity.setParticipantsNumber(number);
	entity.setActivityTheme(title);
	entity.setApplyUserid(userid);
	entity.setApplyDate(new Date());
	entity.setActivityRange(applyRange);
	//configureApplyStatus(entity, applyType);
	applyStudentActivityDAO.updateStudentActivityApplyEntity(entity);
	return entity;
    }
    
    /**
     * @return the applyStudentActivityDAO
     */
    public ApplyStudentActivityDAO getApplyStudentActivityDAO() {
        return applyStudentActivityDAO;
    }

    /**
     * @param applyStudentActivityDAO the applyStudentActivityDAO to set
     */
    public void setApplyStudentActivityDAO(ApplyStudentActivityDAO applyStudentActivityDAO) {
        this.applyStudentActivityDAO = applyStudentActivityDAO;
    }

    /**
     * @return the applyCommentDAO
     */
    public ApplyCommentDAO getApplyCommentDAO() {
        return applyCommentDAO;
    }

    /**
     * @param applyCommentDAO the applyCommentDAO to set
     */
    public void setApplyCommentDAO(ApplyCommentDAO applyCommentDAO) {
        this.applyCommentDAO = applyCommentDAO;
    }

    /**
     * @return the authDAO
     */
    public AuthDAO getAuthDAO() {
        return authDAO;
    }

    /**
     * @param authDAO the authDAO to set
     */
    public void setAuthDAO(AuthDAO authDAO) {
        this.authDAO = authDAO;
    }

    /**
     * @return the userDAO
     */
    public UserDAO getUserDAO() {
        return userDAO;
    }

    /**
     * @param userDAO the userDAO to set
     */
    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }
}
