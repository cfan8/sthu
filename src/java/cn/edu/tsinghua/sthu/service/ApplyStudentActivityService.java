/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.service;

import cn.edu.tsinghua.sthu.action.StudentActivity.ShowStudentActivityApplyListPageAction;
import cn.edu.tsinghua.sthu.constant.GroupMapping;
import cn.edu.tsinghua.sthu.constant.ResourceMapping;
import cn.edu.tsinghua.sthu.dao.ApplyCommentDAO;
import cn.edu.tsinghua.sthu.dao.ApplyStudentActivityDAO;
import cn.edu.tsinghua.sthu.dao.AuthDAO;
import cn.edu.tsinghua.sthu.dao.CommentDAO;
import cn.edu.tsinghua.sthu.dao.StudentActivityApproveDAO;
import cn.edu.tsinghua.sthu.dao.StudentApplyOptionsDAO;
import cn.edu.tsinghua.sthu.dao.UserDAO;
import cn.edu.tsinghua.sthu.entity.ApplyCommentEntity;
import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.CommentEntity;
import cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity;
import cn.edu.tsinghua.sthu.entity.StudentActivityApproveEntity;
import cn.edu.tsinghua.sthu.entity.StudentApplyOptionsEntity;
import cn.edu.tsinghua.sthu.message.studentActivity.ShowStudentActivityApplyMessage;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author xiaobo
 */
public class ApplyStudentActivityService extends BaseService{
    private ApplyStudentActivityDAO applyStudentActivityDAO;
    private CommentDAO commentDAO;
    private AuthDAO authDAO;
    private UserDAO userDAO;
    private StudentApplyOptionsDAO studentApplyOptionsDAO;
    private StudentActivityApproveDAO studentActivityApproveDAO;

