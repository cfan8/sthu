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
			    <div id="introtitle">周光召</div>
			    <div id="introimg"><img src="people/12.jpg"></img></div>
			    <div class="introsubtitle">人物简介</div>
			    <div class="introcontent">周光召院士1929年5月生于湖南省长沙市，1951年毕业于清华大学。1987年至1997年任中国科学院院长，现任全国人民代表大会常务委员会副委员长，中国科学技术协会主席，国务院学位委员会副主任，国家科技领导小组成员。
周光召教授先后被选为中国科学院院士，中国科学院学部主席团执行主席，中国国际交流协会副会长，中日友好二十一世纪中方委员，中国人民争取和平与裁军协会副会长，中国国际科技促进会副会长，海峡两岸人才交流协会名誉主席，国际粒子和场学会委员，国际纯粹和应用物理学会副主席，太平洋科学协会主席兼理事会主席，联合国教科文组织顾问委员会委员；被聘兼任清华大学理学院院长，2000年亚洲基金会名誉顾问，中国科学院特邀顾问等职。
</div>
			    <div class="introsubtitle">人物业绩</div>
			    <div class="introcontent">周光召教授在理论物理的各主要领域都有过杰出的创造性成果，使他在国际物理学界享有盛誉。因其为中国第一颗原子弹、氢弹的研制成功作出了重大贡献，于1964年获国家自然科学一等奖；因在量子场论的研究中有重大突破，1987年年获中国科学院重大科技成果奖一等奖。周光召教授还被美国纽约市立大学、香港中文大学、香港大学、加拿大麦吉尔大学四所世界知名大学授予荣誉博士；1993年被意大利政府授予“意大利共和国爵士勋章”，1994年被香港求是科技基金会授予“中国杰出科学家”奖，1996年经国际小行星命名委员会审议通过，将国际编号为3462号的小行星命名为“周光召星”。他目前是美国科学院、俄罗斯科学院、欧洲科学院、第三世界科学院、捷克科学院、保加利亚科学院、蒙古科学院、法语区工程师科学院、罗马尼亚科学院、韩国翰林院等11个国家和地区的科学院院士，是目前中国担任外籍院士头衔最多者。
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
