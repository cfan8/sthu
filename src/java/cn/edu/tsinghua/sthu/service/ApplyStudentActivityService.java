/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.service;

import cn.edu.tsinghua.sthu.action.StudentActivity.ShowStudentActivityApplyListPageAction;
import cn.edu.tsinghua.sthu.dao.ApplyCommentDAO;
import cn.edu.tsinghua.sthu.dao.ApplyStudentActivityDAO;
import cn.edu.tsinghua.sthu.dao.AuthDAO;
import cn.edu.tsinghua.sthu.dao.UserDAO;
import cn.edu.tsinghua.sthu.entity.ApplyCommentEntity;
import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity;
import cn.edu.tsinghua.sthu.message.studentActivity.ShowStudentActivityApplyMessage;
import java.util.Date;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author xiaobo
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
    public void processComment(StudentActivityApplyEntity studentActivityApplyEntity, ApplyCommentEntity applyCommentEntity, boolean isApprove, String comment, int type, String nickName, int userid){
        if(type == ShowStudentActivityApplyMessage.APPROVE_TYPE_IDENTITY){
            applyCommentEntity.setComment(comment);
            applyCommentEntity.setUserid(userid);
            applyCommentEntity.setNickname(nickName);
        }
        else if(type == ShowStudentActivityApplyMessage.APPROVE_TYPE_RESOURCE){
            applyCommentEntity.setComment(comment);
            applyCommentEntity.setUserid(userid);
            applyCommentEntity.setNickname(nickName);
        }
	if (type == ShowStudentActivityApplyMessage.APPROVE_TYPE_IDENTITY) {
	    applyCommentEntity.setPubDate(new Date());
	    if (isApprove == true) {
                                    studentActivityApplyEntity.setIdentityStatus(StudentActivityApplyEntity.IDENTITY_STATUS_ACCEPTED);
                                    studentActivityApplyEntity.setResourceStatus(StudentActivityApplyEntity.RESOURCE_STATUS_TODO);
                                   //sendEmailByResource(studentActivityApplyEntity.getResourceType(), applyCommentEntity.getID());
	    } else {
                                     studentActivityApplyEntity.setIdentityStatus(StudentActivityApplyEntity.IDENTITY_STATUS_REJECTED);
                                     studentActivityApplyEntity.setApplyStatus(StudentActivityApplyEntity.APPLY_STATUS_REJECTED);
	    }
	} else if (type == ShowStudentActivityApplyMessage.APPROVE_TYPE_RESOURCE) {
	    applyCommentEntity.setPubDate(new Date());
	    if (isApprove) {
		studentActivityApplyEntity.setResourceStatus(StudentActivityApplyEntity.RESOURCE_STATUS_ACCEPTED);
		studentActivityApplyEntity.setApplyStatus(StudentActivityApplyEntity.APPLY_STATUS_ACCEPTED);
	    } else {
		studentActivityApplyEntity.setResourceStatus(StudentActivityApplyEntity.RESOURCE_STATUS_REJECTED);
		studentActivityApplyEntity.setApplyStatus(StudentActivityApplyEntity.APPLY_STATUS_REJECTED);
	    }
	} 
	applyStudentActivityDAO.updateStudentActivityApplyEntity(studentActivityApplyEntity);
                       applyCommentDAO.updateApplyCommentEntity(applyCommentEntity);
    }
    
     @Transactional
    public StudentActivityApplyEntity createStudentActivityApply(String organizerName, String associateOrganizerName,String applicant,
	    String applicantCell, int activityType, String usageComment, String content,
	    String manager, String managerCell, Date activityDate, String timePeriod,
	     int number, String title, int userid, int applyRange, int applyType) {
	StudentActivityApplyEntity entity = new StudentActivityApplyEntity();
	entity.setOrganizerName(organizerName);
        entity.setAssociateOrganizerName(associateOrganizerName);
	entity.setApplicantName(applicant);
	entity.setApplicantCell(applicantCell);
	entity.setActivityType(activityType);
        entity.setUsageComment(usageComment);
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
        entity.setApplyPath(applyType);
        entity.setApplyStatus(StudentActivityApplyEntity.APPLY_STATUS_UNCONFIRMED);
	entity.setIdentityType(applyType);
	//configureApplyStatus(entity, applyType);
	applyStudentActivityDAO.saveStudentActivityApplyEntity(entity);
	return entity;
    }
     
    @Transactional
    public StudentActivityApplyEntity modifyStudentActivityApply(String organizerName, String associateOrganizerName,String applicant,
	    String applicantCell, int activityType, String usageComment, String content,
	    String manager, String managerCell, Date activityDate, String timePeriod,
	     int number, String title, int userid, int applyRange, int applyType,int applyId) {
	StudentActivityApplyEntity entity = applyStudentActivityDAO.getStudentActivityApplyEntityById(applyId);
	/*if (entity.getApplyStatus() != CRoomApplyEntity.APPLY_STATUS_UNCONFIRMED
		&& entity.getApplyStatus() != CRoomApplyEntity.APPLY_STATUS_REJECTED) {
	    return null;
	}*/
        entity.setOrganizerName(organizerName);
        entity.setAssociateOrganizerName(associateOrganizerName);
	entity.setApplicantName(applicant);
	entity.setApplicantCell(applicantCell);
	entity.setActivityType(activityType);
        entity.setUsageComment(usageComment);
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
        entity.setApplyPath(applyType);
	//configureApplyStatus(entity, applyType);
        entity.setApplyStatus(StudentActivityApplyEntity.APPLY_STATUS_UNCONFIRMED);
	entity.setIdentityType(applyType);
	applyStudentActivityDAO.updateStudentActivityApplyEntity(entity);
	return entity;
    }
    
    @Transactional
    public StudentActivityApplyEntity confirmApply(StudentActivityApplyEntity entity){
        entity.setApplyStatus(StudentActivityApplyEntity.APPLY_STATUS_CONFIRMED);
        entity.setConfirmDate(new Date());
        entity.setIdentityStatus(StudentActivityApplyEntity.IDENTITY_STATUS_TODO);
        entity.setIdentityDate(null);
        applyStudentActivityDAO.updateStudentActivityApplyEntity(entity);
        return entity;
    }
    
     @Transactional
    public int getMyApplyTotalPageNumber(int userID, int numberPerPage)
    {
	int r = applyStudentActivityDAO.getMyApplyCountByUserID(userID);
	return (r / numberPerPage) + (r % numberPerPage == 0? 0: 1);
    }
     
    @Transactional
    public List<StudentActivityApplyEntity> getMyApplyList(int userid, int page, int numberPerPage)
    {
	return applyStudentActivityDAO.getMyApplyListByUserid(userid, (page - 1)*numberPerPage, numberPerPage);
    }
    
     @Transactional
    public List<StudentActivityApplyEntity> getPagedApply(int viewType, int page, int number, AuthEntity auth, int approveType) {
	List<StudentActivityApplyEntity> list = null;
	int begin = (page - 1) * number;
	if (approveType == ShowStudentActivityApplyListPageAction.APPROVE_TYPE_IDENTITY && auth.getOpIdentityCode() != -1) {
	    if (viewType == ShowStudentActivityApplyListPageAction.VIEW_TYPE_PAST) {
		list = applyStudentActivityDAO.getPastApplyListByIdentityType(begin, number, auth.getOpIdentityCode());
	    } else if (viewType == ShowStudentActivityApplyListPageAction.VIEW_TYPE_TODO) {
		list = applyStudentActivityDAO.getTodoApplyListByIdentityType(begin, number, auth.getOpIdentityCode());
	    }
	} else if (approveType == ShowStudentActivityApplyListPageAction.APPROVE_TYPE_RESOURCE && auth.getOpResourceCode() != -1) {
	    if (viewType == ShowStudentActivityApplyListPageAction.VIEW_TYPE_PAST) {
		list = applyStudentActivityDAO.getPastApplyListByResourceType(begin, number, auth.getOpResourceCode());
	    } else if (viewType == ShowStudentActivityApplyListPageAction.VIEW_TYPE_TODO) {
		list = applyStudentActivityDAO.getTodoApplyListByResourceType(begin, number, auth.getOpResourceCode());
	    }
	} 
	return list;
    }
     
      @Transactional
    public int getTotalPageNumber(int viewType, int numberPerPage, AuthEntity auth, int approveType) {
	int resultCount = 0;
	if (approveType == ShowStudentActivityApplyListPageAction.APPROVE_TYPE_IDENTITY && auth.getOpIdentityCode() != -1) {
	    if (viewType == ShowStudentActivityApplyListPageAction.VIEW_TYPE_PAST) {
		resultCount = applyStudentActivityDAO.getPastApplyCountByIdentityType(auth.getOpIdentityCode());
	    } else if (viewType == ShowStudentActivityApplyListPageAction.VIEW_TYPE_TODO) {
		resultCount = applyStudentActivityDAO.getTodoApplyCountByIdentityType(auth.getOpIdentityCode());
	    }
	} else if (approveType == ShowStudentActivityApplyListPageAction.APPROVE_TYPE_RESOURCE && auth.getOpResourceCode() != -1) {
	    if (viewType == ShowStudentActivityApplyListPageAction.VIEW_TYPE_PAST) {
		resultCount = applyStudentActivityDAO.getPastApplyCountByResourceType(auth.getOpResourceCode());
	    } else if (viewType == ShowStudentActivityApplyListPageAction.VIEW_TYPE_TODO) {
		resultCount = applyStudentActivityDAO.getTodoApplyCountByResourceType(auth.getOpResourceCode());
	    }
	}
	return resultCount / numberPerPage + (resultCount % numberPerPage == 0 ? 0 : 1);
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
