/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.dao;

import cn.edu.tsinghua.sthu.dao.BaseDAO;
import cn.edu.tsinghua.sthu.entity.ApplyCommentEntity;
import java.util.List;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author linangran
 */
public class ApplyCommentDAO extends BaseDAO<ApplyCommentEntity> {
    
    public ApplyCommentDAO()
    {
	super(ApplyCommentEntity.class);
    }
    
    public List<ApplyCommentEntity> getCommentsByApplyId(int applyId)
    {
	return select().add(Restrictions.eq("applyId", applyId)).addOrder(Order.desc("pubDate")).list();
    }
    public ApplyCommentEntity updateApplyCommentEntity(ApplyCommentEntity entity){
        update(entity);
        return entity;
    }
    public List<ApplyCommentEntity> markAsOld(List<ApplyCommentEntity> list)
    {
	for(int i = 0; i < list.size(); i++)
	{
	    ApplyCommentEntity entity = list.get(i);
	    entity.setCommentStatus(ApplyCommentEntity.COMMENT_STATUS_OLD);
	    update(entity);
	}
	return list;
    }
    
    public void addComment(ApplyCommentEntity commentEntity)
    {
	insert(commentEntity);
    }
    
}
