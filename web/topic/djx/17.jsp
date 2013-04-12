<%--
    Document   : general_header
    Created on : 2013-1-27, 21:57:47
    Author     : linangran
--%>

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
	<title>两弹一星元勋</title>
	<script type="text/javascript" src="/js/jquery.js"></script>
	<script type="text/javascript" src="/js/browser.js"></script>
	<link rel="stylesheet" type="text/css" href="djx.css" />
    </head>
    <body>
	<div id="bg_container" class="noprint"></div>
	<div id="all">
	    <div id="top" class="noprint">
		<div id="logo"><a href="/index.do">
			<img src="/css/index/logo.png" />
		    </a></div>
		<div id="logininfo"><span><a href="/login.do?redirectURL=%2Fmysthu.do"><%=nickName%></a></span></div>
		<div id="toplink"><a href="http://166.111.17.5/shijian/" target="_blank">社会实践在线平台</a><span class="splitspan">|</span><a href="http://sutuo.student.tsinghua.edu.cn" target="_blank" >素质拓展计划</a><span class="splitspan">|</span><a href="http://www.bv2008.cn/" target="_blank">志愿北京平台</a><span class="splitspan">|</span><a href="http://daf.tsinghua.edu.cn/" target="_blank">博学网</a></div>
	    </div>
	    <div id="container">
		<div id="banner"><img src="img/banner.png"></img></div>
		<div id="navibar">
		    <div class="navibutton"><a href="/index.do" target="_blank"><img src="img/navi0.png" /></a></div>
                    <div class="navibutton"><a href="/column/column.do?id=2" target="_blank"><img src="img/navi1.png" /></a></div>
		    <div class="navibutton"><a href="/column/column.do?id=8" target="_blank"><img src="img/navi2.png" /></a></div>
		    <div class="navibutton"><a href="/column/column.do?id=4" target="_blank"><img src="img/navi3.png" /></a></div>
		    <div class="navibutton"><a href="http://146.tsinghua.me" target="_blank"><img src="img/navi4.png" /></a></div>
		    <div class="navibutton"><a href="/column/column.do?id=6" target="_blank"><img src="img/navi5.png" /></a></div>
		    <div class="navibutton"><a href="/activity/applyNotice.jsp" target="_blank"><img src="img/navi6.png" /></a></div>
		    <div class="navibutton lastnavibtn"><a href="/ticket/ticketNotice.jsp" target="_blank"><img src="img/navi7.png" /></a></div>
		</div>
		<div id="decoration"><img src="img/decoration.png"></div>
		<div id="main">
		    <div id="title">
			两弹一星元勋
		    </div>
		    <div id="introcontent"><div id="introbg">
			    <div id="introtitle">任新民</div>
			    <div id="introimg"><img src="people/17.jpg"></img></div>
			    <div class="introsubtitle">人物简介</div>
			    <div class="introcontent">任新民(1915- )
安徽省宁国县人，1915年生，男，中共党员，航天技术和火箭发动机专家，中国科学院院士，国际宇航科学院院士。
1940年重庆兵工学校大学部毕业。1945年赴美国密歇根大学研究院留学，获机械工程硕士和工程力学博士学位。1949年8月回国，在华东军区军事科学研究室任研究员。1952年在哈尔滨军事工程学院任教，1956年8月参加筹建国防部五院的工作，历任总体室主任、液体火箭发动机设计部主任、一分院副院长兼液体火箭发动机研究所所长，七机部副部长，航天工业部科技委主任，航空航天部高级技术顾问。
</div>
			    <div class="introsubtitle">人物业绩</div>
			    <div class="introcontent">1964年作为型号副总设计师，领导和参加了第一个自行设计的液体中近程弹道式地地导弹液体火箭发动机的研制工作，保证了东风2号导弹飞行实验取得圆满成功。他相继领导组织了中程、中远程、远程液体弹道式地地导弹的多种液体火箭发动机的研制、试验工作。1980年5月在向太平洋预定海域发射远程弹道式导弹的飞行试验中，作为首区总指挥，协助领导和指挥了这一重大的飞行试验任务。组织研制长征一号运载火箭，保证发射第一颗人造地球卫星东方红一号获得成功。领导组织了氢氧发动机、长征三号运载火箭和整个通信卫星工程的研制试验；领导组织了用长征三号运载火箭把亚洲一号通信卫星准确地送入地球同步转移轨道，实现了中国运载火箭国际发射服务零的突破。1984年荣立航天部一等功，1989年和1990年两次荣获航空航天部通令嘉奖。1985年获两项国家科技进步奖特等奖。
</div>
			    <div id="blankDiv"></div>
			</div></div>
		    <div id="flower">
		    </div>
		</div>
	    </div>
	</div>
	<div id="footer">

	</div>
    <%@include file="/templates/baidutongji.jsp" %>
<script type="text/javascript">
	enableBrowserDetect();
</script>
</body>
</html>
