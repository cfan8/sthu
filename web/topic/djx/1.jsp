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
			    <div id="introtitle">钱三强</div>
			    <div id="introimg"><img src="people/1.jpg"></img></div>
			    <div class="introsubtitle">人物简介</div>
			    <div class="introcontent">钱三强(1913-1992)，浙江省湖州市人，1913年生，男，中共党员，核物理学家，中国科学院院士。1936年毕业于清华大学物理系，后赴法国巴黎大学居里实验室和法兰西学院原子核化学实验室从事原子核物理研究工作，获博士学位，1946年荣获法国科学院亨利德巴微物理学奖金。1948年回国，历任清华大学物理系教授，北平研究院原子能研究所所长，中国科学院近代物理所（后改为原子能所）所长、计划局局长、副秘书长，二机部副部长、中国科学院副院长、中国物理学会理事长、中国核学会名誉理事长、中国科学院特邀顾问。于1992年逝世。</div>
			    <div class="introsubtitle">人物业绩</div>
			    <div class="introcontent">中国原子能事业的开拓者和奠基人之一。50年代领导建成中国第一个重水型原子反应堆和第一台回旋加速器，以及一批重要仪器设备。使中国的堆物理、堆工程技术、钎化学放射生物学、放射性同位素制备、高能加速器技术、受控热核聚变等科研工作，都先后开展起来。在苏联政府停止对中国的技术援助后，一方面迅速选调一批优秀核科技专家去二机部，直接负责原子弹研制中各个环节的攻坚任务，一方面会同中国科学院有关领导人，组织联合攻关。使许多关键技术得到及时解决，为第一颗原子弹和氢弹的研制成功作出重要贡献。早在1960年，即在原子能所组织中子物理理论与实验两个研究组开展氢弹的预工作，为氢弹研制作了理论准备，促成了中国在第一颗原子弹爆炸后仅两年零八个月，就研制成了氢弹。</div>
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
