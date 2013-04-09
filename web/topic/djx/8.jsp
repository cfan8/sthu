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
			    <div id="introtitle">程开甲</div>
			    <div id="introimg"><img src="people/8.jpg"></img></div>
			    <div class="introsubtitle">人物简介</div>
			    <div class="introcontent">程开甲(1918- )
江苏省吴江市人，1918年生，男，中共党员，核武器技术专家，中国科学院院士。
1941年毕业于浙江大学物理系，1946年赴英国爱丁堡大学留学、工作，1948年获博士学位后任英国皇家化学工业研究所研究员。1950年回国，历任浙江大学、南京大学副教授、教授，二机部核武器研究所副所长、核武器研究院副院长，国防科工委核试验基地研究所副所长、所长、基地副司令员、科技委常任委员、顾问。现任中国人民解放军总装备部科技委顾问。
</div>
			    <div class="introsubtitle">人物业绩</div>
			    <div class="introcontent">中国第一颗原子弹研制的开拓者之一，中国核武器试验事业的创始人之一。在国内第一个计算出原子弹爆炸的弹心温度和压力，其内爆机理研究解决了原子弹的关键问题，为原子弹爆炸威力、弹体结构设计提供了重要依据。他创建了核试验研究所，成功地设计和主持了首次原子弹、氢弹、导弹核武器和增强型原子弹等不同方式的几十次核试验，推动了核武器设计、改进和试验技术协调发展。他是核试验总体技术的设计者，及时提出了向地下核试验方式转变的建议并在较短的时间里组织实现了大气层试验向平洞与竖井试验的转变。创立中国自己的系统核爆炸及其效应理论，为我军的核武器应用奠定了基础。开创了核爆炸的测试研究，对武器的研制及改进、效应及其防护研究起到重要作用。开创了抗核加固技术新领域并完成首次抗加试验。1985年获国家科技进步奖特等奖。
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
