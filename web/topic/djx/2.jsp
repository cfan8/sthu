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
			    <div id="introtitle">钱骥</div>
			    <div id="introimg"><img src="people/2.jpg"></img></div>
			    <div class="introsubtitle">人物简介</div>
			    <div class="introcontent">钱骥(1917-1983)
江苏省金坛市人，1917年生，男，中共党员，空间技术和空间物理专家。
1943年毕业于中央大学师范学院。1949年后，历任中国科学院地球物理研究所室副主任、主任，二部卫星设计院业务负责人。1968年以后，历任七机部第五研究院卫星总体设计部主任，第五研究院副院长、科技委副主任。中国宇航学会理事，中国空间科学学会副理事长。1983年逝世。
</div>
			    <div class="introsubtitle">人物业绩</div>
			    <div class="introcontent">中国空间技术的开拓者之一。领导卫星总体、结构、天线、环境模拟理论研究。负责与组织小型热真空环境模拟试验设备、中小型离心机、振动台设备的研制。负责领导探空火箭头部空间物理探测仪器、跟踪定位和数据处理设备的研制，获得丰富的试验资料。参与制定星际航行发展规划，提出多项有关开展人造卫星研制的新技术预研课题，为中国空间技术早期的发展做了很多开拓性工作。1965年提出《中国第一颗人造卫星方案设想》的报告。组织编写《中国卫星系列发展规划纲要设想》，组织并提出预研课题，为人造卫星研制打下了初步的技术基础。负责组建卫星总体设计机构，是中国第一颗卫星东方红一号方案的总体负责人。同时为回收型卫星的研制做了大量技术和组织领导工作。1964年获国家科技进步奖二等奖。1985年获国家科技进步奖特等奖。
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
