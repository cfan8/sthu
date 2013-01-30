/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu.action;
import cn.edu.tsinghua.sthu.Util;
import com.opensymphony.xwork2.*;
import org.apache.catalina.connector.Request;
/**
 *
 * @author linangran
 */
public class RedirectAction implements Action{

    @Override
    public String execute() throws Exception {
	return SUCCESS;
    }

}
