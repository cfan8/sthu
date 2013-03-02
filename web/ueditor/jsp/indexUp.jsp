<%-- 
    Document   : indexUp
    Created on : 2013-3-1, 22:22:57
    Author     : linangran
--%>

<%@ page language="java" contentType="text/html; charset=utf-8"
	 pageEncoding="utf-8"%>
<%@ page import="ueditor.Uploader" %>

<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    Uploader up = new Uploader(request);
    up.setSavePath("upload");
    int t = Integer.valueOf(request.getParameter("id"));
    String[] fileType = {".gif", ".png", ".jpg", ".jpeg", ".bmp"};
    up.setAllowFiles(fileType);
    up.setMaxSize(10000); //单位KB
    up.upload();
    response.getWriter().print("{'url':'/" + up.getUrl() + "', 'id':'" + t +"'}");
%>
