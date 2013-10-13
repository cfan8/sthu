<%-- 
    Document   : grouphome
    Created on : 2013-8-13, 15:00:20
    Author     : xiaobo
--%>

<%@page import="java.util.List"%>
<%@page import="cn.edu.tsinghua.sthu.entity.GroupImgEntity"%>
<%@page import="cn.edu.tsinghua.sthu.action.ShowGroupHomeAction"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.message.ShowGroupHomeMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ShowGroupHomeMessage message = Util.getMessage(ShowGroupHomeAction.class);
    Integer showFollow = message.getShowFollow();
    Integer isGroupFollowed = message.getIsGroupFollowed();
    String organizeName= message.getOrganizeName();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>社团主页</title>
        <script type="text/javascript" src="/js/jquery.js"></script>
	<script type="text/javascript" src="/js/pageview.js"></script>
        <script type="text/javascript" src="/js/browser.js" ></script>
        
	
	<link href="/css/activity/NaviBar_sheet.css" type="text/css" rel="stylesheet" />
        <link href="/css/activity/FooterBar_sheet.css" type="text/css" rel="stylesheet" />
        <link href="/css/activity/organizationPage.css" type="text/css" rel="stylesheet" />
        <link href="/css/activity/effects.css" type="text/css" rel="stylesheet" />
        <style type="text/css">
            .manage_btn a{
                display: inline-block;
                width: 140px;
                height: 20px;
                background-color:#4A708B;
                text-align: center;
                text-decoration: none;
                color: white;
                padding: 10px;
                font-size: 16px;
                font-family: Microsoft Yahei;
                letter-spacing: 4px;
                cursor: pointer;
            }
        </style>
    </head>
    <%@include file="/templates/new_general_header.jsp" %> 
    <div id="main_part" class="main-style">
        <div id="main_content_part" class="main-content-style">
            <%if(message.isShowManage()){%>
            <div style="padding-left:50px" class="manage_btn">
                <a href="/showGroupHomeManage.do?groupId=<%=message.getGroupId()%>">管&nbsp;&nbsp;理</a>
                <a href="/mysthu.do">查看申请</a>
            </div>
            <%}%>
            <div style="height: 7px;"></div>
            <div id="content_board" class="content-style">
                <div id="content_main_board" class="content-main-style">
                    <div id="text_index" style="min-height:200px;height:auto;padding:30px 40px 10px 40px;background-color: rgb(127,199,210);color:white;">
                        <div style="float:left; margin-right: 20px;">
                            <div id="slide">
                                <div id="imagebox"></div>
                                <div id="tipbox"><div id="tiptextarea"><div id="tiptext"></div></div><div id="tipbtn"></div></div>
                            </div>
                        </div>
                        <div id="xsh_logo" class="xsh-logo">
                            <%if(message.getLogoImg() != null && message.getLogoImg().compareTo("null") != 0){%>
                            <img src="<%=message.getLogoImg()%>" class="img-shadow logo-img" />
                            <%}else{%>
                            <img src="/images/logo.jpg" class="img-shadow logo-img" />
                            <%}%>
                        </div>
                        <div style="font-family: Microsoft YaHei, LiHei Pro Medium; margin-top:20px;">
                        <a style="font-size:36px;"><b><%=organizeName%> </b></a> 
                        
                        </div>
                    </div>
                        
                        <div id="follow" class="follow-style">
                            <a><b>已有</b></a>
                            <a id="follow_num" style="color: #d55;font-size: 18px; font-family: Impact"><b><%=message.getFollowNum()%></b></a>
                            <a><b>人关注</b></a>
                        
                        
                        <div id="follow_part">                                                             
                            <%if(showFollow == 1){%>
                                <div class="btn-border">
                                <%if(isGroupFollowed == 1){%>
                                <a href="/followGroup.do?type=0&groupId=<%=message.getGroupId()%>">
                                    <img src="/css/activity/unfollow_btn.png" />
                                </a>
                                <%}else{%>
                                <a href="/followGroup.do?type=1&groupId=<%=message.getGroupId()%>">
                                    <img src="/css/activity/follow_btn.png" />
                                </a>                 
                                <%}%>
                                </div>
                            <%}%>        
                                
                        </div>
                            </div>
                        <div id="introduction_part">
                            <p>
                                
                            <%String intro = message.getIntroduction();
                                if(intro == null || intro.compareTo("null") == 0 ){
                            %>
                            这个组织很懒，还没有填写简介。
                            <%}else{%>
                            <%=intro%>
                            <%}%>
                            </p>
                            
                        </div>
                            <div style="padding:10px 50px 20px 50px;">
                            <hr/>
                            </div>
                        <div id="text_content" style="height:auto; min-height: 400px; padding:10px 40px 10px 30px;"> 
                         
                         </div>
                        <script type="text/javascript">
                            var pageConfig = {
                                root:$("#text_content"),
                                url:"/showGroupPageHome.do?groupId=<%=message.getGroupId()%>",
                                total:<%=message.getTotalPageNumber()%>,
                                current:1,
                                arguName:"page",
                                css:false
                            };
                            init(pageConfig);
                       </script>    
                        
                </div>
                
                     
            </div>

               
                <!--
                <div id="right_content" style="float: right; width: 250px;">
                    
                    <div id="other_organization" style="height:300px;margin-top:20px;">
                        <div style="float:right;width:230px;background-color:#fff;height:340px;">
                            <div style="padding-top:10px;padding-left:10px;">
                                <a><b>友情主页</b></a>
                            </div>
                            <div style="margin-top:2px;">
                                <ul style="list-style:none;padding-left:10px;margin-left:0px;">
                                    <li style="min-height:60px;">
                                        <div style="float:left;">
                                            <img src="/css/activity/shsj.jpg" class="org-logo" />
                                        </div>
                                        <div style="float:left;margin-left:5px;font-size:small;">
                                            <div style="color:#47a"><a><b>清华大学社会实践</b></a></div>
                                            <div style="width:170px;word-wrap: break-word; overflow: hidden;"><a>受教育，长才干，做贡献；知国情、悟责任、立志向！</a></div>
                                        </div>
                                    </li>

                                    <li style="min-height:60px;">
                                        <div style="float:left;">
                                            <img src="/css/activity/xczx.jpg" class="org-logo" />
                                        </div>
                                        <div style="float:left;margin-left:5px;font-size:small;">
                                            <div style="color:#47a"><a><b>清华大学宣传中心</b></a></div>
                                            <div style="width:170px;word-wrap: break-word; overflow: hidden;"><a></a></div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                -->
        </div>
    </div>
        
                
    <%@include file="/templates/new_general_footer.jsp" %>
    <%
        List<GroupImgEntity> list = message.getImages();
    %>
    <script>
	
	var imgs = new Array(
	<% for (int i = 0; i < list.size(); i++) {
		GroupImgEntity entity = list.get(i);
	%>
	    '<%=entity.getImg()%>'<%=i == list.size() - 1 ? "" : ","%>
	<% }%>
	);
	    var titles = new Array(
	<% for (int i = 0; i < list.size(); i++) {
		GroupImgEntity entity = list.get(i);
	%>
	    '<%=entity.getTitle()%>'<%=i == list.size() - 1 ? "" : ","%>
	<% }%>
	);
	    
	    init();
	    enableBrowserDetect();
	    
	    var timer;
	
	    var current = 0;
	    function init(){
		var imghtml = "";
		for (var i = 0; i < imgs.length; i++)
		{
		    imghtml += '<a href="#" target="_blank"><img src="' + imgs[i] + '" id="slideimg' + i + '"></img>';  
		}
		$("#imagebox").html(imghtml);
	
		imghtml="";
		for (var i = 0; i < imgs.length; i++)
		{
		    imghtml += '<a href="#" id="imgbtn' + (imgs.length - 1 - i) + '"><img src="/css/index/tipbtn.png"></img></a>';
		}
		$("#tipbtn").html(imghtml);
	    
		for (var i = 0; i < imgs.length; i++)
		{
		    titles[i] = '<a href="#">' + titles[i] + '</a>';
		}
	    
		for (var i = 0; i < imgs.length; i++)
		{
		    $("#imgbtn" + i).bind("click", {param1: i}, clickRecall);
		}
	    
		$("#slideimg0").show();
		$("#imgbtn0 img").css("opacity", "1");
		$("#tiptext").html(titles[0]);
                if(imgs.length > 1)
		timer = setInterval(triggerRecall, 5000);
	    }
	
	    function triggerRecall()
	    {
		if (current == imgs.length - 1)
		{
		    showThis(0);
		}
		else 
		{
		    showThis(current + 1);
		}
	    }
	
	    function clickRecall(event)
	    {
		var t = event.data.param1;
		clearInterval(timer);
		timer = setInterval(triggerRecall, 5000);
		if (t == current)
		{
		    return false;
		}
		else 
		{
		    showThis(t);
		}
		return false;
	    }
	
	    function showThis(t)
	    {
		$("#slideimg" + current).css("z-index", "2");
		$("#slideimg" + t).css("z-index", "1");
		$("#slideimg" + t).show();
		$("#slideimg" + current).fadeOut(1000);
		$("#tiptextarea").fadeOut(500, function(){
		    $("#tiptext").html(titles[t]);
		    $("#tiptextarea").fadeIn(500);
		});
		$("#imgbtn" + current + " img").css("opacity", "0.5");
		$("#imgbtn" + t + " img").css("opacity", "1");
		current = t;
	    }
    </script>
</html>

