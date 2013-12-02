/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.dao;

import cn.edu.tsinghua.sthu.entity.AuthEntity;
import cn.edu.tsinghua.sthu.entity.UserEntity;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
import org.springframework.transaction.annotation.Transactional;


/**
 *
 * @author linangran
 */
public class UserDAO extends BaseDAO<UserEntity>
{
    public UserDAO()
    {
	super(UserEntity.class);
    }


    public void addUser(String username, String password, String nickname, AuthEntity auth)
    {
	UserEntity entity = new UserEntity(username, password, nickname);
	entity.setAuth(auth);
	insert(entity);
    }


    public UserEntity getUserByUsername(String username)
    {
	List<UserEntity> list = select().add(Restrictions.eq("username", username)).list();
	if (list.size() == 1)
	{
	    return list.get(0);
	}
	else
	{
	    return null;
	}
    }


    public UserEntity getUserById(int userid)
    {
	return queryById(userid);
    }


    public void updateLoginTime(int userid)
    {
	UserEntity entity = getUserById(userid);
	entity.setLastlogintime(new Date());
	update(entity);
    }
    
    public void updateUserEntity(UserEntity entity)
    {
	update(entity);
    }
    

    public List<UserEntity> getUserListByIdentity(int identityCode){
        List<UserEntity> list = select().createAlias("auth", "a").add(Restrictions.eq("a.opIdentityCode", identityCode)).list();       
	return list;
    }
    public List<UserEntity> getUserListByResource(int resourceCode){
        List<UserEntity> list = select().createAlias("auth", "a").add(Restrictions.eq("a.opResourceCode", resourceCode)).list();       
	return list;
    }
    public List<UserEntity> getUserListByAllocate(int allocateCode){
        List<UserEntity> list = select().createAlias("auth", "a").add(Restrictions.eq("a.opAllocateCode", allocateCode)).list();       
	return list;
    }
    /**anna  add */
    public List<UserEntity> getAllGroup(int begin, int PerNum){
        List<UserEntity> list = select().createAlias("auth", "a").add(Restrictions.eq("a.role",AuthEntity.GROUP_ROLE)).setFirstResult(begin).setMaxResults(PerNum).list();
        return list;
    }
      public List<UserEntity> getAllGroup(){
        List<UserEntity> list = select().createAlias("auth", "a").add(Restrictions.eq("a.role",AuthEntity.GROUP_ROLE)).list();
        return list;
    }
}
