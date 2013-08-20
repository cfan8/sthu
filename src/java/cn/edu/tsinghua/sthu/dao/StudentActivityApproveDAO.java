/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.dao;

import cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity;
import cn.edu.tsinghua.sthu.entity.StudentActivityApproveEntity;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author user
 */
public class StudentActivityApproveDAO extends BaseDAO<StudentActivityApproveEntity>{
    public StudentActivityApproveDAO(){
        super(StudentActivityApproveEntity.class);
    }
    public List<StudentActivityApproveEntity> getApproveEntitiesByApplyId(int applyId){
        return select().add(Restrictions.eq("applyId", applyId)).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
    }
    public List<StudentActivityApproveEntity> getApproveEntitiesByApplyIdAndApproveStep(int applyId, int approveStep){
        return select().add(Restrictions.and(Restrictions.eq("applyId", applyId), Restrictions.eq("approveStep", approveStep))).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
    }
    public StudentActivityApproveEntity saveStudentActivityApproveEntity(StudentActivityApproveEntity entity){
        insert(entity);
        return entity;
    }
    public void deleteApproveEntity(StudentActivityApproveEntity entity){
        delete(entity);
    }
    public StudentActivityApproveEntity updateStudentActivityApproveEntity(StudentActivityApproveEntity entity){
        update(entity);
        return entity;
    }
    public List<StudentActivityApproveEntity> getTodoApplyListByResourceType(int begin, int number, int resourceType) {
	return select().add(Restrictions.and(Restrictions.eq("approveType", resourceType),Restrictions.eq("approveStatus", StudentActivityApplyEntity.RESOURCE_STATUS_TODO), Restrictions.eq("approveStep", StudentActivityApproveEntity.APPROVE_STEP_RESOURCE)))
		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).addOrder(Order.desc("approveDate")).setFirstResult(begin).setMaxResults(number).list();
    }

    public int getTodoApplyCountByResourceType(int resourceType) {
	Object r = select().add(Restrictions.and(Restrictions.eq("approveType", resourceType),Restrictions.eq("approveStatus", StudentActivityApplyEntity.RESOURCE_STATUS_TODO), Restrictions.eq("approveStep", StudentActivityApproveEntity.APPROVE_STEP_RESOURCE)))
		.setProjection(Projections.rowCount()).uniqueResult();
	return ((Long) r).intValue();
    }

    public List<StudentActivityApproveEntity> getPastApplyListByResourceType(int begin, int number, int resourceType) {
	return select().add(Restrictions.and(Restrictions.eq("approveType", resourceType), Restrictions.or(
		Restrictions.eq("approveStatus", StudentActivityApplyEntity.RESOURCE_STATUS_ACCEPTED), Restrictions.eq("approveStatus", StudentActivityApplyEntity.RESOURCE_STATUS_REJECTED)), Restrictions.eq("approveStep", StudentActivityApproveEntity.APPROVE_STEP_RESOURCE)))
		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).addOrder(Order.desc("approveDate")).setFirstResult(begin).setMaxResults(number).list();
    }

    public int getPastApplyCountByResourceType(int resourceType) {
	Object r = select().add(Restrictions.and(Restrictions.eq("approveType", resourceType), Restrictions.or(
		Restrictions.eq("approveStatus", StudentActivityApplyEntity.RESOURCE_STATUS_ACCEPTED), Restrictions.eq("approveStatus", StudentActivityApplyEntity.RESOURCE_STATUS_REJECTED)), Restrictions.eq("approveStep", StudentActivityApproveEntity.APPROVE_STEP_RESOURCE)))
		.setProjection(Projections.rowCount()).uniqueResult();
	return ((Long) r).intValue();
    }
    
    public List<StudentActivityApproveEntity> getTodoApplyListByAllocateType(int begin, int number, int allocateType) {
	return select().add(Restrictions.and(Restrictions.eq("approveType", allocateType),Restrictions.eq("approveStatus", StudentActivityApplyEntity.ALLOCATE_STATUS_TODO), Restrictions.eq("approveStep", StudentActivityApproveEntity.APPROVE_STEP_ALLOCATE)))
		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).addOrder(Order.desc("approveDate")).setFirstResult(begin).setMaxResults(number).list();
    }

    public int getTodoApplyCountByAllocateType(int allocateType) {
	Object r = select().add(Restrictions.and(Restrictions.eq("approveType", allocateType),Restrictions.eq("approveStatus", StudentActivityApplyEntity.ALLOCATE_STATUS_TODO), Restrictions.eq("approveStep", StudentActivityApproveEntity.APPROVE_STEP_ALLOCATE)))
		.setProjection(Projections.rowCount()).uniqueResult();
	return ((Long) r).intValue();
    }

    public List<StudentActivityApproveEntity> getPastApplyListByAllocateType(int begin, int number, int allocateType) {
	return select().add(Restrictions.and(Restrictions.eq("approveType", allocateType), Restrictions.or(
		Restrictions.eq("approveStatus", StudentActivityApplyEntity.ALLOCATE_STATUS_ACCEPTED), Restrictions.eq("approveStatus", StudentActivityApplyEntity.ALLOCATE_STATUS_REJECTED)), Restrictions.eq("approveStep", StudentActivityApproveEntity.APPROVE_STEP_ALLOCATE)))
		.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).addOrder(Order.desc("approveDate")).setFirstResult(begin).setMaxResults(number).list();
    }

    public int getPastApplyCountByAllocateType(int allocateType) {
	Object r = select().add(Restrictions.and(Restrictions.eq("approveType", allocateType), Restrictions.or(
		Restrictions.eq("approveStatus", StudentActivityApplyEntity.ALLOCATE_STATUS_ACCEPTED), Restrictions.eq("approveStatus", StudentActivityApplyEntity.ALLOCATE_STATUS_REJECTED)), Restrictions.eq("approveStep", StudentActivityApproveEntity.APPROVE_STEP_ALLOCATE)))
		.setProjection(Projections.rowCount()).uniqueResult();
	return ((Long) r).intValue();
    }
    
}
