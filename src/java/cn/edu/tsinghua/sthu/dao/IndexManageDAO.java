/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.dao;

import cn.edu.tsinghua.sthu.entity.IndexSettingEntity;
import java.util.List;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author linangran
 */
public class IndexManageDAO extends BaseDAO<IndexSettingEntity> {
    
    public IndexManageDAO()
    {
	super(IndexSettingEntity.class);
    }
    
    public List<IndexSettingEntity> getIndexSettingEntity()
    {
	return select().list();
    }
    
    public List<IndexSettingEntity> getValidIndexSettingEntity()
    {
	return select().add(Restrictions.eq("enabled", true)).list();
    }
    
    public void updateSetting(List<IndexSettingEntity> list)
    {
	for (int i = 0; i < list.size(); i++)
	{
	    update(list.get(i));
	}
    }
    
    public void addSetting(List<IndexSettingEntity> list)
    {
	for (int i = 0; i < list.size(); i++)
	{
	    insert(list.get(i));
	}
    }
    
}
