/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.dao;

import cn.edu.tsinghua.sthu.entity.ActivityApplyEntity;
import java.util.*;
import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author luzhen
 */
public class ApplyActivityDAO extends BaseDAO<ActivityApplyEntity> {
    public ApplyActivityDAO()
    {
	super(ActivityApplyEntity.class);
    }
    
    public ActivityApplyEntity getActivityApplyEntityById(int id) {
	return queryById(id);
    }

    public ActivityApplyEntity saveActivityApplyEntity(ActivityApplyEntity entity) {
	insert(entity);
	return entity;
    }

    public ActivityApplyEntity updateActivityApplyEntity(ActivityApplyEntity entity) {
	update(entity);
	return entity;
    }
}
