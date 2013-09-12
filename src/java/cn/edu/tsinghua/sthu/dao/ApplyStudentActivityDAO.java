/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.dao;

import cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity;
import cn.edu.tsinghua.sthu.entity.StudentApplyOptionsEntity;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.SimpleExpression;
import org.w3c.dom.ls.LSException;

/**
 *
 * @author xiaobo
 */
public class ApplyStudentActivityDAO extends BaseDAO<StudentActivityApplyEntity>{
    public ApplyStudentActivityDAO(){
        super(StudentActivityApplyEntity.class);
    }
    public int getMyApplyCountByUserID(int userid)
    {
	Object r = select().add(Restrictions.eq("applyUserid", userid)).setProjection(Projections.rowCount()).uniqueResult();
	return ((Long) r).intValue();
    }
    
    public List<StudentActivityApplyEntity> getMyApplyListByUserid(int userid, int begin, int number)
    {
	return select().add(Restrictions.eq("applyUserid", userid)).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY)
		.addOrder(Order.desc("applyDate")).setFirstResult(begin).setMaxResults(number).list();
       
    }
    
    public StudentActivityApplyEntity getStudentActivityApplyEntityById(int id){
        return queryById(id);
    }
    public StudentActivityApplyEntity saveStudentActivityApplyEntity(StudentActivityApplyEntity entity){
        insert(entity);
        return entity;
    }
    public StudentActivityApplyEntity updateStudentActivityApplyEntity(StudentActivityApplyEntity entity){
        update(entity);
        return entity;
    }
    public List<StudentActivityApplyEntity> getTodoApplyListByIdentityType(int begin, int number, int identityType) {
	return select().add(Restrictions.and(Restrictions.eq("identityType", identityType) , Restrictions.eq("identityStatus", StudentActivityApplyEntity.IDENTITY_STATUS_TODO),Restrictions.eq("applyStatus",StudentActivityApplyEntity.APPLY_STATUS_CONFIRMED)))
		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).addOrder(Order.desc("confirmDate")).setFirstResult(begin).setMaxResults(number).list();
    }

    public int getTodoApplyCountByIdentityType(int identityType) {
	Object r = select().add(Restrictions.and(Restrictions.eq("identityType", identityType), 
		Restrictions.eq("identityStatus", StudentActivityApplyEntity.IDENTITY_STATUS_TODO)))
		.setProjection(Projections.rowCount()).uniqueResult();
	return ((Long) r).intValue();
    }

    public List<StudentActivityApplyEntity> getPastApplyListByIdentityType(int begin, int number, int identityType) {
	return select().add(Restrictions.and(Restrictions.eq("identityType", identityType), Restrictions.or(
		Restrictions.eq("identityStatus", StudentActivityApplyEntity.IDENTITY_STATUS_ACCEPTED), Restrictions.eq("identityStatus", StudentActivityApplyEntity.IDENTITY_STATUS_REJECTED))))
		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).addOrder(Order.desc("identityDate")).setFirstResult(begin).setMaxResults(number).list();
    }

    public int getPastApplyCountByIdentityType(int identityType) {
	Object r = select().add(Restrictions.and(Restrictions.eq("identityType", identityType), Restrictions.or(
		Restrictions.eq("identityStatus", StudentActivityApplyEntity.IDENTITY_STATUS_ACCEPTED), Restrictions.eq("identityStatus", StudentActivityApplyEntity.IDENTITY_STATUS_REJECTED))))
		.setProjection(Projections.rowCount()).uniqueResult();
	return ((Long) r).intValue();
    }

    public List<StudentActivityApplyEntity> getTodoApplyListByResourceType(int begin, int number, int resourceType) {
	return select().add(Restrictions.and(Restrictions.eq("resourceType", resourceType),Restrictions.eq("resourceStatus", StudentActivityApplyEntity.RESOURCE_STATUS_TODO)))
		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).addOrder(Order.desc("resourceDate")).setFirstResult(begin).setMaxResults(number).list();
    }

    public int getTodoApplyCountByResourceType(int resourceType) {
	Object r = select().add(Restrictions.and(Restrictions.eq("resourceType", resourceType),Restrictions.eq("resourceStatus", StudentActivityApplyEntity.RESOURCE_STATUS_TODO)))
		.setProjection(Projections.rowCount()).uniqueResult();
	return ((Long) r).intValue();
    }

    public List<StudentActivityApplyEntity> getPastApplyListByResourceType(int begin, int number, int resourceType) {
	return select().add(Restrictions.and(Restrictions.eq("resourceType", resourceType), Restrictions.or(
		Restrictions.eq("resourceStatus", StudentActivityApplyEntity.RESOURCE_STATUS_ACCEPTED), Restrictions.eq("resourceStatus", StudentActivityApplyEntity.RESOURCE_STATUS_REJECTED))))
		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).addOrder(Order.desc("resourceDate")).setFirstResult(begin).setMaxResults(number).list();
    }

    public int getPastApplyCountByResourceType(int resourceType) {
	Object r = select().add(Restrictions.and(Restrictions.eq("resourceType", resourceType), Restrictions.or(
		Restrictions.eq("resourceStatus", StudentActivityApplyEntity.RESOURCE_STATUS_ACCEPTED), Restrictions.eq("resourceStatus", StudentActivityApplyEntity.RESOURCE_STATUS_REJECTED))))
		.setProjection(Projections.rowCount()).uniqueResult();
	return ((Long) r).intValue();
    }
    
    public List<StudentActivityApplyEntity> getTodoApplyListByGroupType(int begin, int number, int groupType) {
	return select().add(Restrictions.and(Restrictions.eq("groupType", groupType) , Restrictions.eq("groupStatus", StudentActivityApplyEntity.GROUP_STATUS_TODO)))
		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).addOrder(Order.desc("confirmDate")).setFirstResult(begin).setMaxResults(number).list();
    }

    public int getTodoApplyCountByGroupType(int groupType) {
	Object r = select().add(Restrictions.and(Restrictions.eq("groupType", groupType), 
		Restrictions.eq("groupStatus", StudentActivityApplyEntity.GROUP_STATUS_TODO)))
		.setProjection(Projections.rowCount()).uniqueResult();
	return ((Long) r).intValue();
    }

    public List<StudentActivityApplyEntity> getPastApplyListByGroupType(int begin, int number, int groupType) {
	return select().add(Restrictions.and(Restrictions.eq("groupType", groupType), Restrictions.or(
		Restrictions.eq("groupStatus", StudentActivityApplyEntity.GROUP_STATUS_ACCEPTED), Restrictions.eq("groupStatus", StudentActivityApplyEntity.GROUP_STATUS_REJECTED))))
		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).addOrder(Order.desc("groupDate")).setFirstResult(begin).setMaxResults(number).list();
    }

    public int getPastApplyCountByGroupType(int groupType) {
	Object r = select().add(Restrictions.and(Restrictions.eq("groupType", groupType), Restrictions.or(
		Restrictions.eq("groupStatus", StudentActivityApplyEntity.GROUP_STATUS_ACCEPTED), Restrictions.eq("groupStatus", StudentActivityApplyEntity.GROUP_STATUS_REJECTED))))
		.setProjection(Projections.rowCount()).uniqueResult();
	return ((Long) r).intValue();
    }
    
    public List<StudentActivityApplyEntity> getTodoApplyListByPublishType(int begin, int number, int publishType) {
	return select().add(Restrictions.and(Restrictions.eq("publishType", publishType) , Restrictions.eq("publishStatus", StudentActivityApplyEntity.PUBLISH_STATUS_TODO)))
		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).addOrder(Order.desc("confirmDate")).setFirstResult(begin).setMaxResults(number).list();
    }

    public int getTodoApplyCountByPublishType(int publishType) {
	Object r = select().add(Restrictions.and(Restrictions.eq("publishType", publishType), 
		Restrictions.eq("publishStatus", StudentActivityApplyEntity.PUBLISH_STATUS_TODO)))
		.setProjection(Projections.rowCount()).uniqueResult();
	return ((Long) r).intValue();
    }

    public List<StudentActivityApplyEntity> getPastApplyListByPublishType(int begin, int number, int publishType) {
	return select().add(Restrictions.and(Restrictions.eq("publishType", publishType), Restrictions.or(
		Restrictions.eq("publishStatus", StudentActivityApplyEntity.PUBLISH_STATUS_ACCEPTED), Restrictions.eq("publishStatus", StudentActivityApplyEntity.PUBLISH_STATUS_REJECTED))))
		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).addOrder(Order.desc("publishDate")).setFirstResult(begin).setMaxResults(number).list();
    }

    public int getPastApplyCountByPublishType(int publishType) {
	Object r = select().add(Restrictions.and(Restrictions.eq("publishType", publishType), Restrictions.or(
		Restrictions.eq("publishStatus", StudentActivityApplyEntity.PUBLISH_STATUS_ACCEPTED), Restrictions.eq("publishStatus", StudentActivityApplyEntity.PUBLISH_STATUS_REJECTED))))
		.setProjection(Projections.rowCount()).uniqueResult();
	return ((Long) r).intValue();
    }
    
    public List<StudentActivityApplyEntity> getAcceptedPublicActivities(int begin, int number, int activityType, int digest){
        Criteria temp =  select().createAlias("option", "a").add(Restrictions.and(Restrictions.eq("a.publicityFlag", StudentApplyOptionsEntity.PUBLICITYFLAG_APPLY), 
                 Restrictions.eq("applyStatus", StudentActivityApplyEntity.APPLY_STATUS_ACCEPTED),
                 Restrictions.eq("publishStatus", StudentActivityApplyEntity.PUBLISH_STATUS_ACCEPTED)));
        if(activityType != 0){
            temp.add(Restrictions.eq("activityType", activityType));
        }
        if(digest != 0){
            temp.add(Restrictions.eq("a.digestFlag", digest));
        }
        List<StudentActivityApplyEntity> list = temp.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).addOrder(Order.desc("activityDate")).setFirstResult(begin).setMaxResults(number).list();
        return list;
        
