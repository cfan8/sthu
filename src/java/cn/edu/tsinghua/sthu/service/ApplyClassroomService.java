/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.service;

import cn.edu.tsinghua.sthu.constant.AllocateMapping;
import cn.edu.tsinghua.sthu.constant.IdentityMapping;
import cn.edu.tsinghua.sthu.constant.ResourceMapping;
import cn.edu.tsinghua.sthu.dao.ApplyClassroomDAO;
import cn.edu.tsinghua.sthu.entity.ApplyCommentEntity;
import cn.edu.tsinghua.sthu.entity.CRoomApplyEntity;
import cn.edu.tsinghua.sthu.message.ShowApplyMessage;
import java.util.Date;
import javax.persistence.EntityListeners;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author linangran
 */
public class ApplyClassroomService extends BaseService {

    private ApplyClassroomDAO applyClassroomDAO;

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
    public CRoomApplyEntity getCRoomApplyEntityById(int applyId)
    {
	return applyClassroomDAO.getCRoomApplyEntityById(applyId);
    }

    @Transactional
    public CRoomApplyEntity createCRoomApply(String organizer, String borrower,
	    String borrowerCell, int classUsage, String usageComment, String content,
	    String manager, String managerCell, Date borrowDate, String timePeriod,
	    int croomtype, int number, String reason, int userid, int applyType) {
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
	entity.setReason(reason);
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
	    int croomtype, int number, String reason, int userid, int applyType, int applyId){
	CRoomApplyEntity entity = applyClassroomDAO.getCRoomApplyEntityById(applyId);
	if (entity.getApplyStatus() != CRoomApplyEntity.APPLY_STATUS_UNCONFIRMED && 
		entity.getApplyStatus() != CRoomApplyEntity.APPLY_STATUS_REJECTED ) {
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
	entity.setReason(reason);
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
	} else if (entity.getCroomtype() == CRoomApplyEntity.ROOMTYPE_CBUILDING) {
	    entity.setAllocateType(AllocateMapping.getIdByName("C楼"));
	}
	entity.setAllocateStatus(CRoomApplyEntity.ALLOCATE_STATUS_AWAIT);
	return entity;
    }

    @Transactional
    public CRoomApplyEntity confirmApply(CRoomApplyEntity entity)
    {
	entity.setApplyStatus(CRoomApplyEntity.APPLY_STATUS_CONFIRMED);
	entity.setApplyDate(new Date());
	entity.setIdentityStatus(CRoomApplyEntity.IDENTITY_STATUS_TODO);
	entity.setIdentityDate(null);
	entity.setResourceDate(null);
	entity.setAllocateDate(null);
	for (ApplyCommentEntity comment:entity.getComments())
	{
	    comment.setCommentStatus(ApplyCommentEntity.COMMENT_STATUS_OLD);
	}
	applyClassroomDAO.updateCRoomApplyEntity(entity);
	return entity;
    }
    
    @Transactional
    public void processComment(CRoomApplyEntity applyEntity, boolean isApprove, String comment, int type, String nickName, int userid)
    {
	ApplyCommentEntity commentEntity = new ApplyCommentEntity();
	commentEntity.setComment(comment);
	commentEntity.setCommentStatus(ApplyCommentEntity.COMMENT_STATUS_NEW);
	commentEntity.setCommentType(isApprove?ApplyCommentEntity.COMMENT_TYPE_ACCEPT:ApplyCommentEntity.COMMENT_TYPE_REJECT);
	commentEntity.setNickname(nickName);
	commentEntity.setPubDate(new Date());
	commentEntity.setUserid(userid);
	applyEntity.getComments().add(commentEntity);
	if (type == ShowApplyMessage.APPROVE_TYPE_IDENTITY)
	{
	    if (isApprove == true)
	    {
		applyEntity.setIdentityStatus(CRoomApplyEntity.IDENTITY_STATUS_ACCEPTED);
		applyEntity.setIdentityDate(new Date());
		applyEntity.setResourceStatus(CRoomApplyEntity.RESOURCE_STATUS_TODO);
	    }
	    else
	    {
		applyEntity.setIdentityStatus(CRoomApplyEntity.IDENTITY_STATUS_REJECTED);
		applyEntity.setApplyStatus(CRoomApplyEntity.APPLY_STATUS_REJECTED);
	    }
	}
	else if (type == ShowApplyMessage.APPROVE_TYPE_RESOURCE)
	{
	    if (isApprove)
	    {
		applyEntity.setResourceStatus(CRoomApplyEntity.RESOURCE_STATUS_ACCEPTED);
		applyEntity.setResourceDate(new Date());
		applyEntity.setAllocateStatus(CRoomApplyEntity.ALLOCATE_STATUS_TODO);
	    }
	    else
	    {
		applyEntity.setResourceStatus(CRoomApplyEntity.RESOURCE_STATUS_REJECTED);
		applyEntity.setApplyStatus(CRoomApplyEntity.APPLY_STATUS_REJECTED);
	    }
	}
	else if (type == ShowApplyMessage.APPROVE_TYPE_ALLOCATE)
	{
	    if (isApprove)
	    {
		applyEntity.setAllocateStatus(CRoomApplyEntity.ALLOCATE_STATUS_ACCEPTED);
		applyEntity.setAllocateDate(new Date());
		applyEntity.setApplyStatus(CRoomApplyEntity.APPLY_STATUS_ACCEPTED);
	    }
	    else{
		applyEntity.setAllocateStatus(CRoomApplyEntity.ALLOCATE_STATUS_REJECTED);
		applyEntity.setApplyStatus(CRoomApplyEntity.APPLY_STATUS_REJECTED);
	    }
	}
	applyClassroomDAO.updateCRoomApplyEntity(applyEntity);
    }
    
    public ApplyClassroomDAO getApplyClassroomDAO() {
	return applyClassroomDAO;
    }

    public void setApplyClassroomDAO(ApplyClassroomDAO applyClassroomDAO) {
	this.applyClassroomDAO = applyClassroomDAO;
    }
}
