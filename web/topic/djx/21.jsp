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
			    <div id="introtitle">王大珩</div>
			    <div id="introimg"><img src="people/21.jpg"></img></div>
			    <div class="introsubtitle">人物简介</div>
			    <div class="introcontent">王大珩(1915- 2011)
江苏省吴县市人，1915年生，男，中共党员，光学专家，中国科学院院士，中国工程院院士。
1936年毕业于清华大学物理系。1938年赴英留学，攻读应用光学专业，获硕士学位。1942年被英国伯明翰昌斯公司聘为助理研究员。1948年回国，历任大连大学教授，中国科学院仪器馆馆长，长春光机所所长，中国科学院长春分院院长，国防科委十五院副院长（兼），中国光学学会理事长，中国科学院技术科学部主任，国防军工科学研究委员会副主任。
</div>
			    <div class="introsubtitle">人物业绩</div>
			    <div class="introcontent">中国现代国防光学技术及光学工程的开拓者和奠基人之一。在他领导下，开拓与发展了靶场光学测试技术、激光技术及太阳地面模拟等国防光学技术领域。为配合中国中程地地导弹发射实验，中国科学院承担研制大型精密靶场光测设备的任务，他任总工程师，提出工程总体方案，解决关键技术问题，一次研制成功，性能达到当时同类仪器的国际水平，满足了国防尖端武器试验的急需。继而在G179、718经纬仪和船体变形测量系统，170跟踪望远镜，331电影经纬仪等研制任务中，对总体方案和技术路线进行指导，解决了许多关键技术问题。他对国家光学技术领域的长远发展规划的制定，研究方向、研制任务的确定，技术基础的建议等方面，做了大量筹划决策、组织领导和技术指导工作，并积极倡导建立研究——发展——小批量生产一体化的体制。2011年7月21日13时02分因病在北京逝世，享年96岁。
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
