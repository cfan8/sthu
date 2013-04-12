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
			    <div id="introtitle">吴自良</div>
			    <div id="introimg"><img src="people/16.jpg"></img></div>
			    <div class="introsubtitle">人物简介</div>
			    <div class="introcontent">吴自良(1917- 2008)
浙江省浦江县人，1917年生，男，物理冶金学家，中国科学院院士。
1937年毕业于天津北洋大学工学院航空工程系，后在云南垒允中央飞机厂、昆明中央机器厂任设计师、工程师。1943年赴美国匹兹堡卡内基理工学院冶金系学习获理学博士学位，后任该校金属研究所博士后研究员，1949年任锡腊丘斯大学材料系主任研究工程师。1950年底回国，1951年任北方交通大学冶金系教授，中国科学院上海冶金陶瓷所（后为上海冶金所）副所长、所学术委员会主任。
</div>
			    <div class="introsubtitle">人物业绩</div>
			    <div class="introcontent">1954年领导完成了中央军委下达的抗美援朝前方需要的特种电阻丝研制任务，获得奖励。50年代，用国内富产元素锰、铝等代替短缺的铬，研制苏联40X低合金钢的代用钢取得成功，对建立中国合金钢系统起了开创作用。60年代，在困难的条件下，冶金所承担气体扩散法分离铀同位素用的“甲分离膜的制造技术”任务，与原子能所、复旦大学等单位的科研人员联合攻关，组成第十研究室，他兼任该室主任，主持这项工作。在他的领导下，经过艰苦探索和反复试验，于1964年试制成功并投入使用。1984年获国家发明奖一等奖。
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