    @Transactional
    public StudentActivityApplyEntity getStudentActivityApplyEntityById(int applyId) {
	StudentActivityApplyEntity entity = applyStudentActivityDAO.getStudentActivityApplyEntityById(applyId);
	entity.setComments(commentDAO.getCommentEntityByApplyID(applyId));
	entity.setApproveEntities(studentActivityApproveDAO.getApproveEntitiesByApplyId(applyId));
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
    public boolean isUserApproveResourceStatusToDo(int applyId, int userId){
        List<StudentActivityApproveEntity> approveEntities = studentActivityApproveDAO.getApproveEntitiesByApplyIdAndApproveStep(applyId, StudentActivityApproveEntity.APPROVE_STEP_RESOURCE);
        for (StudentActivityApproveEntity e : approveEntities) {
            if(e.getApproveType() == userDAO.getUserById(userId).getAuth().getOpResourceCode() && e.getApproveStatus() == StudentActivityApplyEntity.RESOURCE_STATUS_TODO){
                return true;
            }
        }
        return false;
    }
    
     @Transactional
    public boolean isUserApproveAllocateStatusToDo(int applyId, int userId){
        List<StudentActivityApproveEntity> approveEntities = studentActivityApproveDAO.getApproveEntitiesByApplyIdAndApproveStep(applyId, StudentActivityApproveEntity.APPROVE_STEP_ALLOCATE);
        for (StudentActivityApproveEntity e : approveEntities) {
            if(e.getApproveType() == userDAO.getUserById(userId).getAuth().getOpAllocateCode() && e.getApproveStatus() == StudentActivityApplyEntity.ALLOCATE_STATUS_TODO){
                return true;
            }
        }
        return false;
    }
    
    @Transactional
    public void processComment(StudentActivityApplyEntity studentActivityApplyEntity, Integer isApprove, String comment, int type, Integer[] allocates, Integer[] resources,String nickName, int userid){
        CommentEntity commentEntity = new CommentEntity();
	commentEntity.setApplyID(studentActivityApplyEntity.getID());
	commentEntity.setComment(comment);
	commentEntity.setCommentStatus(ApplyCommentEntity.COMMENT_STATUS_NEW);
	commentEntity.setCommentType(isApprove);
	commentEntity.setNickname(nickName);
	commentEntity.setPubDate(new Date());
	commentEntity.setUserid(userid);
	commentDAO.addComment(commentEntity);
        if(isApprove != 3)
        {
            if (type == ShowStudentActivityApplyMessage.APPROVE_TYPE_IDENTITY) {
                studentActivityApplyEntity.setIdentityDate(new Date());
                if (isApprove == 1) {
                    studentActivityApplyEntity.setIdentityStatus(studentActivityApplyEntity.IDENTITY_STATUS_ACCEPTED);
                    if(studentActivityApplyEntity.getActivityRange() == StudentActivityApplyEntity.RANGE_DEPART){
                        StudentApplyOptionsEntity studentApplyOptionsEntity = studentActivityApplyEntity.getOption();
                        if(studentApplyOptionsEntity.getActivityArea() == StudentApplyOptionsEntity.AREA_INSCHOOL && studentApplyOptionsEntity.getCroomFlag() == studentApplyOptionsEntity.CROOMFLAG_NOTAPPLY
                                && studentApplyOptionsEntity.getBoardFlag() == studentApplyOptionsEntity.BOARDFLAG_NOTAPPLY && studentApplyOptionsEntity.getLEDFlag() == studentApplyOptionsEntity.LEDFLAG_NOTAPPLY
                                && studentApplyOptionsEntity.getOutsideFlag() == studentApplyOptionsEntity.OUTSIDEFLAG_NOTAPPLY
                                && studentApplyOptionsEntity.getPublicityFlag() == studentApplyOptionsEntity.PUBLICITYFLAG_NOTAPPLY && studentApplyOptionsEntity.getTicketFlag() == studentApplyOptionsEntity.TICKETFLAG_NOTAPPLY){
                            studentActivityApplyEntity.setApplyStatus(studentActivityApplyEntity.APPLY_STATUS_ACCEPTED);
                        }
                    }
                    else{
                        studentActivityApplyEntity.setGroupStatus(studentActivityApplyEntity.GROUP_STATUS_TODO);
                    }
                    //sendEmailByResource(studentActivityApplyEntity.getResourceType(), studentActivityApplyEntity.getID());
                } else if(isApprove == 2) 
                {
                    studentActivityApplyEntity.setIdentityStatus(studentActivityApplyEntity.IDENTITY_STATUS_REJECTED);
                    studentActivityApplyEntity.setApplyStatus(studentActivityApplyEntity.APPLY_STATUS_REJECTED);
                }
            }
            else if(type == ShowStudentActivityApplyMessage.APPROVE_TYPE_GROUP){
                studentActivityApplyEntity.setGroupDate(new Date());
                if(isApprove == 1){
                    studentActivityApplyEntity.setGroupStatus(studentActivityApplyEntity.GROUP_STATUS_ACCEPTED);
                    List<StudentActivityApproveEntity> approveEntities = studentActivityApproveDAO.getApproveEntitiesByApplyIdAndApproveStep(studentActivityApplyEntity.getID(), StudentActivityApproveEntity.APPROVE_STEP_ALLOCATE);
                    for (StudentActivityApproveEntity e : approveEntities) {
                        studentActivityApproveDAO.deleteApproveEntity(e);
                    }
                    if(allocates != null){
                        for (int i = 0; i < allocates.length; i ++) {
                            StudentActivityApproveEntity approveEntity = new StudentActivityApproveEntity();
                            approveEntity.setApplyId(studentActivityApplyEntity.getID());
                            approveEntity.setApproveStep(StudentActivityApproveEntity.APPROVE_STEP_ALLOCATE);
                            approveEntity.setApproveType(allocates[i]);
                            approveEntity.setApproveStatus(StudentActivityApplyEntity.ALLOCATE_STATUS_TODO);
                            studentActivityApproveDAO.saveStudentActivityApproveEntity(approveEntity);
                        }
                        if(allocates.length != 0)
                            studentActivityApplyEntity.setAllocateStatus(studentActivityApplyEntity.ALLOCATE_STATUS_TODO);
                    }
                    else{
                        studentActivityApplyEntity.setApplyStatus(studentActivityApplyEntity.APPLY_STATUS_ACCEPTED);
                    }
                }
                else if(isApprove == 2){
                    studentActivityApplyEntity.setGroupStatus(studentActivityApplyEntity.GROUP_STATUS_REJECTED);
                    studentActivityApplyEntity.setApplyStatus(studentActivityApplyEntity.ALLOCATE_STATUS_REJECTED);
                }
            }
            else if (type == ShowStudentActivityApplyMessage.APPROVE_TYPE_RESOURCE) {
                //studentActivityApplyEntity.setResourceDate(new Date());
                if (isApprove == 1) {
                    List<StudentActivityApproveEntity> approveEntities = studentActivityApproveDAO.getApproveEntitiesByApplyIdAndApproveStep(studentActivityApplyEntity.getID(), StudentActivityApproveEntity.APPROVE_STEP_RESOURCE);
                    int approveNum = 0;
                    for (StudentActivityApproveEntity e : approveEntities) {
                        if(e.getApproveType() == userDAO.getUserById(userid).getAuth().getOpResourceCode()){
                            e.setApproveStatus(studentActivityApplyEntity.RESOURCE_STATUS_ACCEPTED);
                            e.setApproveDate(new Date());
                        }
                        if(e.getApproveStatus() == studentActivityApplyEntity.RESOURCE_STATUS_ACCEPTED)
                            approveNum ++;
                    }
                    if(approveNum == approveEntities.size()){
                        studentActivityApplyEntity.setResourceStatus(studentActivityApplyEntity.RESOURCE_STATUS_ACCEPTED);
                        studentActivityApplyEntity.setGroupStatus(studentActivityApplyEntity.GROUP_STATUS_TODO);
                    }
                    //sendEmailByAllocate(studentActivityApplyEntity.getAllocateType(), studentActivityApplyEntity.getID());
                } else if(isApprove == 2){
                    List<StudentActivityApproveEntity> approveEntities = studentActivityApproveDAO.getApproveEntitiesByApplyIdAndApproveStep(studentActivityApplyEntity.getID(), StudentActivityApproveEntity.APPROVE_STEP_RESOURCE);
                    for (StudentActivityApproveEntity e : approveEntities) {
                        if(e.getApproveType() == userDAO.getUserById(userid).getAuth().getOpResourceCode()){
                            e.setApproveStatus(studentActivityApplyEntity.RESOURCE_STATUS_REJECTED);
                            e.setApproveDate(new Date());
                        }
                    }
                    studentActivityApplyEntity.setResourceStatus(studentActivityApplyEntity.RESOURCE_STATUS_REJECTED);
                    studentActivityApplyEntity.setApplyStatus(studentActivityApplyEntity.APPLY_STATUS_REJECTED);
                }
            } else if (type == ShowStudentActivityApplyMessage.APPROVE_TYPE_ALLOCATE) {
                //studentActivityApplyEntity.setAllocateDate(new Date());
                if (isApprove == 1) {
                     List<StudentActivityApproveEntity> approveEntities = studentActivityApproveDAO.getApproveEntitiesByApplyIdAndApproveStep(studentActivityApplyEntity.getID(), StudentActivityApproveEntity.APPROVE_STEP_ALLOCATE);
                    int approveNum = 0;
                    for (StudentActivityApproveEntity e : approveEntities) {
                        if(e.getApproveType() == userDAO.getUserById(userid).getAuth().getOpAllocateCode()){
                            e.setApproveStatus(studentActivityApplyEntity.ALLOCATE_STATUS_ACCEPTED);
                            e.setApproveDate(new Date());
                        }
                        if(e.getApproveStatus() == studentActivityApplyEntity.ALLOCATE_STATUS_ACCEPTED)
                            approveNum ++;
                    }
                    if(approveNum == approveEntities.size()){
                        studentActivityApplyEntity.setAllocateStatus(studentActivityApplyEntity.ALLOCATE_STATUS_ACCEPTED);
                        studentActivityApplyEntity.setApplyStatus(studentActivityApplyEntity.APPLY_STATUS_ACCEPTED);
                    }
                    
                } else if(isApprove == 2){
                    List<StudentActivityApproveEntity> approveEntities = studentActivityApproveDAO.getApproveEntitiesByApplyIdAndApproveStep(studentActivityApplyEntity.getID(), StudentActivityApproveEntity.APPROVE_STEP_ALLOCATE);
                    for (StudentActivityApproveEntity e : approveEntities) {
                        if(e.getApproveType() == userDAO.getUserById(userid).getAuth().getOpAllocateCode()){
                            e.setApproveStatus(studentActivityApplyEntity.ALLOCATE_STATUS_REJECTED);
                            e.setApproveDate(new Date());
                        }
                    }
                    studentActivityApplyEntity.setAllocateStatus(studentActivityApplyEntity.ALLOCATE_STATUS_REJECTED);
                    studentActivityApplyEntity.setApplyStatus(studentActivityApplyEntity.APPLY_STATUS_REJECTED);
                }
            }
            applyStudentActivityDAO.updateStudentActivityApplyEntity(studentActivityApplyEntity);
        }
        else{
            if(type == ShowStudentActivityApplyMessage.APPROVE_TYPE_GROUP){
                List<StudentActivityApproveEntity> approveEntities = studentActivityApproveDAO.getApproveEntitiesByApplyIdAndApproveStep(studentActivityApplyEntity.getID(), StudentActivityApproveEntity.APPROVE_STEP_RESOURCE);
                for (StudentActivityApproveEntity e : approveEntities) {
                    studentActivityApproveDAO.deleteApproveEntity(e);
                }
                if(resources != null){
                    for (int i = 0; i < resources.length; i ++) {
                        StudentActivityApproveEntity approveEntity = new StudentActivityApproveEntity();
                        approveEntity.setApplyId(studentActivityApplyEntity.getID());
                        approveEntity.setApproveStep(StudentActivityApproveEntity.APPROVE_STEP_RESOURCE);
                        approveEntity.setApproveType(resources[i]);
                        approveEntity.setApproveStatus(StudentActivityApplyEntity.RESOURCE_STATUS_TODO);
                        studentActivityApproveDAO.saveStudentActivityApproveEntity(approveEntity);
                    }
                    if(resources.length != 0){
                        studentActivityApplyEntity.setResourceStatus(studentActivityApplyEntity.RESOURCE_STATUS_TODO);
                        studentActivityApplyEntity.setGroupStatus(studentActivityApplyEntity.GROUP_STATUS_AWAIT);
                    }
                }
            }
            applyStudentActivityDAO.updateStudentActivityApplyEntity(studentActivityApplyEntity);
        }
	
    }
    
     @Transactional
    public StudentActivityApplyEntity createStudentActivityApply(String organizerName, String associateOrganizerName,String applicant,
	    String applicantCell, int activityType, String usageComment, String content,
	    String manager, String managerCell, Date activityDate, String timePeriod,
	     int number, String title, int userid, int applyRange, int applyType, StudentApplyOptionsEntity option) {
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
        entity.setOption(option);
        //entity.setApplyStatus(StudentActivityApplyEntity.APPLY_STATUS_UNCONFIRMED);
	//entity.setIdentityType(applyType);
	configureApplyStatus(entity, applyType);
	applyStudentActivityDAO.saveStudentActivityApplyEntity(entity);
	return entity;
    }
    public StudentActivityApplyEntity configureApplyStatus(StudentActivityApplyEntity entity, int applyType ){
        entity.setApplyStatus(StudentActivityApplyEntity.APPLY_STATUS_UNCONFIRMED);
        entity.setIdentityType(applyType);
        entity.setIdentityStatus(StudentActivityApplyEntity.IDENTITY_STATUS_TODO);
        entity.setGroupStatus(StudentActivityApplyEntity.GROUP_STATUS_AWAIT);
        entity.setGroupType(GroupMapping.getIdByName("校团委"));
        entity.setResourceStatus(StudentActivityApplyEntity.RESOURCE_STATUS_AWAIT);
        entity.setAllocateStatus(StudentActivityApplyEntity.ALLOCATE_STATUS_AWAIT);
        return entity;
    }
     
    @Transactional
    public StudentActivityApplyEntity modifyStudentActivityApply(String organizerName, String associateOrganizerName,String applicant,
	    String applicantCell, int activityType, String usageComment, String content,
	    String manager, String managerCell, Date activityDate, String timePeriod,
	     int number, String title, int userid, int applyRange, int applyType, StudentApplyOptionsEntity option, int applyId) {
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
        entity.setOption(option);
	configureApplyStatus(entity, applyType);
        //entity.setApplyStatus(StudentActivityApplyEntity.APPLY_STATUS_UNCONFIRMED);
	//entity.setIdentityType(applyType);
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
	}
        else if(approveType == ShowStudentActivityApplyListPageAction.APPROVE_TYPE_GROUP && auth.getOpGroupCode() != -1){
            if(viewType == ShowStudentActivityApplyListPageAction.VIEW_TYPE_PAST){
                list = applyStudentActivityDAO.getPastApplyListByGroupType(begin, number, auth.getOpGroupCode());
            }
            else if(viewType == ShowStudentActivityApplyListPageAction.VIEW_TYPE_TODO){
                list = applyStudentActivityDAO.getTodoApplyListByGroupType(begin, number, auth.getOpGroupCode());
            }
        }
        else if (approveType == ShowStudentActivityApplyListPageAction.APPROVE_TYPE_RESOURCE && auth.getOpResourceCode() != -1) {
	    if (viewType == ShowStudentActivityApplyListPageAction.VIEW_TYPE_PAST) {
		//list = applyStudentActivityDAO.getPastApplyListByResourceType(begin, number, auth.getOpResourceCode());
                List<StudentActivityApproveEntity> approveEntities = studentActivityApproveDAO.getPastApplyListByResourceType(begin, number, auth.getOpResourceCode());
                list = new ArrayList<StudentActivityApplyEntity>();
                for (StudentActivityApproveEntity e : approveEntities) {
                    list.add(applyStudentActivityDAO.getStudentActivityApplyEntityById(e.getApplyId()));
                }
	    } else if (viewType == ShowStudentActivityApplyListPageAction.VIEW_TYPE_TODO) {
		//list = applyStudentActivityDAO.getTodoApplyListByResourceType(begin, number, auth.getOpResourceCode());
                List<StudentActivityApproveEntity> approveEntities = studentActivityApproveDAO.getTodoApplyListByResourceType(begin, number, auth.getOpResourceCode());
                list = new ArrayList<StudentActivityApplyEntity>();
                for (StudentActivityApproveEntity e : approveEntities) {
                    list.add(applyStudentActivityDAO.getStudentActivityApplyEntityById(e.getApplyId()));
                }
	    }
	} 
         else if (approveType == ShowStudentActivityApplyListPageAction.APPROVE_TYPE_ALLOCATE && auth.getOpAllocateCode() != -1) {
	    if (viewType == ShowStudentActivityApplyListPageAction.VIEW_TYPE_PAST) {
		//list = applyStudentActivityDAO.getPastApplyListByResourceType(begin, number, auth.getOpResourceCode());
                List<StudentActivityApproveEntity> approveEntities = studentActivityApproveDAO.getPastApplyListByAllocateType(begin, number, auth.getOpAllocateCode());
                list = new ArrayList<StudentActivityApplyEntity>();
                for (StudentActivityApproveEntity e : approveEntities) {
                    list.add(applyStudentActivityDAO.getStudentActivityApplyEntityById(e.getApplyId()));
                }
	    } else if (viewType == ShowStudentActivityApplyListPageAction.VIEW_TYPE_TODO) {
		//list = applyStudentActivityDAO.getTodoApplyListByResourceType(begin, number, auth.getOpResourceCode());
                List<StudentActivityApproveEntity> approveEntities = studentActivityApproveDAO.getTodoApplyListByAllocateType(begin, number, auth.getOpAllocateCode());
                list = new ArrayList<StudentActivityApplyEntity>();
                for (StudentActivityApproveEntity e : approveEntities) {
                    list.add(applyStudentActivityDAO.getStudentActivityApplyEntityById(e.getApplyId()));
                }
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
	}
        else if(approveType == ShowStudentActivityApplyListPageAction.APPROVE_TYPE_GROUP && auth.getOpGroupCode() != -1){
            if(viewType == ShowStudentActivityApplyListPageAction.VIEW_TYPE_PAST){
                resultCount = applyStudentActivityDAO.getPastApplyCountByGroupType(auth.getOpGroupCode());
            }
            else if(viewType == ShowStudentActivityApplyListPageAction.VIEW_TYPE_TODO){
                resultCount = applyStudentActivityDAO.getTodoApplyCountByGroupType(auth.getOpGroupCode());
            }
        }
        else if (approveType == ShowStudentActivityApplyListPageAction.APPROVE_TYPE_RESOURCE && auth.getOpResourceCode() != -1) {
	    if (viewType == ShowStudentActivityApplyListPageAction.VIEW_TYPE_PAST) {
		//resultCount = applyStudentActivityDAO.getPastApplyCountByResourceType(auth.getOpResourceCode());
                resultCount = studentActivityApproveDAO.getPastApplyCountByResourceType(auth.getOpResourceCode());
	    } else if (viewType == ShowStudentActivityApplyListPageAction.VIEW_TYPE_TODO) {
		//resultCount = applyStudentActivityDAO.getTodoApplyCountByResourceType(auth.getOpResourceCode());
                resultCount = studentActivityApproveDAO.getTodoApplyCountByResourceType(auth.getOpResourceCode());
	    }
	}
        else if (approveType == ShowStudentActivityApplyListPageAction.APPROVE_TYPE_ALLOCATE && auth.getOpAllocateCode() != -1) {
	    if (viewType == ShowStudentActivityApplyListPageAction.VIEW_TYPE_PAST) {
		//resultCount = applyStudentActivityDAO.getPastApplyCountByResourceType(auth.getOpResourceCode());
                resultCount = studentActivityApproveDAO.getPastApplyCountByAllocateType(auth.getOpAllocateCode());
	    } else if (viewType == ShowStudentActivityApplyListPageAction.VIEW_TYPE_TODO) {
		//resultCount = applyStudentActivityDAO.getTodoApplyCountByResourceType(auth.getOpResourceCode());
                resultCount = studentActivityApproveDAO.getTodoApplyCountByAllocateType(auth.getOpAllocateCode());
	    }
	}
	return resultCount / numberPerPage + (resultCount % numberPerPage == 0 ? 0 : 1);
    }
    
    @Transactional
    public int getAcceptedPublicActivitiesTotalPageNumber( int numberPerPage)
    {
	int r = applyStudentActivityDAO.getAcceptedPublicActivitiesCount();
	return (r / numberPerPage) + (r % numberPerPage == 0? 0: 1);
    }
     
    @Transactional
    public List<StudentActivityApplyEntity> getAcceptedPublicActivitiesList(int page, int numberPerPage)
    {
	return applyStudentActivityDAO.getAcceptedPublicActivities((page - 1)*numberPerPage, numberPerPage);
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
     * @return the commentDAO
     */
    public CommentDAO getCommentDAO() {
        return commentDAO;
    }

    /**
     * @param commentDAO the commentDAO to set
     */
    public void setCommentDAO(CommentDAO commentDAO) {
        this.commentDAO = commentDAO;
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

    /**
     * @return the studentApplyOptionsDAO
     */
    public StudentApplyOptionsDAO getStudentApplyOptionsDAO() {
        return studentApplyOptionsDAO;
    }

    /**
     * @param studentApplyOptionsDAO the studentApplyOptionsDAO to set
     */
    public void setStudentApplyOptionsDAO(StudentApplyOptionsDAO studentApplyOptionsDAO) {
        this.studentApplyOptionsDAO = studentApplyOptionsDAO;
    }

    /**
     * @return the studentActivityApproveDAO
     */
    public StudentActivityApproveDAO getStudentActivityApproveDAO() {
        return studentActivityApproveDAO;
    }

    /**
     * @param studentActivityApproveDAO the studentActivityApproveDAO to set
     */
    public void setStudentActivityApproveDAO(StudentActivityApproveDAO studentActivityApproveDAO) {
        this.studentActivityApproveDAO = studentActivityApproveDAO;
    }

  
}
