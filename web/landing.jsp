<%--
    Document   : landing
    Created on : 2013-1-10, 13:07:09
    Author     : linangran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
response.setStatus(response.SC_MOVED_PERMANENTLY);
response.addHeader("Location","/index.do");
%>
