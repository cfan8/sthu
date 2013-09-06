/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.dao;

import cn.edu.tsinghua.sthu.entity.ClickCountEntity;
import java.util.Date;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author user
 */
public class ClickCountDAO extends BaseDAO<ClickCountEntity> {
    public ClickCountDAO(){
        super(ClickCountEntity.class);
    }
    public ClickCountEntity addClickCount(ClickCountEntity entity){
        insert(entity);
        return entity;
    }
    public int getClickCountByActivityId(int activityID){
        Object r = select().add(Restrictions.eq("activityID", activityID)).setProjection(Projections.rowCount()).uniqueResult();
	return ((Long) r).intValue();
    }
}
