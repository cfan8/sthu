/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.dao;

import cn.edu.tsinghua.sthu.entity.ColumnEntity;
import cn.edu.tsinghua.sthu.entity.NewEntity;
import cn.edu.tsinghua.sthu.entity.UserEntity;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;


/**
 *
 * @author wuhz
 */
public class ColumnDAO extends BaseDAO<ColumnEntity>
{
    public ColumnDAO()
    {
        super(ColumnEntity.class);
    }
    
    public static ColumnEntity getColumnEntityInstance(String name, String description, boolean visible, boolean showInHomePage)
    {
        ColumnEntity entity = new ColumnEntity(name, description, visible, showInHomePage);
        return entity;
    }
    
    public ColumnEntity addColumn(String name, String description, boolean visible, boolean showInHomePage)
    {
        ColumnEntity entity = getColumnEntityInstance(name, description, visible, showInHomePage);
        insert(entity);
        return entity;
    }
    
    public List<String> selectColumnName()
    {
        String hql = "select name from ColumnEntity";
        Query query = getCurrentSession().createQuery(hql);
        return query.list();
    }
    
    public List<ColumnEntity> selectAllColumn()
    {
        return select().list();
    }
    
    public List<ColumnEntity> selectColumnsVisibleForUser()
    {
        Criteria criteria = select();
        criteria.add(Restrictions.eq("isVisibleForUser", true));
        return criteria.list();
    }
    
    public List<ColumnEntity> selectColumnsVisibleForUser(int startIndex, int endIndex)
    {
        Criteria criteria = select();
        criteria.add(Restrictions.eq("isVisibleForUser", true));
        criteria.setFirstResult(startIndex);
        criteria.setMaxResults(endIndex - startIndex + 1);
        return (List<ColumnEntity>) criteria.list();
    }
    
    public List<ColumnEntity> selectColumn(int startIndex, int endIndex)
    {
        Criteria criteria = select();
        criteria.setFirstResult(startIndex);
        criteria.setMaxResults(endIndex - startIndex + 1);
        return (List<ColumnEntity>) criteria.list();
    }
    
    public int getColumnCount()
    {
        return select().list().size();
    }
    
    public int getVisibleColumnCount()
    {
        Criteria criteria = select();
        criteria.add(Restrictions.eq("isVisibleForUser", true));
        return criteria.list().size();
    }
    
    public ColumnEntity deleteColumn(ColumnEntity entity)
    {
        delete(entity);
        return null;
    }
    
    public ColumnEntity queryByName(String name)
    {
        List<ColumnEntity> list = select().add(Restrictions.eq("name", name)).list();
	if (list.size() == 1)
	{
	    return list.get(0);
	}
	else
	{
	    return null;
	}
    }
    
    public ColumnEntity queryById(int columnId)
    {
        return super.queryById(columnId);
    }
    
    public void updateColumn(ColumnEntity entity)
    {
        update(entity);
    }
}
