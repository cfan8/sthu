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
			    <div id="introtitle">黄纬禄</div>
			    <div id="introimg"><img src="people/9.jpg"></img></div>
			    <div class="introsubtitle">人物简介</div>
			    <div class="introcontent">黄纬禄(1916-2011 )
安徽省芜湖市人，1916年生，男，中共党员，火箭技术专家，中国科学院院士，国际宇航科学院院士。
早年求学于江苏省扬州中学，1940年毕业于中央大学电机系，1943年赴英国实习，1945年在伦敦大学帝国学院攻读无线电专业，获硕士学位。回国后，历任“东风一号”副总设计师兼控制系统总设计师、“东风二号”副总设计师、“东风三号”副总设计师、潜地固体战略导弹及陆基机动固体战略导弹总设计师，航天部总工程师、航天工业总公司高级技术顾问。2011年11月23日逝世。
</div>
			    <div class="introsubtitle">人物业绩</div>
			    <div class="introcontent">中国固体战略导弹的奠基人，在导弹武器系统总体及控制技术的理论和工程实践方面具有很深的造诣，对重大关键技术问题的解决、大型工程方案的决策、指挥及组织实施发挥了重要作用。50年代末，在中国涉及火箭技术相当多的学科和技术领域都处于空白状态下，他主持突破了中国液体战略导弹控制系统的仿制和改型设计难关，进而通过自行设计相继解决了远程、多级火箭的液体晃动、弹性弹体稳定、级间分离及各种制导、稳定方案的理论和工程技术问题，使中国液体战略导弹控制技术达到了新的水平。70到80年代，在没有任何外国实物和资料可借鉴的情况下，以独立自主、自力更生的精神，主持研制中国第一个潜地和地地固体机动战略导弹并获得成功，突破了水下发射、三轴稳定平台在运动基座上的调平及瞄准、导弹射击诸元的适时计算和装订、陆上机动车的研制及冷发射、高海情下导弹出水大姿态控制等一系列关键技术。1985年获国家科技进步奖特等奖。
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
