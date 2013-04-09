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
			    <div id="introtitle">王淦昌</div>
			    <div id="introimg"><img src="people/6.jpg"></img></div>
			    <div class="introsubtitle">人物简介</div>
			    <div class="introcontent">王淦昌 (1907-1998)
江苏省常熟县人， 1907年生，男，中共党员，核物理学家，中国科学院院士。
1929年毕业于清华大学物理系。1930年赴德国柏林大学留学，1934年获哲学博士学位，同年回国。曾任山东大学、浙江大学教授。1950年5月以后，历任中国科学院近代物理研究所研究员、副所长，苏联杜布纳联合核子研究所副所长，二机部第九研究所副所长、第九研究院副院长，二机部副部长兼原子能研究所所长，核工业部科技委副主任，中国科学技术协会第2届全国委员会副主席，中国物理学会副理事长，中国核学会第一届理事长，第3、4、5、6届全国人大常委会委员。1998年逝世。
</div>
			    <div class="introsubtitle">人物业绩</div>
			    <div class="introcontent">核武器研制的主要科学技术领导人之一，核武器研究实验工作的开拓者。在从事核武器研制期间，指导并参加了中国原子弹、氢弹研制工作。他是原子弹冷试验技术委员会主任委员，指导了中国第一次地下核试验，领导并具体组织了中国第二、三次地下核试验。主持指导的爆轰物理试验、炸药工艺、近区核爆炸探测、抗电磁干扰、抗核加固技术和激光模拟核爆炸试验等方面都取得重要成果。1964年他与苏联著名科学家巴索夫同时独立地提出激光惯性约束核聚变的新概念。他是中国惯性约束核聚变研究的奠基者。积极促成建立了高功率激光物理联合实验室并一直指导惯性约束核聚变的研究。积极指导原子能研究所开展电子束泵浦氟化氢激光器等的研究。1982年获国家自然科学奖一等奖，1985年获两项国家科技进步奖特等奖。
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
