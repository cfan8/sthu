<%-- 
    Document   : user_home
    Created on : 2013-9-11, 10:38:43
    Author     : xiaobo
--%>

<%@page import="java.util.List"%>
<%@page import="cn.edu.tsinghua.sthu.action.UserHomeAction"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.message.UserHomeMessage"%>
<%@page import="cn.edu.tsinghua.sthu.entity.FollowEntity"%>
<%@page import="cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    UserHomeMessage message = Util.getMessage(UserHomeAction.class);
    List<UserEntity> groups = message.getInterestGroups();
    List<Integer> groupsFollowNumbers = message.getGroupsFollowNum();
    List<FollowEntity> ticketList = message.getTicketList();
    List<StudentActivityApplyEntity> ticketApplyList = message.getTicketApplyList();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>我的学生清华</title>
          <link rel="stylesheet" href="/css/home/reset.css" />
          <link rel="stylesheet" href="/css/home/layout.css" media="screen" />
          <link rel="stylesheet" href="/css/home/calendar.css" />
          <link rel="stylesheet" href="/css/home/home.css" />
          <link rel="stylesheet" href="/css/home/defaults.css" />
          <link rel="stylesheet" href="/css/home/font-awesome.min.css" />
        <script src="/js/calendar.js"></script>
    </head>
    
    <%@include file="/templates/new_general_header.jsp" %> 
    <section class="body">
		<!-- 我的学清区块 -->
		<section class="my">
			<label id="datelabel" class="date"></label>
			<h1>我的学清</h1>
			<h2>你好！<%=message.getUsername()%></h2>
                        
                        <p>
				<label>学生活动申请：<%=message.getApplyNum()%></label><label>订票：0</label><label>关注：<%=message.getFollowActivityNumber()%></label>
			</p>
   
		</section>
		<br class="vertical-padding" />
		<!--[if IE]><section class="triangle-handle"></section><table><tr><td rowspan="3"><![endif]-->
		<!--[if !IE]> -->
		<section class="horiz-layout">
			<!-- <![endif]-->
			<section class="block calendar large"></section>
			<!--[if IE]></td><td class="vert-padding" rowspan="3"></td><td><![endif]-->
			<!--[if !IE]> -->
			<section class="vert-layout auto-width">
				<!-- <![endif]-->
				<section class="block follows">
					<h1>关注</h1>
					<ul>
                                            <%if(groups.size() == 0){%>
                                            您没有关注组织。
                                            <%}%>
                                            <%for(int i = 0; i < groups.size(); i ++){
                                                UserEntity group = groups.get(i);
                                                int followNum = groupsFollowNumbers.get(i);
                                            %>
						<li><button class="followed">已关注</button> <a href="/showGroupHome.do?groupId=<%=group.getID()%>"> 
                                                        <%if(group.getLogoImg() != null  && group.getLogoImg().compareTo("null") != 0){%>
                                                        <img src="<%=group.getLogoImg()%>" />
                                                        <%}else{%>
                                                        <img src="/images/logo.jpg">
                                                        <%}%>
								<h1><%=group.getNickname()%></h1> <span>已有<%=followNum%>人关注</span>
						</a></li>
                                            <%}%>
					</ul>
				</section>
				<!--[if IE]></td></tr><tr><td class="hori-padding"></td></tr><tr><td><![endif]-->
				<section class="hots block" style="background-color:#FDB53B;">
				<div style="border-bottom: 1px solid white;">	
                                    <h2>热点推荐</h2>
                                </div>
					<iframe style="border:none;width:240px; height:170px;" id="frame1" src="/studentActivity/showHotActivities.do"></iframe>
				</section>
				<!--[if IE]></td></tr><tr><td class="hori-padding" colspan="3"><section class="triangle-handle"></section></td></tr><tr><td><![endif]-->
				<!--[if !IE]> -->
			</section>
		</section>
		<br class="horiz-padding" />
		<section class="horiz-layout">
			<!-- <![endif]-->
			<section class="block classroom-applicant">
				<h2>我的学生活动申请<div style="float: right;font-size:14px;margin-right: 50px;"><a href="/studentActivity/applyStudentActivity.do">申请学生活动</a></div></h2>
                                
                                <iframe id="frame1" style="border: none; width: 500px;" src="/studentActivity/showMyStudentActivityApply.do?type=1"></iframe>
			</section>
			<!--[if IE]></td><td class="vert-padding"></td><td><![endif]-->
			<section class="block auto-width" style="overflow: auto;">
				<h2>我的订票</h2>
                                <%for(int i = 0; i < ticketList.size(); i ++){
                                    FollowEntity ticket = ticketList.get(i);
                                    StudentActivityApplyEntity ticketApply = ticketApplyList.get(i);
                                %>
                                    <li>
                                        <a href="studentActivity/showStudentActivityDetail.do?activityID=<%=ticket.getActivityID()%>"><%=ticketApply.getActivityTheme()%></a>&nbsp;
                                        <%if(ticket.getTicketStatus() == FollowEntity.TICKET_STATUS_WAIT){%>
                                        等待抽签
                                        <%}else if(ticket.getTicketStatus() == FollowEntity.TICKET_STATUS_SUCCESS){%>
                                        抽签成功
                                        <%}else if(ticket.getTicketStatus() == FollowEntity.TICKET_STATUS_FAIL){%>
                                        抽签失败
                                        <%}%>
                                    </li>
                                <%}%>
			</section>
			<!--[if IE]></td></tr></table><![endif]-->
			<!--[if !IE]> -->
		</section>
		<!-- <![endif]-->
	</section>
        
                
    <%@include file="/templates/new_general_footer.jsp" %>
    <script type="text/javascript">
        <%=message.getActivityInfo()%>
    </script>
    <script type="text/javascript">
	function cnDate(obj,show){
		if(obj.getYear()){
			arrDays = new Array('日','一','二','三','四','五','六');
			strDate  = obj.getFullYear()+'年'+(obj.getMonth()+1)+'月'+obj.getDate()+'日';
			strTime  = '';
			strDay  = '星期'+arrDays[obj.getDay()];
			switch(show){
				case 1: str = strDate; break;
				case 2: str = strTime; break;
				case 3: str = strDate+' '+strTime; break;
				case 4: str = strDay; break;
				case 5: str = strDate+' '+strDay; break;
				default: str = strDate+' '+strTime+' '+strDay; break;
			}
			return str;
		} else {
			return 'Not a valid Date object.';
		}
	}
	myDate = new Date();
        document.getElementById("datelabel").innerHTML = cnDate(myDate);
</script>
</html>

