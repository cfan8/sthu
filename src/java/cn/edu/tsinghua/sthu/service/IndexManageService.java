/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.service;

import cn.edu.tsinghua.sthu.dao.IndexManageDAO;
import cn.edu.tsinghua.sthu.entity.IndexSettingEntity;
import java.util.ArrayList;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author linangran
 */
public class IndexManageService extends BaseService {

    private IndexManageDAO indexManageDAO;
    public static final int MAX_IMG_NUMBER = 5;

    @Transactional
    public List<IndexSettingEntity> getIndexSetting() {
	List<IndexSettingEntity> list = indexManageDAO.getIndexSettingEntity();
	if (list.size() < MAX_IMG_NUMBER) {
	    int t = MAX_IMG_NUMBER - list.size();
	    List<IndexSettingEntity> saveList = new ArrayList<IndexSettingEntity>();
	    for (int i = 0; i < t; i++) {
		saveList.add(new IndexSettingEntity());
	    }
	    indexManageDAO.addSetting(saveList);
	    list = indexManageDAO.getIndexSettingEntity();
	}
	return list;
    }
    
    @Transactional
    public List<IndexSettingEntity> getValidIndexSetting() {
	return indexManageDAO.getValidIndexSettingEntity();
    }
    
    @Transactional
    public void updateSetting(List<IndexSettingEntity> list)
    {
	if (list.size() == MAX_IMG_NUMBER)
	{
	    indexManageDAO.updateSetting(list);
	}
    }

    public IndexManageDAO getIndexManageDAO() {
	return indexManageDAO;
    }

    public void setIndexManageDAO(IndexManageDAO indexManageDAO) {
	this.indexManageDAO = indexManageDAO;
    }
}
