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
			    <div id="introtitle">赵九章</div>
			    <div id="introimg"><img src="people/4.jpg"></img></div>
			    <div class="introsubtitle">人物简介</div>
			    <div class="introcontent">赵九章(1907-1968)
浙江省吴兴县人，1907年生，男，地球物理学家，中国科学院学部委员。
1933毕业于清华大学物理系。1935年赴德国攻读气象学专业，1938年获博士学位，同年回国。历任西南联合大学教授，中央研究院气象研究所所长。中华人民共和国成立后，任中国科学院地球物理所所长、卫星设计院院长，中国气象学会理事长和中国地球物理学会理事长。1968年逝世。
</div>
			    <div class="introsubtitle">人物业绩</div>
			    <div class="introcontent">中国人造卫星事业的倡导者和奠基人之一。从1957年起，他积极倡议发展中国自己的人造卫星。1958年8月，中国科学院成立人造地球卫星研制组，他是主要负责人。同年10月，提出“中国发展人造卫星要走自力更生的道路，要由小到大，由低级到高级”的重要建议。在他领导下，开创了利用气象火箭和探空火箭进行高空探测的研究，探索了卫星发展方向，筹建了环境模拟实验室和开展遥测、跟踪技术研究，组建了空间科学技术队伍。1964年，根据国内运载工具的发展，他提出了开展人造地球卫星研制工作的建议。他对中国卫星系列发展规划和具体探测方案的制定，对中国第一颗人造地球卫星、返回式卫星等总体方案的确定和关键技术的研制，起了重要作用。在他的领导下还完成了核爆炸试验的地震观测和冲击波传播规律以及有关弹头再入大气层时的物理现象等研究课题。1985年获国家科技进步奖特等奖。
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
