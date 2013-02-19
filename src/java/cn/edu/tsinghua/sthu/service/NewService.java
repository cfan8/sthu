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
import cn.edu.tsinghua.sthu.message.NewManagementPageMessage;
import java.util.Date;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author wuhz
 */
public class NewService extends BaseService
{
    private NewDAO newDAO;
    private ColumnDAO columnDAO;
    
    @Transactional
    public boolean addNew(String title, String content, String author, Date date, String redirectURL, boolean onTop, String columnName)
    {
        ColumnEntity columnEntity = columnDAO.queryByName(columnName);
        if (columnEntity == null)
        {
            if (columnName == Constant.DEFAULT_COLUMN)
            {
                columnEntity = columnDAO.addColumn(columnName, Constant.DEFAULT_COLUMN_DESCRIPTION, false, false);
            }
            else
            {
                return false;
            }
        }
        newDAO.addNew(title, content, author, date, redirectURL, onTop, columnEntity);
        return true;
    }
    
    @Transactional
    public List<NewEntity> getAllNewsByTimeDESC()
    {
        return newDAO.selectAllNewsByTimeDESC();
    }
    
    @Transactional
    public List<NewEntity> getAllNewsByTimeDESC(int startIndex, int endIndex)
    {
        return newDAO.selectAllNewsByTimeDESC(startIndex, endIndex);
    }
    
    @Transactional
    public List<NewEntity> getAllNewsWithParam(int startIndex, int endIndex, NewManagementPageMessage newManagementPageMessage)
    {
        return newDAO.getAllNewsWithParam(startIndex, endIndex, newManagementPageMessage);
    }
    
    @Transactional
    public int getNewPageCount()
    {
        int count = newDAO.getNewCount();
        return computePage(count);
    }
    
    public int computePage(int count)
    {
        if (count % Constant.NEW_NUMBER_ONE_PAGE == 0)
        {
            return count/Constant.NEW_NUMBER_ONE_PAGE;
        }
        else
        {
            return count/Constant.NEW_NUMBER_ONE_PAGE + 1;
        }
    }
    
    @Transactional
    public int getQueryNewPageCount(NewManagementPageMessage newManagementPageMessage)
    {
        int count = newDAO.getNewCount(newManagementPageMessage);
        return computePage(count);
    }
    
    @Transactional
    public List<NewEntity> getNewsByColumn(String columnName)
    {
        ColumnEntity columnEntity = columnDAO.queryByName(columnName);
        return newDAO.selectAllNewsByColumn(columnEntity);
    }
    
    @Transactional
    public int getOnTopCountByColumn(String columnName)
    {
        List<NewEntity> list = newDAO.selectAllNewOnTopByColumn(columnDAO.queryByName(columnName));
        return list.size();
    }
    
    @Transactional
    public boolean deleteNew(int id)
    {
        NewEntity entity = newDAO.queryById(id);
        if (entity == null)
        {
            return false;
        }
        newDAO.deleteNew(entity);
        return true;
    }

    public NewDAO getNewDAO() {
        return newDAO;
    }

    public void setNewDAO(NewDAO newDAO) {
        this.newDAO = newDAO;
    }

    public ColumnDAO getColumnDAO() {
        return columnDAO;
    }

    public void setColumnDAO(ColumnDAO columnDAO) {
        this.columnDAO = columnDAO;
    }
   
}
