/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.service;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author linangran
 */

@ContextConfiguration(locations={"file:web/WEB-INF/ApplicationContext.xml", "file:web/WEB-INF/DAOContext.xml", "file:web/WEB-INF/MessageContext.xml", "file:web/WEB-INF/ServiceContext.xml"})
@TransactionConfiguration
@Transactional
public class BaseTest extends  AbstractTransactionalJUnit4SpringContextTests {
    
}
