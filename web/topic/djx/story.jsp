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
			    <div id="introtitle">邓稼先的趣闻轶事</div>
			    <div class="introsubtitle"><a id="0"></a>邓稼先的兴趣爱好</div>
			    <div class="introcontent">邓稼先小时候放风筝、抖空竹，在同学中技高一筹。一般的空竹不过瘾了，就找带把的茶壶、茶碗盖来玩。什么奇形怪状的东西都难不倒他。他还非常喜欢弹玻璃球。弹球要算好角度，指法要熟巧。爱弹玻璃球的孩子，也都爱积攒玻璃球。要是得到一两个嵌着五颜六色心柱的弹球，那真是心爱之极。因为过分贪玩，到了天完全黑下来，这一帮小球迷才不得不各自回家。在灯下，母亲一边用小毛刷子替他洗手，一边骂着：“你这一双黑爪子，真该用菜刀把它剁掉。”邓稼先默默地听着，母亲嘴里不停地骂，手却在不停地洗，他明白，母亲心疼他。在读书之余的空暇时间，他依然是随心所欲。有时候别的东西玩腻了，他就喜欢用双手吊在门框上，身子来回摆动，享受着打秋千所特有的乐趣。他能够由慢到快，再由快到慢地悠出一种节奏来，有时甚至靠着双腿凭空蹬踹和腹肌的收缩来实现变奏。这还不够，每在悠摆中见到有熟识的人来，他总要边打秋千边报来客的姓名。一次恰巧就遇上了许德珩教授和夫人劳君展来访。许夫人对这个活泼的孩子留下了深刻的印象．而她自然不会知道，这个顽童日后竟是她成大事业的女婿。</div>
			    <div class="introsubtitle"><a id="1"></a>邓稼先的善举</div>
			    <div class="introcontent">原子弹攻关过程中，食堂的饭碗由大碗变成小碗，每人每天嚼一颗“大力丸”，这就是“特供”。昔日，砍高粱、盖楼房的年轻人开始浮肿了。他们常常在紧张地运算之后，有气无力地呼唤着：<br/>“老邓，我们饿，我们好饿呀！”<br/>这时，邓稼先便会一迭声地应着：“好的，你们等着，我这就想办法去！”<br/>不一会儿，邓稼先从街上拎回一包高价饼干。于是，大家便一窝蜂似的围住他，一包饼干，霎时便变成腹中之物，而此时引出的往往是更强烈的饥肠辘辘声。<br/>年轻人最盼望的是突破某一难题，此时不仅可以得到精神上的满足，而且，老邓会高兴地招呼大家：“伙计们，都推车子去！”人们都明白，那就是进城，老邓请客，搓一顿！<br/>要知道，那时除了凭票供应的商品外，其他都是高价，有些紧缺的食品，可以说是“天价”。这样的举动，给老邓带来的是严重的经济危机。<br/>再以后，这样的善举老邓是办不起了。但是，每当大家再研究上有所突破时，他总想有所表示。这是，他不再大声招呼大家了，而是悄悄地溜出去，买几个高价烧饼来丢给大家，人们问他你还吃不吃？他只是笑着嘟哝一句，给我留一口就行。<br/></div>
			    <div class="introsubtitle"><a id="2"></a>马兰村的诞生</div>
			    <div class="introcontent">马兰，原是核试验基地初创时期的一个生活点，中国最大比例的地图挂图上也找不到它。但它却日益繁荣，生机盎然地矗立在戈壁滩上。<br/>提起这个镇子(后更名为市)，不能不想到张蕴钰将军。是张蕴钰将军率领着那支在朝鲜战场上力克美国王牌军的志愿军队伍，归国后，径直开往这茫茫戈壁，建起了这座原子城，建起了这座现代化的核试验场。<br/>这里，每年农历的四五月间，马兰花遍地开放，像一片蓝色的火焰在戈壁上跳动、燃烧。有人说，这里的马兰花是张蕴钰将军乘坐的那匹马的马蹄从雪山草地上带来的花籽落地生根的，不然它们为什么都长在马蹄窝里呢?是的，这里的一草一木似乎都和张蕴钰将军有关。<br/>当初张蕴钰将军为什么会选定这样的地方，作为中国核武器试验基地的呢?<br/>原来，苏联专家小组的意见，是把核试验基地设立在距我国古文化宝库的敦煌古城五十公里的地方，这使得我们的将军大为惊讶。想想看，若在那里进行一万当量的核爆炸试验，强大的冲击波和大量放射性微尘，将对历史悠久的文化古城和富饶的河西走廊?造成多大的危害呀!于是，将军摇摇头，摊开了地图，指着一块盆地说道：<br/>“要把基地的试验场区建立在戈壁大沙漠的中心地带!”<br/>一位苏联专家瞪大了眼睛笑着说道：<br/>“好吧，那样，你们的事业将会像沙子一样，永远不会发芽、开花的……”<br/>张蕴钰将军不信邪。他跨上骏马，率领骆驼队出发了。沿着古驿道足足走了一个半月，挺进到大戈壁腹地去勘察。<br/>在断水后的第三天早晨，当他们从焦渴的梦中醒来寸，突然听到了百灵鸟的鸣啭，看见蜂飞蝶舞。将军立即跨马上路，带领驼队，随蜂蝶的翅膀前进，终于找到了一片草地。张蕴钰将军勒马望去，只见绿茵如毯的草地上，一簇簇、一片片蓝色的花朵，像燃烧着的蓝色火焰，迎着阳光怒放。那彩蝶金蜂正是奔着这蓝色的花朵而来。<br/>将军下马仔细辨认，噢!原来这里开满了马兰花呀!几十双眼睛一下子亮了，有花的地方便有水。于是，他们又寻到了正在“咕咕”喷涌的泉水。将军和战士们俯下身来，用手掬着泉水送到嘴边，当尝到那水的甘甜后，都痛痛快快地畅饮起来。张蕴钰抹了抹下巴上的水珠，将马鞭往地上一插，大声说道：<br/>“好!核试验基地就设在这里!”<br/>测绘员摊开地图犯难了：“标上什么名字呢?”<br/>将军捧着一束马兰花，倾吐满怀诗情：“万顷黄沙一点蓝，就叫马兰村吧!”<br/>将军还给这口泉水命名。因为它是从甘草丛生的地方流出来的，所以就叫它“甘草泉”。<br/>于是，我国的核试验基地就在马兰诞生了。<br/></div>
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
