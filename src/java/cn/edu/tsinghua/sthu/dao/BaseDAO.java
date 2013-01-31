/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.dao;

import java.lang.reflect.Field;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.*;
import javax.persistence.Column;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author linangran
 */
public class BaseDAO<T>
{

    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory()
    {
	return sessionFactory;
    }

    protected Session getCurrentSession()
    {
	return sessionFactory.getCurrentSession();
    }

    public void setSessionFactory(SessionFactory sessionFactory)
    {
	this.sessionFactory = sessionFactory;
    }
    private Class<T> entityClass;

    protected BaseDAO(Class<T> clazz)
    {
	this.entityClass = clazz;
    }

    protected void insert(T t)
    {
	sessionFactory.getCurrentSession().save(t);
    }

    protected Criteria select()
    {
	return sessionFactory.getCurrentSession().createCriteria(entityClass);
    }
    
    protected void delete(T t)
    {
	sessionFactory.getCurrentSession().delete(t);
    }

    protected void update(T t)
    {
	sessionFactory.getCurrentSession().update(t);
    }

    @SuppressWarnings("unchecked")
    protected T queryById(int id)
    {
	return (T) sessionFactory.getCurrentSession().get(entityClass, id);
    }

    protected List<T> queryAll()
    {
	String hql = "from " + entityClass.getSimpleName();
	return queryForList(hql, null);
    }

    @SuppressWarnings("unchecked")
    protected T queryForObject(String hql, Object[] params)
    {
	Query query = sessionFactory.getCurrentSession().createQuery(hql);
	setQueryParams(query, params);
	return (T) query.uniqueResult();
    }

    @SuppressWarnings("unchecked")
    protected T queryForTopObject(String hql, Object[] params)
    {
	Query query = sessionFactory.getCurrentSession().createQuery(hql);
	setQueryParams(query, params);
	return (T) query.setFirstResult(0).setMaxResults(1).uniqueResult();
    }

    @SuppressWarnings("unchecked")
    protected List<T> queryForList(String hql, Object[] params)
    {
	Query query = sessionFactory.getCurrentSession().createQuery(hql);
	setQueryParams(query, params);
	return query.list();
    }

    @SuppressWarnings("unchecked")
    protected List<T> queryForList(final String hql, final Object[] params,
	    final int recordNum)
    {
	Query query = sessionFactory.getCurrentSession().createQuery(hql);
	setQueryParams(query, params);
	return query.setFirstResult(0).setMaxResults(recordNum).list();
    }

    private void setQueryParams(Query query, Object[] params)
    {
	if (null == params)
	{
	    return;
	}
	for (int i = 0; i < params.length; i++)
	{
	    query.setParameter(i, params[i]);
	}
    }
}
