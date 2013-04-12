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
	    <title>怀念邓稼先</title>
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
			邓稼先
		    </div>
		    <div id="content">
			<div id="intro">
			    <div class="text">
				<div class="title">人物简介</div>
				<div class="content">邓稼先（1924—1986），中科院院士，著名核物理学家，为中国核武器、原子武器的研发做出了重要贡献。1924年6月25日出生于安徽省怀宁县一个书香门第的家庭。1999年，中共中央、国务院、中央军委给他追授了“两弹一星”功勋奖章。邓稼先历任中国科学院近代物理研究所助研、副研究员……<a href="life.jsp" target="_blank" class="morelink">[阅读全文]</a></div>
			    </div>
			    <div class="img"><img src="img/0.png"></img></div>
			</div>
			<div id="study">
			    <div class="text">
				<div class="title">邓稼先的趣事轶闻</div>
				<div class="content">
				    <div class="sublink"><a href="story.jsp#0" target="_blank">邓稼先的兴趣爱好</a></div>
				    <div class="sublink"><a href="story.jsp#1" target="_blank">邓稼先的善举</a></div>
				    <div class="sublink"><a href="story.jsp#2" target="_blank">马兰村的诞生</a></div>
				    这里，每年农历的四五月间，马兰花遍地开放，像一片蓝色的火焰在戈壁上跳动、燃烧。有人说，这里的马兰花是张蕴钰将军乘坐的那匹马的马蹄从雪山草地……
				</div>
			    </div>
			    <div class="img"><img src="img/1.png"></img></div>
			</div>
			<div id="life">
			    <div class="title">家庭生活</div>
			    <div class="img"><img src="img/2.png"></img></div>
			    <div class="text">
				<div class="content">
				    <div class="sublink"><a href="home.jsp#0" target="_blank">邓稼先与母亲</a></div>
				    原子弹的冷试验后，邓稼先要远赴到青海的金银滩，于是回家向父母辞别⋯⋯
				    <div class="sublink"><a href="home.jsp#2" target="_blank">邓稼先与妻子</a></div>
				    邓稼先与夫人许鹿希婚后，经历了五年安逸幸福的时光⋯⋯
				    <div class="sublink"><a href="home.jsp#1" target="_blank">邓稼先与女儿</a></div>
				    邓稼先夫人许鹿希回忆：“我的女孩儿很有一股子钻研精神。她当初考上大学很不容易⋯⋯
				</div>
			    </div>
			</div>
		    </div>
		    <div id="moretitle">“两弹一星”元勋
		    </div>
		    <div id="morecontent">
			<div id="picdiv">
			    <div class="piccon"><div class="picmax"><a href="1.jsp" target="_blank"><img src="people/1.jpg"></img><div class="pictext">钱三强</div></a></div></div>
			    <div class="piccon"><div class="picmax"><a href="2.jsp" target="_blank"><img src="people/2.jpg"></img><div class="pictext">钱骥</div></a></div></div>
			    <div class="piccon"><div class="picmax"><a href="3.jsp" target="_blank"><img src="people/3.jpg"></img><div class="pictext">姚桐斌</div></a></div></div>
			    <div class="piccon"><div class="picmax"><a href="4.jsp" target="_blank"><img src="people/4.jpg"></img><div class="pictext">赵九章</div></a></div></div>
			    <div class="piccon"><div class="picmax"><a href="5.jsp" target="_blank"><img src="people/5.jpg"></img><div class="pictext">邓稼先</div></a></div></div>
			    <div class="piccon"><div class="picmax"><a href="6.jsp" target="_blank"><img src="people/6.jpg"></img><div class="pictext">王淦昌</div></a></div></div>
			    <div class="piccon"><div class="picmax"><a href="7.jsp" target="_blank"><img src="people/7.jpg"></img><div class="pictext">彭桓武</div></a></div></div>
			    <div class="piccon"><div class="picmax"><a href="8.jsp" target="_blank"><img src="people/8.jpg"></img><div class="pictext">程开甲</div></a></div></div>
			    <div class="piccon"><div class="picmax"><a href="9.jsp" target="_blank"><img src="people/9.jpg"></img><div class="pictext">黄纬禄</div></a></div></div>
			    <div class="piccon"><div class="picmax"><a href="10.jsp" target="_blank"><img src="people/10.jpg"></img><div class="pictext">屠守锷</div></a></div></div>
			    <div class="piccon"><div class="picmax"><a href="11.jsp" target="_blank"><img src="people/11.jpg"></img><div class="pictext">钱学森</div></a></div></div>
			    <div class="piccon"><div class="picmax"><a href="12.jsp" target="_blank"><img src="people/12.jpg"></img><div class="pictext">周光召</div></a></div></div>
			    <div class="piccon"><div class="picmax"><a href="13.jsp" target="_blank"><img src="people/13.jpg"></img><div class="pictext">杨嘉墀</div></a></div></div>
			    <div class="piccon"><div class="picmax"><a href="14.jsp" target="_blank"><img src="people/14.jpg"></img><div class="pictext">陈能宽</div></a></div></div>
			    <div class="piccon"><div class="picmax"><a href="15.jsp" target="_blank"><img src="people/15.jpg"></img><div class="pictext">陈芳允</div></a></div></div>
			    <div class="piccon"><div class="picmax"><a href="16.jsp" target="_blank"><img src="people/16.jpg"></img><div class="pictext">吴自良</div></a></div></div>
			    <div class="piccon"><div class="picmax"><a href="17.jsp" target="_blank"><img src="people/17.jpg"></img><div class="pictext">任新民</div></a></div></div>
			    <div class="piccon"><div class="picmax"><a href="18.jsp" target="_blank"><img src="people/18.jpg"></img><div class="pictext">孙家栋</div></a></div></div>
			    <div class="piccon"><div class="picmax"><a href="19.jsp" target="_blank"><img src="people/19.jpg"></img><div class="pictext">朱光亚</div></a></div></div>
			    <div class="piccon"><div class="picmax"><a href="20.jsp" target="_blank"><img src="people/20.jpg"></img><div class="pictext">王希季</div></a></div></div>
			    <div class="piccon"><div class="picmax"><a href="21.jsp" target="_blank"><img src="people/21.jpg"></img><div class="pictext">王大珩</div></a></div></div>
			    <div class="piccon"><div class="picmax"><a href="22.jsp" target="_blank"><img src="people/22.jpg"></img><div class="pictext">于敏</div></a></div></div>
			    <div class="piccon"><div class="picmax"><a href="23.jsp" target="_blank"><img src="people/23.jpg"></img><div class="pictext">郭永怀</div></a></div></div>
			</div>
		    </div>
		    <div id="showtitle">《邓稼先》剧照</div>
		    <div id="showcontent"><img src="img/show.png"></img></div>

		    <div id="flower">
		    </div>
		</div>
	    </div>
	</div>
	<div id="footer">

	</div>
	<script tyle="text/javascript">
	    $(window).load(function(){
		$(".picmax img").each(function(){
		    $(this).css("margin-left", 45 - $(this).width()/2 + "px");
		});
	    });
	</script>
	<%@include file="/templates/baidutongji.jsp" %>
<script type="text/javascript">
	enableBrowserDetect();
</script>
</body>
</html>
