<%-- 
    Document   : newedit
    Created on : 2013-2-7, 21:47:45
    Author     : wuhz
--%>

<%@page import="cn.edu.tsinghua.sthu.message.NewEditPageMessage"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%!
        public NewEditPageMessage newEPM;
    %>
    <%
        newEPM = (NewEditPageMessage) request.getAttribute("newEditPageMessage");
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>新闻编辑</title>
        <script type="text/javascript" charset="utf-8" src="/ueditor/editor_config_admin.js"></script>
	<script type="text/javascript" charset="utf-8" src="/ueditor/editor_all_min.js"></script>
    </head>
    <%@include file="/templates/general_header.jsp" %>
    <link rel="stylesheet" type="text/css" href="/css/new/newEdit.css" />
    <div id="position">您的当前位置：<a href="/new/newsManage.do">新闻管理</a>>>新闻编辑</div>
    <div id="new_edit_div">
        <% if (newEPM.getId() < 0)
               { %>
        <form action="/new/addNew.do" method="post">
            <div class="title">标题：<input type="text" name="title"/><span class="word_number">标题长度应该在3~64个字符之间</span></div>
            <div class="author">作者：<input type="text" name="author" /><span class="word_number">作者应该在16个字符之内</span></div>
            <div class="column">
                所属栏目：
                <select name="columnBelong">
                    <% for (int i = 0; i < newEPM.getColumnNames().size(); i++)
                    { %>
                        <option><%=newEPM.getColumnNames().get(i) %></option>
                    <% } %>
                </select>
            </div>
            <div class="new_abstract">
                <div id="abstract_left">
                    <div>摘要</div>
                </div>
                <div id="abstract_right">
                    <textarea rows="5" cols="35" name="newAbstract" wrap="virtual"></textarea>
                </div>
                <div id="abstract_word_number">
                    <span class="word_number">新闻摘要应该在250个字符之内</span>
                </div>
                <div class="clear"></div>
            </div>
            <div class="content"><script id="editor" type="text/plain" name="content">在这里编辑文章的内容</script></div>
            <div class="onTop">是否置顶：
                <input type="radio" name="isPlacedInColumnTop" value="false" checked="checked"/> 否 &nbsp;&nbsp;
                <input type="radio" name="isPlacedInColumnTop" value="true" /> 是
            </div>
            <div class="redirect">设置重定向URL：<input type="text" name="redirectURL"/></div>
            <div class="button"><center><input id="submit" type="image" src="/css/new/submit_new.png"/></center></div>
        </form>
         <% }
          else 
        { %>
        <form action="/new/updateNew.do?id=<%=newEPM.getId()%>" method="post">
            <div class="title">标题：<input type="text" name="title" value="<%=newEPM.getNewEntity().getTitle()%>"/><span class="word_number">标题长度应该在3~64个字符之间</span></div>
            <div class="author">作者：<input type="text" name="author" value="<%=newEPM.getNewEntity().getAuthor()%>" /><span class="word_number">作者应该在16个字符之内</span></div>
            <div class="column">
                所属栏目：
                <select name="columnBelong">
                    <% for (int i = 0; i < newEPM.getColumnNames().size(); i++)
                    { %>
                        <option <% if (newEPM.getColumnNames().get(i).equals(newEPM.getNewEntity().getColumnBelong().getName())) 
                       { %> selected="selected" <% } %>><%=newEPM.getColumnNames().get(i) %></option>
                    <% } %>
                </select>
            </div>
            <div class="new_abstract">
                <div id="abstract_left">摘要：</div>
                <div id="abstract_right">
                    <textarea rows="5" cols="35" name="newAbstract" wrap="virtual"><%=newEPM.getNewEntity().getNewAbstract()%></textarea>
                </div>
                <div id="abstract_word_number">
                    <span class="word_number">新闻摘要应该在250个字符之内</span>
                </div>
                <div class="clear"></div>
            </div>
            <div class="content"><script id="editor" type="text/plain" name="content"><%=newEPM.getNewEntity().getContent()%> </script></div>
            <div class="onTop">是否置顶：
                <input type="radio" name="isPlacedInColumnTop" value="false" <% if (!newEPM.getNewEntity().isIsPlacedInColumnTop()) { %> checked="checked" <% } %>/> 否 &nbsp;&nbsp;
                <input type="radio" name="isPlacedInColumnTop" value="true" <% if (newEPM.getNewEntity().isIsPlacedInColumnTop()) { %> checked="checked" <% } %>/> 是
            </div>
            <div class="redirect">重定向URL：<input type="text" name="redirectURL" value="<%=newEPM.getNewEntity().getRedirectURL()%> "/></div>
            <div class="button"><center><input id="submit" type="image" src="/css/new/update_new.png"/></center></div>
        </form>
        <% } %>
    </div>      
    <%@include file="/templates/general_footer.jsp" %>
    <script type="text/javascript">
     var ue = UE.getEditor('editor');
    </script>
</html>
