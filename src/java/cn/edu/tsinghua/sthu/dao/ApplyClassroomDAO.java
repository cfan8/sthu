/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.dao;

import cn.edu.tsinghua.sthu.entity.CRoomApplyEntity;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author linangran
 */
public class ApplyClassroomDAO extends BaseDAO<CRoomApplyEntity> {

    public ApplyClassroomDAO() {
	super(CRoomApplyEntity.class);
    }

    public CRoomApplyEntity getCRoomApplyEntityById(int id) {
	return queryById(id);
    }

    public CRoomApplyEntity saveCRoomApplyEntity(CRoomApplyEntity entity) {
	insert(entity);
	return entity;
    }

    public CRoomApplyEntity updateCRoomApplyEntity(CRoomApplyEntity entity) {
	update(entity);
	return entity;
    }

    public List<CRoomApplyEntity> getTodoApplyListByIdentityType(int begin, int number, int identityType) {
	return select().add(Restrictions.and(Restrictions.eq("identityType", identityType) , Restrictions.eq("identityStatus", CRoomApplyEntity.IDENTITY_STATUS_TODO)))
		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).addOrder(Order.desc("confirmDate")).setFirstResult(begin).setMaxResults(number).list();
    }

    public int getTodoApplyCountByIdentityType(int identityType) {
	Object r = select().add(Restrictions.and(Restrictions.eq("identityType", identityType), 
		Restrictions.eq("identityStatus", CRoomApplyEntity.IDENTITY_STATUS_TODO)))
		.setProjection(Projections.rowCount()).uniqueResult();
	return ((Long) r).intValue();
    }

    public List<CRoomApplyEntity> getPastApplyListByIdentityType(int begin, int number, int identityType) {
	return select().add(Restrictions.and(Restrictions.eq("identityType", identityType), Restrictions.or(
		Restrictions.eq("identityStatus", CRoomApplyEntity.IDENTITY_STATUS_ACCEPTED), Restrictions.eq("identityStatus", CRoomApplyEntity.IDENTITY_STATUS_REJECTED))))
		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).addOrder(Order.desc("identityDate")).setFirstResult(begin).setMaxResults(number).list();
    }

    public int getPastApplyCountByIdentityType(int identityType) {
	Object r = select().add(Restrictions.and(Restrictions.eq("identityType", identityType), Restrictions.or(
		Restrictions.eq("identityStatus", CRoomApplyEntity.IDENTITY_STATUS_ACCEPTED), Restrictions.eq("identityStatus", CRoomApplyEntity.IDENTITY_STATUS_REJECTED))))
		.setProjection(Projections.rowCount()).uniqueResult();
	return ((Long) r).intValue();
    }

    public List<CRoomApplyEntity> getTodoApplyListByResourceType(int begin, int number, int resourceType) {
	return select().add(Restrictions.and(Restrictions.eq("resourceType", resourceType),Restrictions.eq("resourceStatus", CRoomApplyEntity.RESOURCE_STATUS_TODO)))
		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).addOrder(Order.desc("identityDate")).setFirstResult(begin).setMaxResults(number).list();
    }

    public int getTodoApplyCountByResourceType(int resourceType) {
	Object r = select().add(Restrictions.and(Restrictions.eq("resourceType", resourceType),Restrictions.eq("resourceStatus", CRoomApplyEntity.RESOURCE_STATUS_TODO)))
		.setProjection(Projections.rowCount()).uniqueResult();
	return ((Long) r).intValue();
    }

    public List<CRoomApplyEntity> getPastApplyListByResourceType(int begin, int number, int resourceType) {
	return select().add(Restrictions.and(Restrictions.eq("resourceType", resourceType), Restrictions.or(
		Restrictions.eq("resourceStatus", CRoomApplyEntity.RESOURCE_STATUS_ACCEPTED), Restrictions.eq("resourceStatus", CRoomApplyEntity.RESOURCE_STATUS_REJECTED))))
		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).addOrder(Order.desc("resourceDate")).setFirstResult(begin).setMaxResults(number).list();
    }

    public int getPastApplyCountByResourceType(int resourceType) {
	Object r = select().add(Restrictions.and(Restrictions.eq("resourceType", resourceType), Restrictions.or(
		Restrictions.eq("resourceStatus", CRoomApplyEntity.RESOURCE_STATUS_ACCEPTED), Restrictions.eq("resourceStatus", CRoomApplyEntity.RESOURCE_STATUS_REJECTED))))
		.setProjection(Projections.rowCount()).uniqueResult();
	return ((Long) r).intValue();
    }

    public List<CRoomApplyEntity> getTodoApplyListByAllocateType(int begin, int number, int allocateType) {
	return select().add(Restrictions.and(Restrictions.eq("allocateType", allocateType), Restrictions.eq("allocateStatus", CRoomApplyEntity.ALLOCATE_STATUS_TODO)))
		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).addOrder(Order.desc("resourceDate")).setFirstResult(begin).setMaxResults(number).list();
    }

    public int getTodoApplyCountByAllocateType(int allocateType) {
	Object r = select().add(Restrictions.and(Restrictions.eq("allocateType", allocateType), Restrictions.eq("allocateStatus", CRoomApplyEntity.ALLOCATE_STATUS_TODO)))
		.setProjection(Projections.rowCount()).uniqueResult();
	return ((Long) r).intValue();
    }

    public List<CRoomApplyEntity> getPastApplyListByAllocateType(int begin, int number, int allocateType) {
	return select().add(Restrictions.and(Restrictions.eq("allocateType", allocateType), Restrictions.or(
		Restrictions.eq("allocateStatus", CRoomApplyEntity.ALLOCATE_STATUS_ACCEPTED), Restrictions.eq("allocateStatus", CRoomApplyEntity.ALLOCATE_STATUS_REJECTED))))
		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).addOrder(Order.desc("allocateDate")).setFirstResult(begin).setMaxResults(number).list();
    }

    public int getPastApplyCountByAllocateType(int allocateType) {
	Object r = select().add(Restrictions.and(Restrictions.eq("allocateType", allocateType), Restrictions.or(
		Restrictions.eq("allocateStatus", CRoomApplyEntity.ALLOCATE_STATUS_ACCEPTED), Restrictions.eq("allocateStatus", CRoomApplyEntity.ALLOCATE_STATUS_REJECTED))))
		.setProjection(Projections.rowCount()).uniqueResult();
	return ((Long) r).intValue();
    }
}
