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
    <br class="vertical-padding" />
    
    <section class="body">
		<!-- 我的学清区块 -->
		<section class="my triangle-handle">
			<label class="date">2013年7月24日</label>
			<h1>我的学清</h1>
			<h2>你好！<%=message.getUsername()%></h2>
			<p>
				<label>学生活动申请：<%=message.getApplyNum()%></label><label>订票：1</label><label>关注：<%=message.getFollowActivityNumber()%></label>
			</p>
		</section>
		<br class="vertical-padding" />
		<!--[if IE]><section class="triangle-handle"></section><table><tr><td rowspan="3"><![endif]-->
		<!--[if !IE]> -->
		<section class="horiz-layout triangle-handle">
			<!-- <![endif]-->
			<section class="block calendar large"></section>
			<!--[if IE]></td><td class="vert-padding" rowspan="3"></td><td><![endif]-->
			<!--[if !IE]> -->
			<section class="vert-layout auto-width">
				<!-- <![endif]-->
				<section class="block follows">
					<h1>关注</h1>
					<ul>
                                            <%for(int i = 0; i < groups.size(); i ++){
                                                UserEntity group = groups.get(i);
                                                int followNum = groupsFollowNumbers.get(i);
                                            %>
						<li><button class="followed">已关注</button> <a href="/showGroupHome.do?groupId=<%=group.getID()%>"> <img
								src="<%=group.getLogoImg()%>" />
								<h1><%=group.getUsername()%></h1> <span>已有<%=followNum%>人关注</span>
						</a></li>
                                            <%}%>
					</ul>
				</section>
				<!--[if IE]></td></tr><tr><td class="hori-padding"></td></tr><tr><td><![endif]-->
				<section class="block hots auto-height">
					<h1>热点推荐</h1>
					<p>【视频直播】</p>
				</section>
				<!--[if IE]></td></tr><tr><td class="hori-padding" colspan="3"><section class="triangle-handle"></section></td></tr><tr><td><![endif]-->
				<!--[if !IE]> -->
			</section>
		</section>
		<br class="horiz-padding" />
		<section class="horiz-layout triangle-handle">
			<!-- <![endif]-->
			<section class="block classroom-applicant">
				<h2>我的学生活动申请</h2>
                                <iframe id="frame1" src="/studentActivity/showMyStudentActivityApply.do"></iframe>
			</section>
			<!--[if IE]></td><td class="vert-padding"></td><td><![endif]-->
			<section class="block auto-width">
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
</html>

