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
			    <div id="introtitle">姚桐斌</div>
			    <div id="introimg"><img src="people/3.jpg"></img></div>
			    <div class="introsubtitle">人物简介</div>
			    <div class="introcontent">姚桐斌(1922-1968)
江苏省无锡市人，1922年生，男，中共党员，冶金学和航天材料专家。
1945年毕业于交通大学唐山工学院（西南交通大学），1947年赴英国伯明翰大学工业冶金系留学，1951年获博士学位，1954年赴联邦德国亚亨工业大学冶金系铸造研究室任研究员兼教授助理。1957年回国后，历任国防部第五研究院一分院材料研究室研究员、主任，材料研究所所长。1968年逝世。
</div>
			    <div class="introsubtitle">人物业绩</div>
			    <div class="introcontent">作为中国第一代航天材料工艺专家和技术领路人，对现代冶金学有关金属和合金粘性、流动性的研究卓有成绩。1962年组织制定了国防部五院材料工艺的研究方向，并按“材料要先行”的要求，安排组织材料工艺的预先研究。在此前后的4年中，他除向国内各兄弟单位提出大量研究课题外，在所内开展的研究课题500多项。领导和指导锰基钎料合金的研制和钎焊工艺研究课题，研制成国产一号及二号锰基钎料，并以钎焊结构取代了中国液体火箭发动机的老式焊接结构。主持了液体火箭发动机材料的振动疲劳破坏问题和液体火箭焊接结构的振动疲劳破坏问题的研究，并应用到型号的研制工作上，对火箭部件的设计、选材和制造起了指导性的作用。他治学严谨，以身作则，为科研人员培养和作风建设作出了重要贡献。1985年获国家科技进步奖特等奖。
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
