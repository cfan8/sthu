<%-- 
    Document   : show_activities
    Created on : 2013-8-8, 17:01:01
    Author     : xiaobo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>学生活动</title>
    </head>
    <%@include file="/templates/general_header.jsp" %>
    
    <div>
        <iframe width="100%" src ="/studentActivity/showActivitiesList.do">
            
        </iframe>
        </div>
    <%@include file="/templates/general_footer.jsp" %>
</html>
