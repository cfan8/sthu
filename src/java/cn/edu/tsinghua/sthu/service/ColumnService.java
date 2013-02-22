/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.service;

import cn.edu.tsinghua.sthu.constant.Constant;
import cn.edu.tsinghua.sthu.dao.ColumnDAO;
import cn.edu.tsinghua.sthu.dao.NewDAO;
import cn.edu.tsinghua.sthu.entity.ColumnEntity;
import cn.edu.tsinghua.sthu.entity.NewEntity;
import java.util.Date;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author wuhz
 */
public class ColumnService extends BaseService
{
    private ColumnDAO columnDAO;
    private NewDAO newDAO;
    
    @Transactional
    public boolean addColumn(String name, String description, boolean isVisibleForUser, boolean isFixedInHomePage)
    {
        if (columnDAO.queryByName(name) != null)
        {
            return false;
        }
        columnDAO.addColumn(name, description, isVisibleForUser, isFixedInHomePage);
        return true;
    }
    
    @Transactional
    public int updateColumn(int id, String name, String description, boolean isVisibleForUser, boolean isFixedInHomePage)
    {
        ColumnEntity entity = columnDAO.queryById(id);
        if (entity == null)
        {
            return -1;
        }
        if (columnDAO.queryByName(name) != null && columnDAO.queryByName(name).getID() != id)
        {
            return -2;
        }
        entity.setName(name);
        entity.setDescription(description);
        entity.setIsFixedInHomePage(isFixedInHomePage);
        entity.setIsVisibleForUser(isVisibleForUser);
        columnDAO.updateColumn(entity);
        return 0;
    }
    
    @Transactional
    public List<String> getAllColumnName()
    {
        return columnDAO.selectColumnName();
    }
    
    @Transactional
    public List<ColumnEntity> getColumn(int startIndex, int endIndex)
    {
        return columnDAO.selectColumn(startIndex, endIndex);
    }
        
    @Transactional
    public int getColumnPageCount()
    {
        int count = columnDAO.getColumnCount();
        return computePage(count);
    }
    
    public int computePage(int count)
    {
        if (count % Constant.COLUMN_NUMBER_ONE_PAGE == 0)
        {
            return count/Constant.COLUMN_NUMBER_ONE_PAGE;
        }
        else
        {
            return count/Constant.COLUMN_NUMBER_ONE_PAGE + 1;
        }
    }
    
    @Transactional
    public int deleteColumn(int id)
    {
        ColumnEntity entity = columnDAO.queryById(id);
        if (entity == null)
        {
            return -1;
        }
        if (newDAO.selectAllNewsByColumn(entity).size() > 0)
        {
            return -2;
        }
        columnDAO.deleteColumn(entity);
        return 0;
    }
    
    @Transactional
    public List<ColumnEntity> getAllColumn()
    {
        return columnDAO.selectAllColumn();
    }
    
     @Transactional
    public List<ColumnEntity> getColumnsVisibleForUser()
    {
        return columnDAO.selectColumnsVisibleForUser();
    } 
    
    @Transactional
    public ColumnEntity getColumnById(int columnId)
    {
        return columnDAO.queryById(columnId);
    }
    
    @Transactional
    public ColumnEntity getColumnByName(String columnName)
    {
        return columnDAO.queryByName(columnName);
    }

    public ColumnDAO getColumnDAO() {
        return columnDAO;
    }

    public void setColumnDAO(ColumnDAO columnDAO) {
        this.columnDAO = columnDAO;
    }

    public NewDAO getNewDAO() {
        return newDAO;
    }

    public void setNewDAO(NewDAO newDAO) {
        this.newDAO = newDAO;
    }
}

