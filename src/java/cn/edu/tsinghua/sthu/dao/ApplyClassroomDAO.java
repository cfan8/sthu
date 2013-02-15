/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.dao;

import cn.edu.tsinghua.sthu.entity.CRoomApplyEntity;

/**
 *
 * @author linangran
 */
public class ApplyClassroomDAO extends BaseDAO<CRoomApplyEntity> {
    
    public ApplyClassroomDAO()
    {
	super(CRoomApplyEntity.class);
    }
    
    public CRoomApplyEntity getCRoomApplyEntityById(int id)
    {
	return queryById(id);
    }
    
    public CRoomApplyEntity saveCRoomApplyEntity(CRoomApplyEntity entity)
    {
	insert(entity);
	return entity;
    }
    
    public CRoomApplyEntity updateCRoomApplyEntity(CRoomApplyEntity entity)
    {
	update(entity);
	return entity;
    }
}
