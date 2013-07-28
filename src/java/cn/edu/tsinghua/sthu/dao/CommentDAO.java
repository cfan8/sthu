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
/**
 *
 * @author Wang Silun
 */
public class CommentDAO extends BaseDAO<CommentEntity>{
    
    public CommentDAO(){
        super(CommentEntity.class);
    }
    
    
    public List<CommentEntity> getCommentEntityByApplyID(int applyID){
        List<CommentEntity> list = (List<CommentEntity>) select().add(Restrictions.eq("applyIDIndex", applyID));
        return  list;
    }
    
    public List<CommentEntity> getCommentEntityByUserID(int userID){
        List<CommentEntity> list = (List<CommentEntity>) select().add(Restrictions.eq("userIDIndex", userID));
        return  list;
    }
    
    public void addComment(CommentEntity commentEntity)
    {
	insert(commentEntity);
    }
    
}
