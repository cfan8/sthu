/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.dao;

import cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

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
	return select().add(Restrictions.and(Restrictions.eq("identityType", identityType) , Restrictions.eq("identityStatus", StudentActivityApplyEntity.IDENTITY_STATUS_TODO)))
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
		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).addOrder(Order.desc("identityDate")).setFirstResult(begin).setMaxResults(number).list();
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
}
