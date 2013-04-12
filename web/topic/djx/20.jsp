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
			    <div id="introtitle">王希季</div>
			    <div id="introimg"><img src="people/20.jpg"></img></div>
			    <div class="introsubtitle">人物简介</div>
			    <div class="introcontent">王希季(1921- )
云南省大理市人，1921年生，男，白族，中共党员，卫星和卫星返回技术专家，中国科学院院士，国际宇航科学院院士。
1942年毕业于西南联合大学机械工程系。1948年赴美国弗吉尼亚理工学院研究院留学，获硕士学位。1950年回国，先后在大连工学院、上海交通大学、上海科技大学任副教授、教授。1965年后，历任七机部第五研究院副院长、科技委主任，航天工业部总工程师等职。
</div>
			    <div class="introsubtitle">人物业绩</div>
			    <div class="introcontent">中国早期从事火箭技术研究的组织者之一，是中国第一枚液体燃料火箭及其后的气象火箭、生物火箭和高空试验火箭的技术负责人，倡导并参与发展无控制火箭技术和回收技术两门新的学科。他创造性地把我国探空火箭技术和导弹技术结合起来，提出中国第一枚卫星运载火箭的技术方案。主持长征一号运载火箭和核试验取样系列火箭的研制。作为返回式卫星的总设计师，负责制定出立足国内技术和工业基础而又能达到国际先进水平的研制方案。在他主持下大量采用新技术并突破一系列技术关键，使卫星增大了功能，延长了寿命，使中国卫星返回技术达到国际先进水平，成为世界仅有的掌握此项高技术的三个国家之一。1982年荣立航天部一等功，1985年和1990年各获一项国家科技进步奖特等奖，1987年获国家科技进步奖二等奖。
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
