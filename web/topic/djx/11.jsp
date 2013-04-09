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
			    <div id="introtitle">钱学森</div>
			    <div id="introimg"><img src="people/11.jpg"></img></div>
			    <div class="introsubtitle">人物简介</div>
			    <div class="introcontent">钱学森(1911-2009 )
浙江省杭州市人，1911年生，男，中共党员，空气动力学家，中国科学院院士，中国工程院院士。
1934年毕业于上海交通大学，1935年赴美国麻省理工学院留学，翌年获硕士学位，后入加州理工学院，1939年获航空、数学博士学位后留校任教并从事应用力学和火箭导弹研究。1955年回国后，历任中国科学院力学所所长，国防部第五研究院副院长、院长，七机部副部长，国防科委副主任，国防科工委科技委副主任，第3届中国科协主席，第6至8届全国政协副主席，中共第9至12届中央候补委员。现任中国人民解放军总装备部科技委高级顾问，中国科学技术协会名誉主席。
</div>
			    <div class="introsubtitle">人物业绩</div>
			    <div class="introcontent">1956年提出《建立中国国防航空工业意见书》，最先为中国火箭导弹技术的发展提出了极为重要的实施方案。协助周恩来、聂荣臻筹备组建火箭导弹研制机构——国防部第五研究院，1956年10月任该院院长。此后长期担任中国火箭导弹和航天器研制的技术领导职务，并以他在总体、动力、制导、气动力、结构、材料、计算机、质量控制和科技管理等领域的丰富知识，为中国火箭导弹和航天事业的创建与发展作出了杰出的贡献。1957年获中国科学院自然科学一等奖，1979年获美国加州理工学院杰出校友奖，1985年获国家科技进步奖特等奖。1989年获小罗克维尔奖章和世界级科学与工程名人称号，1991年被国务院、中央军委授予“国家杰出贡献科学家”荣誉称号和一级英模奖章。
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
