/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.service;

import cn.edu.tsinghua.sthu.action.ShowApplyListAction;
import cn.edu.tsinghua.sthu.action.ShowApplyListPageAction;
import cn.edu.tsinghua.sthu.constant.AllocateMapping;
import cn.edu.tsinghua.sthu.constant.IdentityMapping;
import cn.edu.tsinghua.sthu.constant.ResourceMapping;
import cn.edu.tsinghua.sthu.dao.ApplyClassroomDAO;
import cn.edu.tsinghua.sthu.dao.ApplyCommentDAO;
import cn.edu.tsinghua.sthu.entity.ApplyCommentEntity;
import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.CRoomApplyEntity;
import cn.edu.tsinghua.sthu.entity.UserEntity;
import cn.edu.tsinghua.sthu.message.ShowApplyMessage;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityListeners;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.tsinghua.sthu.dao.AuthDAO;
import cn.edu.tsinghua.sthu.dao.UserDAO;
import cn.edu.tsinghua.sthu.dao.EmailDAO;
import cn.edu.tsinghua.sthu.entity.EmailEntity;
import javamail.MailSender;
import javamail.MailMessage;
import javamail.MailSenderPool;


/**
 *
 * @author linangran
 */
public class ApplyClassroomService extends BaseService {

    private ApplyClassroomDAO applyClassroomDAO;
    private ApplyCommentDAO applyCommentDAO;
    private AuthDAO authDAO;
    private UserDAO userDAO;
    private EmailDAO emailDAO;

    @Transactional
    public CRoomApplyEntity getCRoomApplyEntityById(int id, int userid) {
	CRoomApplyEntity entity = applyClassroomDAO.getCRoomApplyEntityById(id);
	if (entity == null || entity.getApplyUserid() != userid) {
	    return null;
	} else if (entity.getApplyStatus() != CRoomApplyEntity.APPLY_STATUS_UNCONFIRMED && entity.getApplyStatus() != CRoomApplyEntity.APPLY_STATUS_REJECTED) {
	    return null;
	} else {
	    return entity;
	}
    }

    @Transactional 
    public CRoomApplyEntity getComments(CRoomApplyEntity entity)
    {
	entity.setComments(applyCommentDAO.getCommentsByApplyId(entity.getID()));
	return entity;
    }
    
    @Transactional
    public CRoomApplyEntity getCRoomApplyEntityById(int applyId) {
	CRoomApplyEntity entity = applyClassroomDAO.getCRoomApplyEntityById(applyId);
	entity.setComments(applyCommentDAO.getCommentsByApplyId(applyId));
	return entity;
    }

    @Transactional
    public CRoomApplyEntity createCRoomApply(String organizer, String borrower,
	    String borrowerCell, int classUsage, String usageComment, String content,
	    String manager, String managerCell, Date borrowDate, String timePeriod,
	    int croomtype, int number, String title, int userid, int applyType) {
	CRoomApplyEntity entity = new CRoomApplyEntity();
	entity.setOrganizer(organizer);
	entity.setBorrower(borrower);
	entity.setBorrowerCell(borrowerCell);
	entity.setUsage(classUsage);
	entity.setUsageComment(usageComment);
	entity.setContent(content);
	entity.setManager(manager);
	entity.setManagerCell(managerCell);
	entity.setBorrowDate(borrowDate);
	entity.setTimePeriod(timePeriod);
	entity.setCroomtype(croomtype);
	entity.setNumber(number);
	entity.setTitle(title);
	entity.setApplyUserid(userid);
	entity.setApplyDate(new Date());
	entity.setApplyType(applyType);
	configureApplyStatus(entity, applyType);
	applyClassroomDAO.saveCRoomApplyEntity(entity);
	return entity;
    }

