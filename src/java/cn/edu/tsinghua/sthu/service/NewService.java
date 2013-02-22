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
    public int addNew(String title, String content, String author, Date date, String redirectURL, boolean onTop, String columnName)
    {
        if ((onTop == true) && (getOnTopCountByColumn(columnName) >= Constant.ONTOP_NEW_NUMBER_ONE_COLUMN))
        {
            return -1;
        }
        ColumnEntity columnEntity = columnDAO.queryByName(columnName);
        if (columnEntity == null)
        {
            if (columnName == Constant.DEFAULT_COLUMN)
            {
                columnEntity = columnDAO.addColumn(columnName, Constant.DEFAULT_COLUMN_DESCRIPTION, false, false);
            }
            else
            {
                return -2;
            }
        }
        if (redirectURL == null)
        {
            redirectURL = "";
        }
        newDAO.addNew(title, content, author, date, redirectURL.trim(), onTop, columnEntity);
        return 0;
    }
    
    @Transactional
    public int updateNew(int id, String title, String content, String author, Date date, String redirectURL, boolean onTop, String columnName)
    {
        NewEntity entity = getNewById(id);
        if (entity == null)
        {
            return -1;
        }
        if ((entity.getColumnBelong().getName().equals(columnName)) && (!entity.isIsPlacedInColumnTop())
                && (onTop) && (getOnTopCountByColumn(columnName) >= Constant.ONTOP_NEW_NUMBER_ONE_COLUMN))
        {
            return -2;
        }
        if ((!entity.getColumnBelong().getName().equals(columnName))
                && (onTop) && (getOnTopCountByColumn(columnName) >= Constant.ONTOP_NEW_NUMBER_ONE_COLUMN))
        {
            return -2;
        }
        ColumnEntity columnEntity = columnDAO.queryByName(columnName);
        if (columnEntity == null)
        {
            return -3;
        }
        entity.setContent(content);
        entity.setAuthor(author);
        entity.setTitle(title);
        entity.setUpdateTime(date);
        entity.setRedirectURL(redirectURL.trim());
        entity.setIsPlacedInColumnTop(onTop);
        entity.setColumnBelong(columnEntity);
        newDAO.updateNew(entity);
        return 0;
    }
    
    @Transactional
    public List<NewEntity> getRecommendNewsByColumn(ColumnEntity columnEntity)
    {
        return newDAO.selectNewsOrderByBrowseNumber(columnEntity);
    }
    
    @Transactional
    public List<NewEntity> getAllNewsByTimeDESC()
    {
        return newDAO.selectAllNewsByTimeDESC();
    }
    
    @Transactional
    public void addBrowseNumber(NewEntity newEntity)
    {
        newEntity.setBrowseNumber(newEntity.getBrowseNumber() + 1);
        newDAO.updateNew(newEntity);
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
    public List<NewEntity> getNewsByColumn(int startIndex, int endIndex, ColumnEntity columnEntity)
    {
        return newDAO.getNewsByColumn(startIndex, endIndex, columnEntity);
    }
    
    @Transactional
    public int getNewPageCount()
    {
        int count = newDAO.getNewCount();
        return computePage(count, Constant.NEW_NUMBER_ONE_PAGE_IN_MANAGEMENT);
    }
    
    @Transactional
    public int getNewPageCountByColumn(ColumnEntity columnEntity)
    {
        int count = newDAO.getNewCountByColumn(columnEntity);
        return computePage(count, Constant.NEW_NUMBER_ONE_PAGE_IN_SHOWONECOLUMN);
    }
    
    @Transactional
    public NewEntity getNewById(int newId)
    {
        return newDAO.queryById(newId);
    }
    
    public int computePage(int count, int divider)
    {
        if (count % divider == 0)
        {
            return count/divider;
        }
        else
        {
            return count/divider + 1;
        }
    }
    
    @Transactional
    public int getQueryNewPageCount(NewManagementPageMessage newManagementPageMessage)
    {
        int count = newDAO.getNewCount(newManagementPageMessage);
        return computePage(count, Constant.NEW_NUMBER_ONE_PAGE_IN_MANAGEMENT);
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
