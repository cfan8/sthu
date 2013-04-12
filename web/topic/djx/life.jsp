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
			    <div id="introtitle">邓稼先的主要事迹</div>
			    <div class="introsubtitle">人物简介</div>
			    <div class="introcontent">邓稼先（1924—1986），中科院院士，著名核物理学家，为中国核武器、原子武器的研发做出了重要贡献。1924年6月25日出生于安徽省怀宁县一个书香门第的家庭。1999年，中共中央、国务院、中央军委给他追授了“两弹一星”功勋奖章。邓稼先历任中国科学院近代物理研究所助研、副研究员，二机部第九研究所理论部主任、第九研究院副院长、院长，国防科工委科技委副主任，核工业部科技委副主任等职；邓稼先还在中国共产党第十二次全国代表大会上被选为中央委员。<br/>邓稼先同志长年累月忘我工作，积劳成疾，身患癌症，于1986年7月29日在北京不幸逝世，终年62岁；邓稼先同志在弥留之际，他还用生命的智慧和最后一丝力气，与于敏合著了一份关于中国核武器发展的建议书，向祖国献上了一片真诚，该建议书的内容至今仍然保密。<br/>邓稼先是中国核武器研制与发展的主要组织者、领导者，在他逝世后13年，被追授为“两弹元勋”。邓稼先始终在中国武器制造的第一线，领导了许多学者和技术人员，成功地设计了中国原子弹和氢弹，把中华民族国防自卫武器引导到了世界先进水平。领导并亲自参与了1967年中国第一颗氢弹的研制和实验工作。<br/></div>
			    <div class="introsubtitle">人物生平</div>
			    <div class="introcontent"><span class="strong">求学报国</span><br/>他出生后不久，全家迁往北平，邓稼先父亲邓以蛰任清华大学及北京大学文学院教授，与杨振宁父亲杨武之是多年之交。两家祖籍都是安徽，在清华园里又成为邻居。邓稼先和杨振宁从小结下了深厚友情，后来，二人先后进了北平崇德中学。<br/>七七事变以后，端着长枪和刺刀的日本侵略军进入了北平城。不久北大和清华都撤向南方。邓稼先的父亲身患肺病，喀血不止，全家滞留下来。七七事变以后的十个月间，日寇铁蹄踩踏了从北到南的大片国土。亡国恨，民族仇，都结在邓稼先心头。<br/>邓稼先进入了国立西南联合大学，抗日战争胜利时，他拿到了毕业证书，在昆明参加了中国共产党的外围组织“民青”。翌年，他回到北平，受聘担任了北京大学物理系助教，并在学生运动中担任了北京大学教职工联合会主席。 <br/>抱着学更多的本领以建设新中国之志，他于1947年通过了赴美研究生考试，于翌年秋进入美国印第安那州的普渡大学研究生院——由于他学习成绩突出，不足两年便读满学分，并通过博士论文答辩。此时他只有26岁，人称“娃娃博士”。<br/><span class="strong">毅然回国</span><br/>这位取得学位刚9天的“娃娃博士”毅然放弃了在美国优越的生活和工作条件，回到了一穷二白的祖国，回国后，邓稼先在中国科学院近代物理研究所任助理研究员，1958年8月奉命带领几个大学毕业生从事原子核理论研究。<br/>1958年8月调到新筹建的核武器研究所任理论部主任，负责领导核武器的理论设计，随后任研究所副所长、所长，核工业部第九研究设计院副院长、院长，核工业部科技委副主任，国防科工委科技委副主任。在北京外事部门的招待会上，有人问他带了什么回来。他说：“带了几双眼下中国还不能生产的尼龙袜子送给父亲，还带了一脑袋关于原子核的知识。” 此后的八年间，他进行了中国原子核理论的研究。<br/>1953年，他与许鹿希结婚（许鹿希是五四运动重要学生领袖、是后来担任全国人大常委会副委员长,是许德珩的长女），1956年，邓稼先加入中国共产党。<br/><span class="strong">奇迹诞生</span><br/>1958年秋，二机部副部长刘杰找到邓稼先，说“国家要放一个‘大炮仗’”，征询他是否愿意参加这项必须严格保密的工作。邓稼先义无反顾地同意，回家对妻子只说自己“要调动工作”，不能再照顾家和孩子，通信也困难。从小受爱国思想熏陶的妻子明白，丈夫肯定是从事对国家有重大意义的工作，表示坚决支持。从此，邓稼先的名字便在刊物和对外联络中消失，他的身影只出现在严格警卫的深院和大漠戈壁。<br/>1964年10月，中国成功爆炸的第一颗原子弹，就是由他最后签字确定了设计方案。他还率领研究人员在试验后迅速进入爆炸现场采样，以证实效果。他又同于敏等人投入对氢弹的研究。按照“邓—于方案”，最后终于制成了氢弹，并于原子弹爆炸后的两年零八个月试验成功。这同法国用8年、美国用7年、苏联用10年的时间相比，创造了世界上最快的速度。<br/><span class="strong">鞠躬尽瘁</span><br/>1984年，他在大漠深处指挥中国第二代新式核武器试验成功；翌年，他的癌细胞扩散已无法挽救，他在国庆节提出的要求就是去看看天安门。1986年7月16日，国务院授予他全国“五一”劳动奖章；同年7月29日，邓稼先同志离开人世。他，是个把一生献给祖国的人。他临终前留下的话仍是如何在尖端武器方面努力，并叮咛：“不要让人家把我们落得太远……”<br/></div>
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
