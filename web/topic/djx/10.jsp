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
			    <div id="introtitle">屠守锷</div>
			    <div id="introimg"><img src="people/10.jpg"></img></div>
			    <div class="introsubtitle">人物简介</div>
			    <div class="introcontent">屠守锷(1917-2012 )
浙江省湖州市人， 1917年生，男，中共党员，火箭技术和结构强度专家，中国科学院院士，国际宇航科学院院士。
1940年毕业于西南联合大学，1941年赴美国麻省理工学院航空工程系留学，获硕士学位。1945年回国后，先后在西南联合大学和清华大学任副教授、教授，1957年后，历任国防部五院研究室主任、总体设计部主任，七机部第一研究院副院长、总工程师、科技委副主任，航天部科技委副主任，航空航天工业部一院技术总顾问和航空航天部高级技术顾问。
</div>
			    <div class="introsubtitle">人物业绩</div>
			    <div class="introcontent">从50年代后期起，作为开创人之一，投身于中国导弹与航天事业。作为总体设计部主任和地空导弹型号的副总设计师，领导和参加中国地空导弹初期的仿制与研制。他先后担任中国自行研制的液体弹道式地地中近程导弹、中程导弹的副总设计师，洲际导弹和长征二号运载火箭的总设计师，带领科技人员突破了一系列技术关键，解决了许多技术难题。特别是在洲际液体弹道地地导弹的研制试验中，以坚实的理论基础和丰富的实践经验，提出独到的见解和解决问题的办法，保证了中国向太平洋预定海域发射洲际导弹任务的圆满完成。他作为研制长征二号E大型捆绑式运载火箭的技术总顾问，参与领导研制试验工作，保证发射成功，为中国航天事业的发展做出了重要贡献。1980年获七机部劳动模范称号，1984年荣立航天部一等功，获航天部劳动模范称号。1985年获国家科技进步奖特等奖。2012年12月15日05时05分，中国共产党的优秀党员，久经考验的忠诚的共产主义战士，我国航天事业的开拓者和奠基人之一，“两弹一星”功勋奖章获得者，著名导弹和火箭专家，中国科学院资深院士，国际宇航科学院院士，中国航天科技集团公司和中国航天科工集团公司高级技术顾问，国务院颁发的首批政府特殊津贴获得者屠守锷同志，因病医治无效在北京医院逝世，享年95岁。
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