    @Transactional
    public CRoomApplyEntity modifyCRoomApply(String organizer, String borrower,
	    String borrowerCell, int classUsage, String usageComment, String content,
	    String manager, String managerCell, Date borrowDate, String timePeriod,
	    int croomtype, int number, String title, int userid, int applyType, int applyId) {
	CRoomApplyEntity entity = applyClassroomDAO.getCRoomApplyEntityById(applyId);
	if (entity.getApplyStatus() != CRoomApplyEntity.APPLY_STATUS_UNCONFIRMED
		&& entity.getApplyStatus() != CRoomApplyEntity.APPLY_STATUS_REJECTED) {
	    return null;
	}
	entity.setOrganizer(organizer);
	entity.setBorrower(borrower);
	entity.setBorrowerCell(borrowerCell);
	entity.setUsage(classUsage);
	entity.setUsageComment(usageComment);
	entity.setContent(content);
	entity.setManager(manager);
	entity.setManagerCell(managerCell);
	entity.setBorrowDate(borrowDate);
	entity.setTimePeriod(timePeriod);
	entity.setCroomtype(croomtype);
	entity.setNumber(number);
	entity.setTitle(title);
	entity.setApplyUserid(userid);
	entity.setApplyDate(new Date());
	entity.setApplyType(applyType);
	configureApplyStatus(entity, applyType);
	applyClassroomDAO.updateCRoomApplyEntity(entity);
	return entity;
    }

    public CRoomApplyEntity configureApplyStatus(CRoomApplyEntity entity, int applyType) {
	entity.setApplyStatus(CRoomApplyEntity.APPLY_STATUS_UNCONFIRMED);
	entity.setIdentityType(applyType);
	entity.setIdentityStatus(CRoomApplyEntity.IDENTITY_STATUS_AWAIT);
	entity.setResourceType(ResourceMapping.getIdByName("校团委"));
	entity.setResourceStatus(CRoomApplyEntity.RESOURCE_STATUS_AWAIT);
	if (entity.getCroomtype() == CRoomApplyEntity.ROOMTYPE_ORDINARY) {
	    entity.setAllocateType(AllocateMapping.getIdByName("物业中心"));
	} else if (entity.getCroomtype() == CRoomApplyEntity.ROOMTYPE_MEDIA) {
	    entity.setAllocateType(AllocateMapping.getIdByName("注册中心"));
	} else if (entity.getCroomtype() == CRoomApplyEntity.ROOMTYPE_CBUILDING_NORMAL ||
		entity.getCroomtype() == CRoomApplyEntity.ROOMTYPE_CBUILDING_MEDIA ) 
	{
	    entity.setAllocateType(AllocateMapping.getIdByName("C楼"));
	}
	entity.setAllocateStatus(CRoomApplyEntity.ALLOCATE_STATUS_AWAIT);
	return entity;
    }

    @Transactional
    public CRoomApplyEntity confirmApply(CRoomApplyEntity entity) {
	entity.setApplyStatus(CRoomApplyEntity.APPLY_STATUS_CONFIRMED);
	entity.setConfirmDate(new Date());
	entity.setIdentityStatus(CRoomApplyEntity.IDENTITY_STATUS_TODO);
	entity.setIdentityDate(null);
	entity.setResourceDate(null);
	entity.setAllocateDate(null);
	applyCommentDAO.markAsOld(entity.getComments());
	applyClassroomDAO.updateCRoomApplyEntity(entity);
        sendEmailByIdentity(entity.getIdentityType(), entity.getID());
	return entity;
    }

