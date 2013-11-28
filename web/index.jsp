<%-- 
    Document   : main_index
    Created on : 2013-2-27, 17:16:16
    Author     : linangran
--%>

<%@page import="java.util.List"%>
<%@page import="cn.edu.tsinghua.sthu.entity.IndexSettingEntity"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.constant.IndexColumnMapping"%>
<%@page import="cn.edu.tsinghua.sthu.message.ShowIndexMessage"%>
<%@page import="cn.edu.tsinghua.sthu.entity.UserEntity"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Boolean isLogin = (Boolean) session.getAttribute("isLogin");
    String nickName = null;
    if (isLogin != null && isLogin == true) {
	nickName = ((UserEntity) (session.getAttribute("userinfo"))).getNickname();
    } else {
	nickName = "我的学清";
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <title>学生清华-首页</title>
	    <link rel="stylesheet" type="text/css" href="/css/index/index.css" />
	    <script type="text/javascript" src="/js/jquery.js" ></script>
	    <script type="text/javascript" src="/js/browser.js" ></script>
    </head>
    <%!	public ShowIndexMessage showIndexMessage;
    %>
    <%
	showIndexMessage = (ShowIndexMessage) request.getAttribute("showIndexMessage");
	List<IndexSettingEntity> settings = showIndexMessage.getIndexSettings();
    %>
    <body>
	<div id="bg_container"></div>
	<div id="all">
	    <div id="top">
		<div id="logo"><a href="/index.do">
			<img src="/css/index/logo.png" />
		    </a></div>
                <div id="joinus" class="toptext"><span><a href="mailto:chengcai@mail.tsinghua.edu.cn">加入我们</a></span></div>
                <div id="submitarticle" class="toptext"><span><a href="mailto:chengcai@mail.tsinghua.edu.cn">我要投稿</a></span></div>
                <div id="appdownload"><span><a href="/app/STHUApp.apk">客户端下载</a></span></div>
		<div id="logininfo"><span><a href="/login.do?redirectURL=%2Fmysthu.do"><%=nickName%></a></span></div>
                
		<div id="toplink"><a href="http://166.111.17.5/shijian/" target="_blank">社会实践在线平台</a><span class="splitspan">|</span><a href="http://sutuo.student.tsinghua.edu.cn" target="_blank" >素质拓展计划</a><span class="splitspan">|</span><a href="http://www.bv2008.cn/" target="_blank">志愿北京平台</a><span class="splitspan">|</span><a href="http://daf.tsinghua.edu.cn/" target="_blank">博学网</a><span class="splitspan">|</span><a href="http://old.student.tsinghua.edu.cn/" target="_blank">怀念老学清</a></div>
	    </div>
	    <div id="banner">
		<div id="bannerimg"><img src="/css/index/banner8.jpg" width="1024px" height="295px">
                        
                    </img></div>
                <div id="bannerbottomimg">
                    <img src="/css/index/triangle.png"></img>
                </div>
		<div id="navibar">
		    <div class="navibutton"><a href="/index.do"><img src="/css/index/navi0.png" /></a></div>
                    <div class="navibutton"><a href="/column/column.do?id=2" target="_blank"><img src="/css/index/navi1.png" /></a></div>
		    <div class="navibutton"><a href="/column/column.do?id=8" target="_blank"><img src="/css/index/navi2.png" /></a></div>
		    <div class="navibutton"><a href="/studentActivity/showActivitiesList.do" target="_blank"><img src="/css/index/navi3-0.png" /></a></div>
		    <div class="navibutton"><a href="http://146.tsinghua.me" target="_blank"><img src="/css/index/navi4.png" /></a></div>
		    <div class="navibutton"><a href="/column/column.do?id=6" target="_blank"><img src="/css/index/navi5.png" /></a></div>
		    <div class="navibutton"><a href="/activity/applyNotice.jsp" target="_blank"><img src="/css/index/navi6.png" /></a></div>
		    <div class="navibutton lastnavibtn"><a href="/ticket/ticketNotice.jsp" target="_blank"><img src="/css/index/navi7.png" /></a></div>
		</div>
	    </div>
	    <div id="main">
		<div id="slide">
		    <div id="imagebox"></div>
		    <div id="tipbox"><div id="tiptextarea"><div id="tiptext"></div></div><div id="tipbtn"></div></div>
		</div>
		<div id="note">
                    <div class="title"><div class="morediv"><a href="/column/column.do?id=<%=IndexColumnMapping.IndexTopColumnId%>" target="_blank">&gt;&gt;more</a></div></div>
		    <div class="content">
			<% int max = showIndexMessage.getIndexTopNews().size() > 10 ? 10 : showIndexMessage.getIndexTopNews().size();
			    for (int i = 0; i < max; i++) {%>
			<div <% if (showIndexMessage.getIndexTopNews().get(i).isIsPlacedInColumnTop()) {%> class="noteitem top1" 
													   <% } else {%> class="noteitem top0" <% }%> >
                            <span <% if(showIndexMessage.getIndexTopNews().get(i).getHighlight()){%> class="hightlight1" <% }else {%> <%}%>>
			    <a href="/new/new.do?id=<%=showIndexMessage.getIndexTopNews().get(i).getID()%>" target="_blank"
			       title="<%=showIndexMessage.getIndexTopNews().get(i).getTitle()%>"><% if (showIndexMessage.getIndexTopNews().get(i).getTitle().length() > 18) {%>  <%=showIndexMessage.getIndexTopNews().get(i).getTitle().substring(0, 18).concat("..")%>
				<% } else {%> <%=showIndexMessage.getIndexTopNews().get(i).getTitle()%> <% }%> </a>
                            </span>
                        </div>
			<% }%>
		    </div>
		</div>
		<div id="express">
		    <div class="title"><div class="morediv"><a href="#">&gt;&gt;more</a></div></div>
		    <div class="content">
			<div id="leftList">
                            <div class="listTitle"><a href="/column/column.do?id=<%=IndexColumnMapping.IndexBottomLeftColumnId%>" target="_blank"><img src="/css/index/express_t0.png"></img></a></div>
			    <div class="listContent">
				<ul>
				    <% max = showIndexMessage.getIndexBottomLeftNews().size() > 6 ? 6 : showIndexMessage.getIndexBottomLeftNews().size();
					for (int i = 0; i < max; i++) {
				    %>
				    <li>
                                            <span <% if(showIndexMessage.getIndexBottomLeftNews().get(i).getHighlight()){%> class="hightlight1" <% }else {%> <%}%>>
                                            <span class="newstitle">
                                                <a href="/new/new.do?id=<%=showIndexMessage.getIndexBottomLeftNews().get(i).getID()%>" target="_blank"
								   title="<%=showIndexMessage.getIndexBottomLeftNews().get(i).getTitle()%>"><% if (showIndexMessage.getIndexBottomLeftNews().get(i).getTitle().length() > 17) {%>  <%=showIndexMessage.getIndexBottomLeftNews().get(i).getTitle().substring(0, 17).concat("..")%> 
                                                <% } else {%> <%=showIndexMessage.getIndexBottomLeftNews().get(i).getTitle()%> <% }%> </a></span><span class="newsdate"><%=Util.dateToStringAccurateToDayFormat1(showIndexMessage.getIndexBottomLeftNews().get(i).getUpdateTime())%></span></span></li>
						<%}%>
				</ul>
			    </div>

			</div>
			<div id="rightList">
                            <div class="listTitle"><a href="/column/column.do?id=<%=IndexColumnMapping.IndexBottomCenterColumnId%>" target="_blank"><img src="/css/index/express_t1.png"></img></a></div>
			    <div class="listContent">
				<ul>
				    <% max = showIndexMessage.getIndexBottomCenterNews().size() > 6 ? 6 : showIndexMessage.getIndexBottomCenterNews().size();
					for (int i = 0; i < max; i++) {
				    %>
                                    <li>
                                        
                                            <span <% if(showIndexMessage.getIndexBottomCenterNews().get(i).getHighlight()){%> class="hightlight1" <% }else {%> <%}%>>
                                            <span class="newstitle">
                                                <a href="/new/new.do?id=<%=showIndexMessage.getIndexBottomCenterNews().get(i).getID()%>" target="_blank"
								   title="<%=showIndexMessage.getIndexBottomCenterNews().get(i).getTitle()%>"><% if (showIndexMessage.getIndexBottomCenterNews().get(i).getTitle().length() > 18) {%>  <%=showIndexMessage.getIndexBottomCenterNews().get(i).getTitle().substring(0, 18).concat("..")%>
                                                <% } else {%> <%=showIndexMessage.getIndexBottomCenterNews().get(i).getTitle()%> <% }%> </a></span><span class="newsdate"><%=Util.dateToStringAccurateToDayFormat1(showIndexMessage.getIndexBottomCenterNews().get(i).getUpdateTime())%></span></span></li>
						<%}%>
				</ul>				
			    </div>
			</div>
		    </div>
		</div>
		<div id="event">	
                    <div class="title"><div class="morediv"><a href="/studentActivity/showActivitiesList.do" target="_blank">&gt;&gt;more</a></div></div>
		    <div class="content">
			<% max = showIndexMessage.getStudentActivityApplyEntitys().size() > 7 ? 7 : showIndexMessage.getStudentActivityApplyEntitys().size();
			    for (int i = 0; i < max; i++) {%>
			<div class="eventitem">
                            <a href="/studentActivity/showStudentActivityDetail.do?activityID=<%=showIndexMessage.getStudentActivityApplyEntitys().get(i).getID()%>" target="_blank"
                               title="<%=showIndexMessage.getStudentActivityApplyEntitys().get(i).getActivityTheme()%>"><% if (showIndexMessage.getStudentActivityApplyEntitys().get(i).getActivityTheme().length() > 16) {%>  <%=showIndexMessage.getStudentActivityApplyEntitys().get(i).getActivityTheme().substring(0, 16).concat("..")%>
				<% } else {%> <%=showIndexMessage.getStudentActivityApplyEntitys().get(i).getActivityTheme()%> <% }%></a>
			</div>
			<% }%>
		    </div>
		</div>
		<div id="weibo">
		</div>
		<div id="subject">
		    <div class="title"><div class="morediv"><a href="/column/column.do?id=8" target="_blank">&gt;&gt;more</a></div></div>
		    <div class="content">
			<div class="lefttopic"><a href="/topic/tj2013/tj2013/index.html" target="_blank">
			    <div class="topicimg"><img src="/css/index/topic4.jpg"></img></div>
			    <div class="topictext">清华大学特等奖学金设立于1989年，旨在表彰德、智、体、美全面发展或是在某一方面具有突出特长或贡献的优秀学子，是清华学生的最高荣誉。</div></a>
			</div>
			<div class="midtopic"><a href="/topic/mlhk/mlhk/index.html" target="_blank">
			    <div class="topicimg"><img src="/css/index/topic3.png"></img></div>
			    <div class="topictext">《马兰花开》是一部反映“两弹一星”元勋邓稼先同志投身新中国核事业的人生历程及伟大精神的大型话剧。</div></a>
			</div>
			<div class="righttopic"><a href="/topic/photography_contest/index.html" target="_blank">
			    <div class="topicimg"><img src="/css/index/topic2.png"></img></div>
			    <div class="topictext">“清影华光”摄影大赛第一季——“幸福”<br/>在我们美丽的清华园中，发生着各种多姿多彩的故事，演绎着无数拨动心弦的瞬间。</div></a>
			</div>
		    </div>
		</div>
		<div id="social">
		    <div class="title"></div>
		    <div class="content">
			<div class="socialLink"><a href="http://page.renren.com/600638900" target="_blank"><div class="imglogo"><img src="/css/index/logo0.png" /></div><div class="textlogo">学生清华</div></a></div>
			<div class="socialLink"><a href="http://www.renren.com/361811298/profile" target="_blank"><div class="imglogo"><img src="/css/index/logo1.png" /></div><div class="textlogo">清华科创</div></a></div>
			<div class="socialLink"><a href="http://www.renren.com/260235844/profile" target="_blank"><div class="imglogo"><img src="/css/index/logo2.png" /></div><div class="textlogo">清华素拓</div></a></div>
			<div class="socialLink"><a href="http://page.renren.com/601321313" target="_blank"><div class="imglogo"><img src="/css/index/logo3.png" /></div><div class="textlogo">时事大讲堂</div></a></div>
			<div class="socialLink"><a href="http://page.renren.com/600376271" target="_blank"><div class="imglogo"><img src="/css/index/logo4.png" /></div><div class="textlogo">校学生会</div></a></div>
			<div class="socialLink"><a href="http://page.renren.com/601062142" target="_blank"><div class="imglogo"><img src="/css/index/logo5.png" /></div><div class="textlogo">清华创业</div></a></div>
			<div class="socialLink"><a href="http://www.renren.com/339106868/profile" target="_blank"><div class="imglogo"><img src="/css/index/logo6.png" /></div><div class="textlogo">艾生权</div></a></div>
			<div class="socialLink"><a href="http://www.renren.com/449411417/profile" target="_blank"><div class="imglogo"><img src="/css/index/logo7.png" /></div><div class="textlogo">实践君</div></a></div>
			<div class="socialLink"><a href="http://www.renren.com/341183992/profile" target="_blank"><div class="imglogo"><img src="/css/index/logo8.png" /></div><div class="textlogo">紫荆志愿</div></a></div>
		    </div>
		</div>
	    </div>
	</div>
	<div id="footercontainer">
	    <div id="footer">
		<div class="title"></div>
		<div class="content">
		    <%@include file="/templates/link.jsp" %>
		</div>
	    </div>
	</div>
	<div id="copyright">
	    <div id="copyrighttext">共青团清华大学委员会成才信息中心<br/>Copyright©2013 student.tsinghua.edu.cn, All Rights Reserved</div>
	</div>
	<%@include file="/templates/baidutongji.jsp" %>
    </body>
    <script>
	//悬停下划线（CSS太麻烦！）
	$("a").mouseover(function(){
	    $(this).css("text-decoration", "underline");
	});
	
	$("a").mouseout(function(){
	    $(this).css("text-decoration", "none");
	});
	
	var imgs = new Array(
	<% for (int i = 0; i < settings.size(); i++) {
		IndexSettingEntity entity = settings.get(i);
	%>
	    '<%=entity.getImage()%>'<%=i == settings.size() - 1 ? "" : ","%>
	<% }%>
	);
	    var titles = new Array(
	<% for (int i = 0; i < settings.size(); i++) {
		IndexSettingEntity entity = settings.get(i);
	%>
	    '<%=entity.getTitle()%>'<%=i == settings.size() - 1 ? "" : ","%>
	<% }%>
	);
	    var links = new Array(
	<% for (int i = 0; i < settings.size(); i++) {
		IndexSettingEntity entity = settings.get(i);
	%>
	    '<%=entity.getLink()%>'<%=i == settings.size() - 1 ? "" : ","%>
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
		    imghtml += '<a href="' + links[i] + '" target="_blank"><img src="' + imgs[i] + '" id="slideimg' + i + '"></img>';  
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
		    titles[i] = '<a href="' + links[i] + '">' + titles[i] + '</a>';
		}
	    
		for (var i = 0; i < imgs.length; i++)
		{
		    $("#imgbtn" + i).bind("click", {param1: i}, clickRecall);
		}
	    
		$("#slideimg0").show();
		$("#imgbtn0 img").css("opacity", "1");
		$("#tiptext").html(titles[0]);
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
