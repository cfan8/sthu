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
			怀念邓稼先
		    </div>
		    <div id="introcontent"><div id="introbg">
			    <div id="introtitle">邓稼先的家庭生活</div>
			    <div class="introsubtitle"><a id="0"></a>邓稼先与母亲</div>
			    <div class="introcontent">1963年初春，原子弹的冷试验成功之后，邓稼先所在的九院要远迁到青海的金银滩。邓稼先接到通知后，急忙奔回家向父母辞别。没有带妻儿，没有像往日为父亲按摩，为母亲捶背，哄双亲欢笑。他忍着眼中的泪水，用低沉的声音告诉父母，他要出一趟远门。<br/>1964年10月，当我国的第一颗原子弹爆发出惊天巨响，邓稼先喜极而泣，热泪长流。在西南联大时，他就开始咏唱的“千秋耻，终当雪，中兴业，须人杰”，今天终于实现了。此生的价值、曾有过的艰辛和奋斗都变得有了光辉，人生多么美好！此刻多么幸福！<br/>正当他沉浸在欢乐与自豪之中，九院党委书记刁君寿找到他，塞给他一张机票，低声说：“你母亲病危。”<br/>邓稼先仿佛瞬间掉进了冰窟。领导派了两名司机连夜送他到乌鲁木齐机场。当他赶回北京，守候在西郊机场的妻子带着他直奔医院。憔悴、消瘦的母亲浑身插满管子。邓稼先扑上去，抓住母亲的手哭喊：“妈妈，我回来了，我在这儿。”<br/>弥留之际的母亲微微睁了一下双眼，她已经无法说话，失神的目光里，似乎透着欣喜。母亲那只被邓稼先握着的手，突然在他的手上轻轻地捏了一下，邓稼先一阵欢喜，赶紧回应。当他发现母亲的枕边，有一份刊登着第一颗原子弹成功爆炸的号外。邓稼先感激地望着妻子，眼中饱含热泪。邓稼先守候在母亲的床边，内心充满愧疚。3天后，母亲与世长辞。<br/></div>
			    <div class="introsubtitle"><a id="1"></a>邓稼先与女儿</div>
			    <div class="introcontent">邓稼先夫人许鹿希回忆：“我的女孩儿很有一股子钻研精神。她当初考上大学很不容易。她小学五年级的时候赶上‘文革’，后来到内蒙兵团去，非常艰苦，在那儿呆了6年，回来以后在皮箱厂工作。他们连队里快400人，只有3个人考上大学，我女孩儿就是其中之一。她中学整个没上。中文和英文我平常还是帮她一些的，可是最难的就是数理化。<br/>就在这个时候，邓稼先恰好有一个工作需要在北京呆三个月，那三个月就是在这边不断地研究、计算。现在想想，1958年底离开北京，20年后有3个月的时间在北京，真是奇迹发生的3个月。<br/>这3个月里，白天女儿去工厂上班，邓稼先去工作。晚上我女儿5点多下班，回来让她赶紧吃饭，吃完饭，她睡一觉，睡到11点多，邓稼先回来了，然后把女儿叫起来，邓稼先给她讲物理，从初中一直讲到高中。<br/>大概是1978年春节以后，邓稼先和女儿每天晚上都是从11点干到凌晨2点或3点。然后，让女儿再睡一觉，到了6点钟左右起来去工厂上班，就这样拼命地干。<br/>那时候，晚上我们这大院里经常放电影，吵得不得了，有时候要放到半夜1点钟才停，他们俩就把所有的门窗都关上。邓稼先一丝不苟地讲，讲得非常清楚。女儿有时候说，爸爸，我实在听不下去了，闹得这么厉害，你怎么还能够这么专心地讲。听着女儿的问话，邓稼先说‘结庐在人境，而无车马喧。问君何能尔，心远地自偏’。<br/>就这样，他们父女俩干了3个月，她的物理上去了。”<br/></div>
			    <div class="introsubtitle"><a id="2"></a>邓稼先与妻子</div>
			    <div class="introcontent">邓稼先与夫人许鹿希婚后，经历了五年安逸幸福的时光。 <br/>一切的改变，来自那个宏大的国家战略，他匆匆地与她告别，然后便人间蒸发般没了音信。那一年，她30岁，女儿只有4岁，儿子还在呀呀学语。<br/>她不知道他去了哪儿，去干什么了，她不知道如何与他联系，她能做的，只有等待，遥遥无期。 <br/>及至罗布泊的上空腾起一朵巨大的蘑菇云，她才知道，他去研究原子弹了。她理解他的沉默，原谅了他对自己的守口如瓶。<br/>她天真的以为，他的任务完成了，然而她却不知，原子弹之后，是氢弹，氢弹之后，是中子弹，等他将所有这些研究完成后，时间已经整整过去了28年。<br/>28年后，他回来了。他走时，还是个风华正茂的青年，回来时，却已是鬓染霜华，并且，他回到她的身边，不是因为他可以休息了，而是，他患了绝症。 <br/>1985年7月31日到1986年7月29日，是他们相处的最后的日子，结婚33年，他们却只在一起呆了六年。而且，最后这一年于她，不是幸福，而是折磨。 从他住进医院到他辞世，363个日日夜夜里，心疼是那个女人唯一的表情。 <br/>多年以后，她已经淡忘了那份痛苦。只是静静地守候着属于他们的一切。家里摆设，还是他在世时的模样，连他坐过的沙发上的毛巾都没有换过。 在她的感觉里，他仿佛从未离开，他只是像以前那样去了大漠戈壁，他那爽朗的笑声和他那矫健的身姿，早已深深地扎根在她心底最温柔的地方，出现在她依旧年轻的梦里。<br/></div>
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
