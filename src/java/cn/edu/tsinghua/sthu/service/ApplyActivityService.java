/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.service;

import cn.edu.tsinghua.sthu.dao.ApplyActivityDAO;
import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.ActivityApplyEntity;
import cn.edu.tsinghua.sthu.entity.UserEntity;
import java.util.*;
import org.springframework.transaction.annotation.Transactional;
import cn.edu.tsinghua.sthu.constant.ResourceMapping;

/**
 *
 * @author luzhen
 */
public class ApplyActivityService extends BaseService {
    private ApplyActivityDAO applyActivityDao;
    
    @Transactional
    public ActivityApplyEntity getActivityApplyEntityById(int id, int userid) {
	ActivityApplyEntity entity = getApplyActivityDao().getActivityApplyEntityById(id);
	if (entity == null || entity.getApplyUserID() != userid) {
	    return null;
	} else if (entity.getApplyStatus() != ActivityApplyEntity.APPLY_STATUS_UNCONFIRMED && entity.getApplyStatus() != ActivityApplyEntity.APPLY_STATUS_REJECTED) {
	    return null;
	} else {
	    return entity;
	}
    }
    
    @Transactional
    public ActivityApplyEntity getActivityApplyEntityById(int applyId) {
	return getApplyActivityDao().getActivityApplyEntityById(applyId);
    }
    
    @Transactional
    public ActivityApplyEntity createActivityApply(int applyType, String activityName, 
    String activityContent, Date startTime, Date endTime, String LEDContent, String activityLocation,
    String activityMaterial, String organizerName, String applicatantType, String applicatantName, String applicatantCell,
    String applicatantEmail, int applyPath, int applyUserID) {
	ActivityApplyEntity entity = new ActivityApplyEntity();
	entity.setApplyType(applyType);
        entity.setActivityName(activityName);
        entity.setActivityContent(activityContent);
        entity.setStartTime(startTime);
        entity.setEndTime(endTime);
        if (applyType == ActivityApplyEntity.APPLY_TYPE_LED)
        {
            entity.setLEDContent(LEDContent);
        }
        else
        {
            entity.setActivityLocation(activityLocation);
            entity.setActivityMaterial(activityMaterial);
        }
        entity.setOrganizerName(organizerName);
        entity.setApplicatantName(applicatantName);
        entity.setApplicatantCell(applicatantCell);
        entity.setApplicatantType(applicatantType);
        entity.setApplicatantEmail(applicatantEmail);
        entity.setApplyPath(applyPath);
        entity.setApplyUserID(applyUserID);
	entity.setApplyDate(new Date());
        configureApplyStatus(entity, applyType, applyPath);
	getApplyActivityDao().saveActivityApplyEntity(entity);
	return entity;
    }  
    
    @Transactional
    public ActivityApplyEntity modifyActivityApply(int applyType, String activityName, 
    String activityContent, Date startTime, Date endTime, String LEDContent, String activityLocation,
    String activityMaterial, String organizerName, String applicatantType, String applicatantName, String applicatantCell,
    String applicatantEmail, int applyPath, int applyUserID, int applyId) {
        ActivityApplyEntity entity = getApplyActivityDao().getActivityApplyEntityById(applyId);
        
	if (entity.getApplyStatus() != ActivityApplyEntity.APPLY_STATUS_UNCONFIRMED
		&& entity.getApplyStatus() != ActivityApplyEntity.APPLY_STATUS_REJECTED) {
	    return null;
	}
	
	entity.setApplyType(applyType);
        entity.setActivityName(activityName);
        entity.setActivityContent(activityContent);
        entity.setStartTime(startTime);
        entity.setEndTime(endTime);
        if (applyType == ActivityApplyEntity.APPLY_TYPE_LED)
        {
            entity.setLEDContent(LEDContent);
        }
        else
        {
            entity.setActivityLocation(activityLocation);
            entity.setActivityMaterial(activityMaterial);
        }
        entity.setOrganizerName(organizerName);
        entity.setApplicatantName(applicatantName);
        entity.setApplicatantCell(applicatantCell);
        entity.setApplicatantType(applicatantType);
        entity.setApplicatantEmail(applicatantEmail);
        entity.setApplyPath(applyPath);
        entity.setApplyUserID(applyUserID);
	entity.setApplyDate(new Date());
        configureApplyStatus(entity, applyType, applyPath);
	getApplyActivityDao().updateActivityApplyEntity(entity);
	return entity;
    }
    
    public void configureApplyStatus(ActivityApplyEntity entity, int applyType, int applyPath) {
	entity.setApplyStatus(ActivityApplyEntity.APPLY_STATUS_UNCONFIRMED);
	entity.setIdentityType(applyPath);
	entity.setIdentityStatus(ActivityApplyEntity.IDENTITY_STATUS_AWAIT);
	if (entity.getApplyType() == ActivityApplyEntity.APPLY_TYPE_LED)
        {
            entity.setResourceType(ResourceMapping.getIdByName("电子屏审批"));
        }
        else if (entity.getApplyType() == ActivityApplyEntity.APPLY_TYPE_OUTDOOR)
        {
            entity.setResourceType(ResourceMapping.getIdByName("室外活动审批"));
        }
        else if (entity.getApplyType() == ActivityApplyEntity.APPLY_TYPE_BOARD)
        {
            entity.setResourceType(ResourceMapping.getIdByName("展板审批"));
        }
	entity.setResourceStatus(ActivityApplyEntity.RESOURCE_STATUS_AWAIT);
    }
    
    @Transactional
    public ActivityApplyEntity confirmApply(ActivityApplyEntity entity) {
	entity.setApplyStatus(ActivityApplyEntity.APPLY_STATUS_CONFIRMED);
	entity.setConfirmDate(new Date());
	entity.setIdentityStatus(ActivityApplyEntity.IDENTITY_STATUS_TODO);
	entity.setIdentityDate(null);
	entity.setResourceDate(null);
	applyActivityDao.updateActivityApplyEntity(entity);
	return entity;
    }
    
    @Transactional
    public int getMyApplyTotalPageNumber(int userID, int numberPerPage)
    {
	int r = applyActivityDao.getMyApplyCountByUserID(userID);
	return (r / numberPerPage) + (r % numberPerPage == 0? 0: 1);
    }
    
    @Transactional
    public List<ActivityApplyEntity> getMyApplyList(int userid, int page, int numberPerPage)
    {
	return applyActivityDao.getMyApplyListByUserid(userid, (page - 1)*numberPerPage, numberPerPage);
    }

    public ApplyActivityDAO getApplyActivityDao() {
        return applyActivityDao;
    }

    public void setApplyActivityDao(ApplyActivityDAO applyActivityDao) {
        this.applyActivityDao = applyActivityDao;
    }
    
}