    @Transactional
    public void processComment(CRoomApplyEntity applyEntity, Integer isApprove, String comment, int type, String nickName, int userid) {
	ApplyCommentEntity commentEntity = new ApplyCommentEntity();
	commentEntity.setApplyId(applyEntity.getID());
	commentEntity.setComment(comment);
	commentEntity.setCommentStatus(ApplyCommentEntity.COMMENT_STATUS_NEW);
	commentEntity.setCommentType(isApprove);
	commentEntity.setNickname(nickName);
	commentEntity.setPubDate(new Date());
	commentEntity.setUserid(userid);
	applyCommentDAO.addComment(commentEntity);

        if(isApprove != 3)
        {
            if (type == ShowApplyMessage.APPROVE_TYPE_IDENTITY) {
                applyEntity.setIdentityDate(new Date());
                if (isApprove == 1) {
                    applyEntity.setIdentityStatus(CRoomApplyEntity.IDENTITY_STATUS_ACCEPTED);
                    applyEntity.setResourceStatus(CRoomApplyEntity.RESOURCE_STATUS_TODO);
                    sendEmailByResource(applyEntity.getResourceType(), applyEntity.getID());
                } else if(isApprove == 2) 
                {
                    applyEntity.setIdentityStatus(CRoomApplyEntity.IDENTITY_STATUS_REJECTED);
                    applyEntity.setApplyStatus(CRoomApplyEntity.APPLY_STATUS_REJECTED);
                }
            } else if (type == ShowApplyMessage.APPROVE_TYPE_RESOURCE) {
                applyEntity.setResourceDate(new Date());
                if (isApprove == 1) {
                    applyEntity.setResourceStatus(CRoomApplyEntity.RESOURCE_STATUS_ACCEPTED);
                    applyEntity.setAllocateStatus(CRoomApplyEntity.ALLOCATE_STATUS_TODO);
                    sendEmailByAllocate(applyEntity.getAllocateType(), applyEntity.getID());
                } else if(isApprove == 2){
                    applyEntity.setResourceStatus(CRoomApplyEntity.RESOURCE_STATUS_REJECTED);
                    applyEntity.setApplyStatus(CRoomApplyEntity.APPLY_STATUS_REJECTED);
                }
            } else if (type == ShowApplyMessage.APPROVE_TYPE_ALLOCATE) {
                applyEntity.setAllocateDate(new Date());
                if (isApprove == 1) {
                    applyEntity.setAllocateStatus(CRoomApplyEntity.ALLOCATE_STATUS_ACCEPTED);
                    applyEntity.setApplyStatus(CRoomApplyEntity.APPLY_STATUS_ACCEPTED);
                } else if(isApprove == 2){
                    applyEntity.setAllocateStatus(CRoomApplyEntity.ALLOCATE_STATUS_REJECTED);
                    applyEntity.setApplyStatus(CRoomApplyEntity.APPLY_STATUS_REJECTED);
                }
            }
            applyClassroomDAO.updateCRoomApplyEntity(applyEntity);
        }

    }

    @Transactional
    public List<CRoomApplyEntity> getPagedApply(int viewType, int page, int number, AuthEntity auth, int approveType) {
	List<CRoomApplyEntity> list = null;
	int begin = (page - 1) * number;
	if (approveType == ShowApplyListPageAction.APPROVE_TYPE_IDENTITY && auth.getOpIdentityCode() != -1) {
	    if (viewType == ShowApplyListPageAction.VIEW_TYPE_PAST) {
		list = applyClassroomDAO.getPastApplyListByIdentityType(begin, number, auth.getOpIdentityCode());
	    } else if (viewType == ShowApplyListPageAction.VIEW_TYPE_TODO) {
		list = applyClassroomDAO.getTodoApplyListByIdentityType(begin, number, auth.getOpIdentityCode());
	    }
	} else if (approveType == ShowApplyListPageAction.APPROVE_TYPE_RESOURCE && auth.getOpResourceCode() != -1) {
	    if (viewType == ShowApplyListPageAction.VIEW_TYPE_PAST) {
		list = applyClassroomDAO.getPastApplyListByResourceType(begin, number, auth.getOpResourceCode());
	    } else if (viewType == ShowApplyListPageAction.VIEW_TYPE_TODO) {
		list = applyClassroomDAO.getTodoApplyListByResourceType(begin, number, auth.getOpResourceCode());
	    }
	} else if (approveType == ShowApplyListPageAction.APPROVE_TYPE_ALLOCATE && auth.getOpAllocateCode() != -1) {
	    if (viewType == ShowApplyListPageAction.VIEW_TYPE_PAST) {
		list = applyClassroomDAO.getPastApplyListByAllocateType(begin, number, auth.getOpAllocateCode());
	    } else if (viewType == ShowApplyListPageAction.VIEW_TYPE_TODO) {
		list = applyClassroomDAO.getTodoApplyListByAllocateType(begin, number, auth.getOpAllocateCode());
	    }
	}
	return list;
    }

