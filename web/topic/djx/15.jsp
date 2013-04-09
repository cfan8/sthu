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
			    <div id="introtitle">陈芳允</div>
			    <div id="introimg"><img src="people/15.jpg"></img></div>
			    <div class="introsubtitle">人物简介</div>
			    <div class="introcontent">陈芳允(1916-2000 )
浙江省台州市人，1916年生，男，中共党员，无线电电子学、空间系统工程专家，中国科学院院士，国际宇航科学院院士。
1938年毕业于清华大学物理系。1945年在英国COSSOR无线电厂研究室工作，解放前夕回国。先后在中国科学院上海分院、中国科学院物理所工作。1956年，参加了国家12年长期科学规划制定工作，负责新电子学研究所的筹组工作。1964年起从事空间技术工作，1976年调入国防科委，在技术上负责卫星测量控制系统的总体设计、设备研制、布局建设以及星地协调工作。1984年调任国防科工委科技委常任委员、顾问。现任中国人民解放军总装备部科技委顾问。
</div>
			    <div class="introsubtitle">人物业绩</div>
			    <div class="introcontent">中国卫星测量、控制技术的奠基人之一。1957年，原苏联发 射第一颗人造卫星时，他即对卫星进行了无线电多卜勒频率测量，并和天文台的同志一起，计算出了卫星的轨道参数，该方法成为以后中国发射人造卫星所采用的跟踪测轨的主要技术之一。1963年研制出国际领先的纳秒脉冲采样示波器。1965年担任卫星测量、控制的总体技术负责人，为中国第一颗人造卫星的准确测量、预报作出了重要贡献。他还参加了中国回收型遥感卫星的测控系统方案的设计和制定工作，为中国十几颗遥感卫星成功回收作出了重大贡献。他相继提出了微波统一测控系统、“双星定位系统”、遥感小卫星群对地观测系统和小卫星移动卫星通信系统等方案。他直接参与指导研制成功的微波统一测控系统，在中国同步通信卫星发射和运行中发挥了很高的效用。1985年获国家科技进步奖特等奖。
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
    <%@include file="/templates/baidutongji.jsp" %></body>
</html>
