/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.dao;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import cn.edu.tsinghua.sthu.entity.CommentEntity;
import org.hibernate.criterion.Order;
/**
 *
 * @author Wang Silun
 */
public class CommentDAO extends BaseDAO<CommentEntity>{
    
    public CommentDAO(){
        super(CommentEntity.class);
    }
    
    
    public List<CommentEntity> getCommentEntityByApplyID(int applyID){
        List<CommentEntity> list = (List<CommentEntity>) select().add(Restrictions.eq("applyID", applyID)).addOrder(Order.desc("pubDate")).list();
        return  list;
    }

    
    public CommentEntity updateCommentEntity(CommentEntity entity){
        update(entity);
        return entity;
    }
    public List<CommentEntity> markAsOld(List<CommentEntity> list)
    {
	for(int i = 0; i < list.size(); i++)
	{
	    CommentEntity entity = list.get(i);
	    entity.setCommentStatus(CommentEntity.COMMENT_STATUS_OLD);
	    update(entity);
	}
	return list;
    }
    
    public void addComment(CommentEntity commentEntity)
    {
	insert(commentEntity);
    }
    
}