//        List<StudentActivityApplyEntity> list = select().createAlias("option", "a").add(
//                 Restrictions.and(Restrictions.eq("a.publicityFlag", StudentApplyOptionsEntity.PUBLICITYFLAG_APPLY), 
//                 Restrictions.eq("applyStatus", StudentActivityApplyEntity.APPLY_STATUS_ACCEPTED),
//                 Restrictions.eq("publishStatus", StudentActivityApplyEntity.PUBLISH_STATUS_ACCEPTED))).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).addOrder(Order.desc("activityDate")).setFirstResult(begin).setMaxResults(number).list();       
//	return list;
    }
    public int getAcceptedPublicActivitiesCount(int activityType, int digest){
        Criteria temp = select().createAlias("option", "a").add(
                 Restrictions.and(Restrictions.eq("a.publicityFlag", StudentApplyOptionsEntity.PUBLICITYFLAG_APPLY), 
                 Restrictions.eq("applyStatus", StudentActivityApplyEntity.APPLY_STATUS_ACCEPTED), 
                 Restrictions.eq("publishStatus", StudentActivityApplyEntity.PUBLISH_STATUS_ACCEPTED)));
        if(activityType != 0){
            temp.add(Restrictions.eq("activityType", activityType));
        }
        if(digest != 0){
            temp.add(Restrictions.eq("a.digestFlag", digest));
        }
        Object r = temp.setProjection(Projections.rowCount()).uniqueResult();
//        Object r = select().createAlias("option", "a").add(
//                 Restrictions.and(Restrictions.eq("a.publicityFlag", StudentApplyOptionsEntity.PUBLICITYFLAG_APPLY), 
//                 Restrictions.eq("applyStatus", StudentActivityApplyEntity.APPLY_STATUS_ACCEPTED), 
//                 Restrictions.eq("publishStatus", StudentActivityApplyEntity.PUBLISH_STATUS_ACCEPTED))).setProjection(Projections.rowCount()).uniqueResult();
        return ((Long) r).intValue();
    }
    public List<StudentActivityApplyEntity> getAcceptedPublicActivitiesByDate(int begin, int number, int activityType, int digest, Date date){
        Criteria temp =  select().createAlias("option", "a").add(Restrictions.and(Restrictions.eq("a.publicityFlag", StudentApplyOptionsEntity.PUBLICITYFLAG_APPLY), 
                 Restrictions.eq("applyStatus", StudentActivityApplyEntity.APPLY_STATUS_ACCEPTED),
                 Restrictions.eq("publishStatus", StudentActivityApplyEntity.PUBLISH_STATUS_ACCEPTED)));
        if(activityType != 0){
            temp.add(Restrictions.eq("activityType", activityType));
        }
        if(digest != 0){
            temp.add(Restrictions.eq("a.digestFlag", digest));
        }
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        Date fromDate = calendar.getTime();

        calendar.set(Calendar.HOUR_OF_DAY, 23);
        calendar.set(Calendar.MINUTE, 59);
        calendar.set(Calendar.SECOND, 59);
        Date toDate = calendar.getTime();
        
        temp.add(Restrictions.between("activityDate", fromDate, toDate));
        List<StudentActivityApplyEntity> list = temp.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).addOrder(Order.desc("activityDate")).setFirstResult(begin).setMaxResults(number).list();
        return list;
    }
    public int getAcceptedPublicActivitiesCountByDate(int activityType, int digest, Date date){
        Criteria temp = select().createAlias("option", "a").add(
                 Restrictions.and(Restrictions.eq("a.publicityFlag", StudentApplyOptionsEntity.PUBLICITYFLAG_APPLY), 
                 Restrictions.eq("applyStatus", StudentActivityApplyEntity.APPLY_STATUS_ACCEPTED), 
                 Restrictions.eq("publishStatus", StudentActivityApplyEntity.PUBLISH_STATUS_ACCEPTED)));
        if(activityType != 0){
            temp.add(Restrictions.eq("activityType", activityType));
        }
        if(digest != 0){
            temp.add(Restrictions.eq("a.digestFlag", digest));
        }
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        Date fromDate = calendar.getTime();

        calendar.set(Calendar.HOUR_OF_DAY, 23);
        calendar.set(Calendar.MINUTE, 59);
        calendar.set(Calendar.SECOND, 59);
        Date toDate = calendar.getTime();
        
        temp.add(Restrictions.between("activityDate", fromDate, toDate));
        Object r = temp.setProjection(Projections.rowCount()).uniqueResult();
//        Object r = select().createAlias("option", "a").add(
//                 Restrictions.and(Restrictions.eq("a.publicityFlag", StudentApplyOptionsEntity.PUBLICITYFLAG_APPLY), 
//                 Restrictions.eq("applyStatus", StudentActivityApplyEntity.APPLY_STATUS_ACCEPTED), 
//                 Restrictions.eq("publishStatus", StudentActivityApplyEntity.PUBLISH_STATUS_ACCEPTED))).setProjection(Projections.rowCount()).uniqueResult();
        return ((Long) r).intValue();
    }
    public List<StudentActivityApplyEntity> getAcceptedPublicActivitiesByApplyUserid(int begin, int number, int userID){
         List<StudentActivityApplyEntity> list = select().createAlias("option", "a").add(
                 Restrictions.and(Restrictions.eq("a.publicityFlag", StudentApplyOptionsEntity.PUBLICITYFLAG_APPLY), 
                 Restrictions.eq("applyStatus", StudentActivityApplyEntity.APPLY_STATUS_ACCEPTED),
                 Restrictions.eq("publishStatus", StudentActivityApplyEntity.PUBLISH_STATUS_ACCEPTED),
                 Restrictions.eq("applyUserid",userID))).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).addOrder(Order.desc("activityDate")).setFirstResult(begin).setMaxResults(number).list();       
	return list;
    }
    public int getAcceptedPublicActivitiesCountByApplyUserid(int userID){
        Object r = select().createAlias("option", "a").add(
                 Restrictions.and(Restrictions.eq("a.publicityFlag", StudentApplyOptionsEntity.PUBLICITYFLAG_APPLY), 
                 Restrictions.eq("applyStatus", StudentActivityApplyEntity.APPLY_STATUS_ACCEPTED),
                 Restrictions.eq("publishStatus", StudentActivityApplyEntity.PUBLISH_STATUS_ACCEPTED),
                 Restrictions.eq("applyUserid", userID))).setProjection(Projections.rowCount()).uniqueResult();
        return ((Long) r).intValue();
    }
    public List<StudentActivityApplyEntity> getAllAcceptedPublicActivitiesByApplyGroupid(int userID){
         List<StudentActivityApplyEntity> list = select().createAlias("option", "a").add(
                 Restrictions.and(Restrictions.eq("a.publicityFlag", StudentApplyOptionsEntity.PUBLICITYFLAG_APPLY), 
                 Restrictions.eq("applyStatus", StudentActivityApplyEntity.APPLY_STATUS_ACCEPTED),
                 Restrictions.eq("publishStatus", StudentActivityApplyEntity.PUBLISH_STATUS_ACCEPTED),
                 Restrictions.eq("applyUserid",userID))).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).addOrder(Order.desc("activityDate")).list();       
	return list;
    }
    
    public List<StudentActivityApplyEntity> getAcceptedPublicActivitiesByActivityType(int begin, int number, int activityType){
         List<StudentActivityApplyEntity> list = select().createAlias("option", "a").add(
                 Restrictions.and(Restrictions.eq("a.publicityFlag", StudentApplyOptionsEntity.PUBLICITYFLAG_APPLY), 
                 Restrictions.eq("applyStatus", StudentActivityApplyEntity.APPLY_STATUS_ACCEPTED),
                 Restrictions.eq("publishStatus", StudentActivityApplyEntity.PUBLISH_STATUS_ACCEPTED),
                 Restrictions.eq("activityType", activityType))).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).addOrder(Order.desc("activityDate")).setFirstResult(begin).setMaxResults(number).list();       
	return list;
    }
    public int getAcceptedPublicActivitiesCountByActivityType(int activityType){
        Object r = select().createAlias("option", "a").add(
                 Restrictions.and(Restrictions.eq("a.publicityFlag", StudentApplyOptionsEntity.PUBLICITYFLAG_APPLY), 
                 Restrictions.eq("applyStatus", StudentActivityApplyEntity.APPLY_STATUS_ACCEPTED),
                 Restrictions.eq("publishStatus", StudentActivityApplyEntity.PUBLISH_STATUS_ACCEPTED),
                 Restrictions.eq("activityType", activityType))).setProjection(Projections.rowCount()).uniqueResult();
        return ((Long) r).intValue();
    }
    /*
      public List<StudentActivityApplyEntity> getAcceptedActivitiesByContent( String keywords){
        List<StudentActivityApplyEntity> list = select().add(Restrictions.and( 
                 Restrictions.eq("applyStatus", StudentActivityApplyEntity.APPLY_STATUS_ACCEPTED),(Restrictions.or(
                  Restrictions.like("activityContent", keywords,MatchMode.ANYWHERE),
                 Restrictions.like("activityTheme", keywords,MatchMode.ANYWHERE)))))
                 .setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).addOrder(Order.desc("activityDate")).list();  
         return list;
	
    }*/
        public List<StudentActivityApplyEntity> getAcceptedActivitiesByContent(int begin, int number, String keywords){
        List<StudentActivityApplyEntity> list = select().createAlias("option", "a").add(Restrictions.and( 
                 Restrictions.eq("a.publicityFlag", StudentApplyOptionsEntity.PUBLICITYFLAG_APPLY),
                  Restrictions.eq("publishStatus", StudentActivityApplyEntity.PUBLISH_STATUS_ACCEPTED),
                 Restrictions.eq("applyStatus", StudentActivityApplyEntity.APPLY_STATUS_ACCEPTED),(Restrictions.or(
                  Restrictions.like("a.publicityMaterials", keywords,MatchMode.ANYWHERE),
                 Restrictions.like("activityTheme", keywords,MatchMode.ANYWHERE),
                 Restrictions.like("organizerName", keywords, MatchMode.ANYWHERE)))))
                 .setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).addOrder(Order.desc("activityDate"))
                .setFirstResult(begin).setMaxResults(number).list();  
         return list;
	
    }
     public int getAcceptedActivitiesCountByContent( String keywords){
         
         Object r = select().createAlias("option", "a").add(Restrictions.and( 
                  Restrictions.eq("a.publicityFlag", StudentApplyOptionsEntity.PUBLICITYFLAG_APPLY),
                   Restrictions.eq("publishStatus", StudentActivityApplyEntity.PUBLISH_STATUS_ACCEPTED),
                 Restrictions.eq("applyStatus", StudentActivityApplyEntity.APPLY_STATUS_ACCEPTED),(Restrictions.or(
                  Restrictions.like("a.publicityMaterials", keywords,MatchMode.ANYWHERE),
                 Restrictions.like("activityTheme", keywords,MatchMode.ANYWHERE),
                 Restrictions.like("organizerName", keywords,MatchMode.ANYWHERE)))))
                 .setProjection(Projections.rowCount()).uniqueResult();
         return ((Long)r).intValue();
     }
        public List<StudentActivityApplyEntity> getPastPublicApplyByContent(int begin, int number, String searchKeywords, int[] searchStatus) {
 
        Criteria temp = select().createAlias("option", "a").add(Restrictions.and(
        Restrictions.eq("applyStatus", StudentActivityApplyEntity.APPLY_STATUS_ACCEPTED),
        Restrictions.or(Restrictions.like("a.publicityMaterials", searchKeywords,MatchMode.ANYWHERE),
                Restrictions.like("activityTheme", searchKeywords,MatchMode.ANYWHERE),
                Restrictions.like("organizerName", searchKeywords, MatchMode.ANYWHERE))));
        if(searchStatus[0] == 1) {
            temp = temp.add(Restrictions.eq("a.externalFlag",StudentApplyOptionsEntity.EXTERNAL_APPLY ));   
        }
        if(searchStatus[1] == 1) {
            temp = temp.add(Restrictions.eq("a.overseasFlag",StudentApplyOptionsEntity.OVERSEAS_APPLY ));   
        }
        if(searchStatus[2] == 1) {
            temp = temp.add(Restrictions.eq("a.croomFlag",StudentApplyOptionsEntity.CROOMFLAG_APPLY ));   
        }
        if(searchStatus[3] == 1) {
            temp = temp.add(Restrictions.eq("a.LEDFlag",StudentApplyOptionsEntity.LEDFLAG_APPLY ));   
        }
        if(searchStatus[4] == 1) {
            temp = temp.add(Restrictions.eq("a.outsideFlag",StudentApplyOptionsEntity.OUTSIDEFLAG_APPLY));   
        }
        if(searchStatus[5] == 1) {
            temp = temp.add(Restrictions.eq("a.boardFlag",StudentApplyOptionsEntity.BOARDFLAG_APPLY ));   
        }
        if(searchStatus[6] == 1) {
            temp = temp.add(Restrictions.eq("a.publicityFlag",StudentApplyOptionsEntity.PUBLICITYFLAG_APPLY ));   
        }
         if(searchStatus[7] == 1) {
            temp = temp.add(Restrictions.eq("a.ticketFlag",StudentApplyOptionsEntity.TICKETFLAG_APPLY ));   
        }
       
        return temp.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).addOrder(Order.desc("activityDate")).setFirstResult(begin).setMaxResults(number).list();
    }

    public int getPastPublicApplyCountByContent(String searchKeywords, int[] searchStatus) {
        Criteria temp = select().createAlias("option", "a").add(Restrictions.and(
        Restrictions.eq("applyStatus", StudentActivityApplyEntity.APPLY_STATUS_ACCEPTED),
        Restrictions.or(Restrictions.like("a.publicityMaterials", searchKeywords,MatchMode.ANYWHERE),
                Restrictions.like("activityTheme", searchKeywords,MatchMode.ANYWHERE),
                Restrictions.like("organizerName", searchKeywords, MatchMode.ANYWHERE))));
        if(searchStatus[0] == 1) {
            temp = temp.add(Restrictions.eq("a.externalFlag",StudentApplyOptionsEntity.EXTERNAL_APPLY ));
        }
         if(searchStatus[1] == 1) {
            temp = temp.add(Restrictions.eq("a.overseasFlag",StudentApplyOptionsEntity.OVERSEAS_APPLY ));   
        }
        if(searchStatus[2] == 1) {
            temp = temp.add(Restrictions.eq("a.croomFlag",StudentApplyOptionsEntity.CROOMFLAG_APPLY ));   
        }
        if(searchStatus[3] == 1) {
            temp = temp.add(Restrictions.eq("a.LEDFlag",StudentApplyOptionsEntity.LEDFLAG_APPLY ));   
        }
        if(searchStatus[4] == 1) {
            temp = temp.add(Restrictions.eq("a.outsideFlag",StudentApplyOptionsEntity.OUTSIDEFLAG_APPLY));   
        }
        if(searchStatus[5] == 1) {
            temp = temp.add(Restrictions.eq("a.boardFlag",StudentApplyOptionsEntity.BOARDFLAG_APPLY ));   
        }
        if(searchStatus[6] == 1) {
            temp = temp.add(Restrictions.eq("a.publicityFlag",StudentApplyOptionsEntity.PUBLICITYFLAG_APPLY ));   
        }
         if(searchStatus[7] == 1) {
            temp = temp.add(Restrictions.eq("a.ticketFlag",StudentApplyOptionsEntity.TICKETFLAG_APPLY ));   
        }
        Object r  = temp.setProjection(Projections.rowCount()).uniqueResult();
	return ((Long) r).intValue();
    }
     
       public List<StudentActivityApplyEntity> getAcceptedActivitiesByContentAndType(int begin, int number, String keywords, int activityType){
        List<StudentActivityApplyEntity> list = select().createAlias("option", "a").add(Restrictions.and( 
                Restrictions.eq("a.publicityFlag", StudentApplyOptionsEntity.PUBLICITYFLAG_APPLY),
                 Restrictions.eq("publishStatus", StudentActivityApplyEntity.PUBLISH_STATUS_ACCEPTED),
                 Restrictions.eq("applyStatus", StudentActivityApplyEntity.APPLY_STATUS_ACCEPTED),
                 Restrictions.eq("activityType", activityType),
                 (Restrictions.or(
                  Restrictions.like("activityContent", keywords,MatchMode.ANYWHERE),
                 Restrictions.like("activityTheme", keywords,MatchMode.ANYWHERE),
                 Restrictions.like("organizerName", keywords, MatchMode.ANYWHERE)))))
                 .setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).addOrder(Order.desc("activityDate"))
                .setFirstResult(begin).setMaxResults(number).list();  
         return list;
                
    }
       public int getAcceptedActivitiesCountByContentAndType( String keywords, int activityType){
         Object r = select().createAlias("option", "a").add(Restrictions.and( 
                 Restrictions.eq("a.publicityFlag", StudentApplyOptionsEntity.PUBLICITYFLAG_APPLY),
                 
                 Restrictions.eq("publishStatus", StudentActivityApplyEntity.PUBLISH_STATUS_ACCEPTED),
                 Restrictions.eq("applyStatus", StudentActivityApplyEntity.APPLY_STATUS_ACCEPTED),
                 Restrictions.eq("activityType", activityType),
                 (Restrictions.or(
                  Restrictions.like("activityContent", keywords,MatchMode.ANYWHERE),
                 Restrictions.like("activityTheme", keywords,MatchMode.ANYWHERE),
                 Restrictions.like("organizerName", keywords, MatchMode.ANYWHERE)))))
                 .setProjection(Projections.rowCount()).uniqueResult();
         return ((Long)r).intValue();
     }
       public List<StudentActivityApplyEntity> getApprovedApplyList(int begin, int number){
           List<StudentActivityApplyEntity> list = select().add(Restrictions.eq("applyStatus",StudentActivityApplyEntity.APPLY_STATUS_ACCEPTED))
                   .setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).addOrder(Order.desc("activityDate")).setFirstResult(begin).setMaxResults(number).list();
           return list;
       }
       
       public int getApprovedApplyCount(){
           Object r = select().add(Restrictions.eq("applyStatus",StudentActivityApplyEntity.APPLY_STATUS_ACCEPTED))
                   .setProjection(Projections.rowCount()).uniqueResult();
        return ((Long) r).intValue();
       }
       
       public List<StudentActivityApplyEntity> getDigestActivityList(int begin, int number){
           List<StudentActivityApplyEntity> list = select().createAlias("option", "a").add(
                 Restrictions.and(Restrictions.eq("a.publicityFlag", StudentApplyOptionsEntity.PUBLICITYFLAG_APPLY), 
                 Restrictions.eq("applyStatus", StudentActivityApplyEntity.APPLY_STATUS_ACCEPTED),
                 Restrictions.eq("publishStatus", StudentActivityApplyEntity.PUBLISH_STATUS_ACCEPTED),
                 Restrictions.eq("a.digestFlag", StudentApplyOptionsEntity.DIGEST_ACTIVITY))).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).addOrder(Order.desc("activityDate")).setFirstResult(begin).setMaxResults(number).list();       
            return list;
       }
       public int getDigestActivityCount(){
           Object r = select().createAlias("option", "a").add(
                 Restrictions.and(Restrictions.eq("a.publicityFlag", StudentApplyOptionsEntity.PUBLICITYFLAG_APPLY), 
                 Restrictions.eq("applyStatus", StudentActivityApplyEntity.APPLY_STATUS_ACCEPTED), 
                 Restrictions.eq("publishStatus", StudentActivityApplyEntity.PUBLISH_STATUS_ACCEPTED),
                 Restrictions.eq("a.digestFlag", StudentApplyOptionsEntity.DIGEST_ACTIVITY))).setProjection(Projections.rowCount()).uniqueResult();
            return ((Long) r).intValue();
       }
}
