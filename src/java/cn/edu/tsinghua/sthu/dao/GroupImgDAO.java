/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.dao;

import cn.edu.tsinghua.sthu.entity.GroupImgEntity;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author xiaobo
 */
public class GroupImgDAO extends BaseDAO<GroupImgEntity> {
    public GroupImgDAO(){
        super(GroupImgEntity.class);
    }
    public List<GroupImgEntity> getImagesByGroupId(int groupId){
        return select().add(Restrictions.eq("groupId", groupId)).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
    }
    public List<GroupImgEntity> getValidImagesByGroupId(int groupId){
        return select().add(Restrictions.and(Restrictions.eq("groupId", groupId), Restrictions.eq("enabled", true))).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
    }
    public void updateImgs(List<GroupImgEntity> list)
    {
	for (int i = 0; i < list.size(); i++)
	{
	    update(list.get(i));
	}
    }
    
    public void addImgs(List<GroupImgEntity> list)
    {
	for (int i = 0; i < list.size(); i++)
	{
	    insert(list.get(i));
	}
    }
}
