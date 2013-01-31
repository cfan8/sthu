/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.service;

import cn.edu.tsinghua.sthu.Util;
import cn.edu.tsinghua.sthu.dao.UserDAO;
import cn.edu.tsinghua.sthu.entity.UserEntity;
import cn.edu.tsinghua.sthu.message.LoginMessage;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author linangran
 */
public class UserService extends BaseService{

    private UserDAO userDAO;

    @Transactional
    public UserEntity userLogin(String username, String password)
    {
	password = Util.getMD5(password);
	UserEntity entity = userDAO.getUserByUsername(username);
	if (entity != null && entity.getPassword().equals(password))
	{
	    userDAO.updateLoginTime(entity.getID());
	    return entity;
	}
	else
	{
	    return null;
	}
    }

    @Transactional
    public boolean addUser(String username, String password, String nickname)
    {
	password = Util.getMD5(password);
	UserEntity entity = userDAO.getUserByUsername(username);
	if (entity == null)
	{
	    userDAO.addUser(username, password, nickname);
	    return true;
	}
	else
	{
	    return false;
	}
    }

    public UserDAO getUserDAO()
    {
	return userDAO;
    }

    public void setUserDAO(UserDAO userDAO)
    {
	this.userDAO = userDAO;
    }

}
