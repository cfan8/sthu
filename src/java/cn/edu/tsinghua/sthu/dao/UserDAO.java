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
import org.hibernate.criterion.Restrictions;
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
}
