/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.dao;

import cn.edu.tsinghua.sthu.entity.ColumnEntity;
import cn.edu.tsinghua.sthu.entity.NewEntity;
import cn.edu.tsinghua.sthu.message.NewManagementPageMessage;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import cn.edu.tsinghua.sthu.constant.Constant;
import cn.edu.tsinghua.sthu.Util;

/**
 *
 * @author wuhz
 */
public class NewDAO extends BaseDAO<NewEntity>
{
    private final String NewEntityDateFieldName = new String("updateTime");
    private final String NewEntityBrowseNumberFieldName = new String("browseNumber");
    private final String NewEntityIsPlacedInColumnTopFieldName = new String("isPlacedInColumnTop");
    private ColumnDAO columnDAO;
    
    public NewDAO()
    {
	super(NewEntity.class);
    }
    
    public static NewEntity getNewEntityInstance(String title, String content, String author, Date date, String redirectURL, boolean onTop, ColumnEntity columnBelong)
    {
        NewEntity entity = new NewEntity(title, content, author, date, redirectURL, onTop, columnBelong);
        return entity;
    }
    
    public NewEntity addNew(String title, String content, String author, Date date, String redirectURL, boolean onTop, ColumnEntity columnBelong)
    {
        NewEntity entity = getNewEntityInstance(title, content, author, date, redirectURL, onTop, columnBelong);
        insert(entity);
        return entity;
    }
    
    public List<NewEntity> selectAllNewsByTimeASC()
    {
        Criteria criteria = select();
        criteria.addOrder(Order.asc(NewEntityDateFieldName));
        return (List<NewEntity>) criteria.list();
    }
    
    public List<NewEntity> selectNewsOrderByBrowseNumber(ColumnEntity columnEntity)
    {
        Criteria criteria = select();
        criteria.add(Restrictions.eq("columnBelong", columnEntity));
        criteria.add(Restrictions.ge(NewEntityDateFieldName, Util.getBeforeDate(Constant.SHIFT_TIME_IN_MILLISECOND)));
        criteria.addOrder(Order.desc(NewEntityBrowseNumberFieldName));
        criteria.setMaxResults(Constant.RECOMMEND_NEW_NUMBER);
        return (List<NewEntity>) criteria.list();
    }
    
    public int getNewCount()
    {
        return select().list().size();
    }
    
    public int getNewCount(NewManagementPageMessage newManagementPageMessage)
    {
        Criteria criteria = select();
        if (setQueryParam(criteria, newManagementPageMessage) == false) return 0;
        return criteria.list().size();
    }
    
    public int getNewCountByColumn(ColumnEntity columnEntity)
    {
        return selectAllNewsByColumn(columnEntity).size();
    }
    
    public List<NewEntity> selectAllNewsByTimeDESC()
    {
        Criteria criteria = select();
        criteria.addOrder(Order.desc(NewEntityDateFieldName));
        return (List<NewEntity>) criteria.list();
    }
    
    public List<NewEntity> selectAllNewsByTimeDESC(int startIndex, int endIndex)
    {
        Criteria criteria = select();
        criteria.addOrder(Order.desc(NewEntityDateFieldName));
        criteria.setFirstResult(startIndex);
        criteria.setMaxResults(endIndex - startIndex + 1);
        return (List<NewEntity>) criteria.list();
    }
    
    public boolean setQueryParam(Criteria criteria, NewManagementPageMessage newManagementPageMessage)
    {
        if (newManagementPageMessage.getTitleFilter().length() > 0)
        {
            criteria.add(Restrictions.like("title", "%" + newManagementPageMessage.getTitleFilter() + "%"));
        }
        if (newManagementPageMessage.getAuthorFilter().length() > 0)
        {
            criteria.add(Restrictions.like("author", "%" + newManagementPageMessage.getAuthorFilter() + "%"));
        }
        if (newManagementPageMessage.getColumnBelongFilter().equals(Constant.ALL_COLUMN) == false && newManagementPageMessage.getColumnBelongFilter().length() > 0)
        {
            ColumnEntity columnEntity = columnDAO.queryByName(newManagementPageMessage.getColumnBelongFilter());
            if (columnEntity == null)
            {
                return false;
            }
            criteria.add(Restrictions.eq("columnBelong", columnEntity));
        }
        if (newManagementPageMessage.isIsPlacedInColumnTopFilter())
        {
            criteria.add(Restrictions.eq("isPlacedInColumnTop", true));
        }
        if (newManagementPageMessage.isWithRedirectURLFilter())
        {
            criteria.add(Restrictions.ne("redirectURL", ""));
        }
        return true;
    }
    
    public List<NewEntity> getAllNewsWithParam(int startIndex, int endIndex, NewManagementPageMessage newManagementPageMessage)
    {
        Criteria criteria = select();
        criteria.addOrder(Order.desc(NewEntityDateFieldName));
        criteria.setFirstResult(startIndex);
        criteria.setMaxResults(endIndex - startIndex + 1);
        if (setQueryParam(criteria, newManagementPageMessage) == false) return null;
        return (List<NewEntity>) criteria.list();
    }
    
    public List<NewEntity> getNewsByColumn(int startIndex, int endIndex, ColumnEntity columnEntity)
    {
        Criteria criteria = select();
        criteria.add(Restrictions.eq("columnBelong", columnEntity));
        criteria.addOrder(Order.desc(NewEntityIsPlacedInColumnTopFieldName));
        criteria.addOrder(Order.desc(NewEntityDateFieldName));
        criteria.setFirstResult(startIndex);
        criteria.setMaxResults(endIndex - startIndex + 1);
        return (List<NewEntity>) criteria.list();
    }
    
    public List<NewEntity> selectAllNewsByColumn(ColumnEntity entity)
    {
        Criteria criteria = select();
        criteria.add(Restrictions.eq("columnBelong", entity));
        criteria.addOrder(Order.desc(NewEntityDateFieldName));
        return (List<NewEntity>) criteria.list();
    }
    
    public NewEntity queryById(int newId)
    {
        return super.queryById(newId);
    }
    
    public NewEntity updateNew(NewEntity entity)
    {
        update(entity);
        return entity;
    }
    
    public List<NewEntity> selectAllNewOnTopByColumn(ColumnEntity entity)
    {
        Criteria criteria = select();
        criteria.add(Restrictions.eq("isPlacedInColumnTop", true));
        criteria.add(Restrictions.eq("columnBelong", entity));
        return (List<NewEntity>) criteria.list();
    }
    
    public NewEntity deleteNew(NewEntity entity)
    {
        delete(entity);
        return null;
    }
    
    public NewEntity deleteNew(int newId)
    {
        NewEntity entity = queryById(newId);
        return deleteNew(entity);
    }

    public ColumnDAO getColumnDAO() {
        return columnDAO;
    }

    public void setColumnDAO(ColumnDAO columnDAO) {
        this.columnDAO = columnDAO;
    }
}
