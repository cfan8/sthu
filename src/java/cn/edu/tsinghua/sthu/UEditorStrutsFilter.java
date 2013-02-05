/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cn.edu.tsinghua.sthu;

import java.io.IOException;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter;

/**
 *
 * @author linangran
 */
public class UEditorStrutsFilter extends StrutsPrepareAndExecuteFilter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
	HttpServletRequest request = (HttpServletRequest) req;
	String url = request.getRequestURI();
	if (url.startsWith("/ueditor/jsp/") && url.endsWith(".jsp")) {
	    chain.doFilter(req, res);
	} else {
	    super.doFilter(req, res, chain);
	}
    }
}
