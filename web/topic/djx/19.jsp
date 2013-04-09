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
			    <div id="introtitle">朱光亚</div>
			    <div id="introimg"><img src="people/19.jpg"></img></div>
			    <div class="introsubtitle">人物简介</div>
			    <div class="introcontent">朱光亚(1924- 2011)
湖北省武汉市人，1924年生，男，中共党员，核物理学家，中国科学院院士，中国工程院院士。2011年2月26日逝世
1945年毕业于西南联合大学物理系。1946年赴美国密执安大学从事实验核物理研究工作，获物理学博士学位后于1950年春回国。历任北京大学、东北人民大学（现吉林大学）副教授、教授，二机部原子能研究所研究员、研究室副主任，核武器研究所副所长、核武器研究院副院长，国防科委副主任，国防科工委科技委副主任、主任，第4届中国科学技术协会主席，中国工程院首任院长、党组书记。第8届全国政协副主席、党组成员，中共第9届、第10届中央候补委员，11至14届中央委员。国务院学位委员会副主任委员。现任第9届全国政协副主席，中国人民解放军总装备部科技委主任，中国科学技术协会名誉主席。
</div>
			    <div class="introsubtitle">人物业绩</div>
			    <div class="introcontent">1957年从事核反应堆的研究工作，领导设计、建成轻水零功率装置并开展了堆物理试验，跨出了中国自行设计、建造核反应堆的第一步。他是中国核武器研制的科学技术领导人，负责并领导中国原子弹、氢弹的研制工作。1962年主持编写的《原子弹装置科研、设计、制造与试验计划纲要及必须解决的关键问题》，对争取在两年内实现第一次原子弹爆炸试验的目标起了重要作用。参与组织领导中国历次原子弹、氢弹的试验，为“两弹”技术突破及其武器化工作作出了重大贡献。70年代以来参与组织秦山核电站筹建和放射性同位素应用开发研究，80年代后参与国家高技术研究发展计划的制定与实施、国防科技发展战略研究工作。1985年获国家科技进步奖特等奖。2011年被评为感动中国十大人物之一。
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