    @Transactional
    public int getTotalPageNumber(int viewType, int numberPerPage, AuthEntity auth, int approveType) {
	int resultCount = 0;
	if (approveType == ShowApplyListPageAction.APPROVE_TYPE_IDENTITY && auth.getOpIdentityCode() != -1) {
	    if (viewType == ShowApplyListPageAction.VIEW_TYPE_PAST) {
		resultCount = applyClassroomDAO.getPastApplyCountByIdentityType(auth.getOpIdentityCode());
	    } else if (viewType == ShowApplyListPageAction.VIEW_TYPE_TODO) {
		resultCount = applyClassroomDAO.getTodoApplyCountByIdentityType(auth.getOpIdentityCode());
	    }
	} else if (approveType == ShowApplyListPageAction.APPROVE_TYPE_RESOURCE && auth.getOpResourceCode() != -1) {
	    if (viewType == ShowApplyListPageAction.VIEW_TYPE_PAST) {
		resultCount = applyClassroomDAO.getPastApplyCountByResourceType(auth.getOpResourceCode());
	    } else if (viewType == ShowApplyListPageAction.VIEW_TYPE_TODO) {
		resultCount = applyClassroomDAO.getTodoApplyCountByResourceType(auth.getOpResourceCode());
	    }
	} else if (approveType == ShowApplyListPageAction.APPROVE_TYPE_ALLOCATE && auth.getOpAllocateCode() != -1) {
	    if (viewType == ShowApplyListPageAction.VIEW_TYPE_PAST) {
		resultCount = applyClassroomDAO.getPastApplyCountByAllocateType(auth.getOpAllocateCode());
	    } else if (viewType == ShowApplyListPageAction.VIEW_TYPE_TODO) {
		resultCount = applyClassroomDAO.getTodoApplyCountByAllocateType(auth.getOpAllocateCode());
	    }
	}
	return resultCount / numberPerPage + (resultCount % numberPerPage == 0 ? 0 : 1);
    }
    
    @Transactional
    public int getMyApplyTotalPageNumber(int userid, int numberPerPage)
    {
	int r = applyClassroomDAO.getMyApplyCountByUserid(userid);
	return (r / numberPerPage) + (r % numberPerPage == 0? 0: 1);
    }
    
    @Transactional
    public List<CRoomApplyEntity> getPagedMyApplyList(int userid, int page, int numberPerPage)
    {
	return applyClassroomDAO.getMyApplyListByUserid(userid, (page - 1)*numberPerPage, numberPerPage);
    }

    public ApplyClassroomDAO getApplyClassroomDAO() {
	return applyClassroomDAO;
    }

    public void setApplyClassroomDAO(ApplyClassroomDAO applyClassroomDAO) {
	this.applyClassroomDAO = applyClassroomDAO;
    }

    public ApplyCommentDAO getApplyCommentDAO() {
	return applyCommentDAO;
    }

    public void setApplyCommentDAO(ApplyCommentDAO applyCommentDAO) {
	this.applyCommentDAO = applyCommentDAO;
    }
    
     @Transactional
    public void sendEmailByIdentity(int identityType, int applyId){
        List<UserEntity> userlist = userDAO.getUserListByIdentity(identityType);
        sendEmailByUserList(userlist, applyId);
    }
    @Transactional
    public void sendEmailByResource(int resourceType, int applyId){
        List<UserEntity> userlist = userDAO.getUserListByResource(resourceType);
        sendEmailByUserList(userlist, applyId);
    }
    
    @Transactional
    public void sendEmailByAllocate(int allocateType, int applyId){
        List<UserEntity> userlist = userDAO.getUserListByAllocate(allocateType);
        sendEmailByUserList(userlist, applyId);
    }
     @Transactional
    public void sendEmailByUserList(List<UserEntity> userList, int applyId){
         String link = "www.student.tsinghua.edu.cn/login.do?redirectURL=%2factivity%2fshowApply.do%3fapplyId%3d" + String.valueOf(applyId);
       for(int i = 0; i < userList.size(); i ++){
            if(userList.get(i) != null){
                EmailEntity email = emailDAO.getEmailById(userList.get(i).getID());
                if(email != null){
                    if(email.isIsReceiveRemindEmail()){
                        MailMessage mailMessage = new MailMessage(userList.get(i).getNickname(), email.getEmail(), link);
                        try{
                            SendEmailService.getMailSenderPool().send(mailMessage);
                        }
                        catch (Exception e){
                            
                        }
                    }
                }
            }
        }
     
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
     * @return the emailDAO
     */
    public EmailDAO getEmailDAO() {
        return emailDAO;
    }

    /**
     * @param emailDAO the emailDAO to set
     */
    public void setEmailDAO(EmailDAO emailDAO) {
        this.emailDAO = emailDAO;
    }
}
