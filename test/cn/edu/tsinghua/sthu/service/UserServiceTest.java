/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.service;

import cn.edu.tsinghua.sthu.dao.UserDAO;
import cn.edu.tsinghua.sthu.entity.UserEntity;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)
public class UserServiceTest extends BaseTest {

    @Autowired
    private UserService userService;
    @Autowired
    private ApplyClassroomService applyClassroomService;

    /*
    @Test
    public void testUserLogin() {
	System.out.println("userLogin");
	String username = "cfan";
	String password = "lin";
	UserEntity result = userService.userLogin(username, password);
	assertNotNull(result);
    }
    */
    @Test
    public void testAddUser() {
	System.out.println("addUser");
	String username = "lar";
	String password = "lar";
	String nickname = "林盎然";
	boolean expResult = true;
	boolean result = userService.addUser(username, password, nickname);
	assertEquals(expResult, result);
    }
    /*
    @Test
    public void testMail()
    {
        applyClassroomService.sendEmailByIdentity(1, 20);
    }
    * */
}
