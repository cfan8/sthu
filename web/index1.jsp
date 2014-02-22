<%-- 
    Document   : main_index
    Created on : 2013-2-27, 17:16:16
    Author     : linangran
--%>

<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="cn.edu.tsinghua.sthu.entity.IndexSettingEntity"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.constant.IndexColumnMapping"%>
<%@page import="cn.edu.tsinghua.sthu.message.ShowIndexMessage"%>
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
	    <title>学生清华-首页</title>
	    <link rel="stylesheet" type="text/css" href="/css/index/style-new.css" />
        <link rel="stylesheet" href="/css/datepicker.css" type="text/css" />
        <link rel="stylesheet" type="text/css" href="/css/home/calendar.css" />
        <link rel="icon" href="logo.ico" type="/css/index/image/x-icon" />
	    <script type="text/javascript" src="/js/jquery.js" ></script>
	    <script type="text/javascript" src="/js/browser.js" ></script>
            <script type="text/javascript" src="/js/datepicker.js"></script>
            <script type="text/javascript" src="/js/calendar.js"></script>
             <script type="text/javascript" src="/js/eye.js"></script>
             <script type="text/javascript" src="/js/layout.js"></script>
    </head>
    <%!	public ShowIndexMessage showIndexMessage;
    %>
    <%
	showIndexMessage = (ShowIndexMessage) request.getAttribute("showIndexMessage");
	List<IndexSettingEntity> settings = showIndexMessage.getIndexSettings();
    %>
    <body>
	<div id="headline"></div>
	<div id="top">
		<div id="logo"><a href="/index.do">
			<img src="/css/index/img/logo.jpg"/></a>
		</div>
		<div id="index">
			<a href="/index.do">Home</a> | <a href="http://166.111.17.5/shijian/"target="_blank">社会实践在线平台</a> | <a href="http://sutuo.student.tsinghua.edu.cn" target="_blank">素质拓展计划</a> | <a href="http://www.bv2008.cn/" target="_blank">志愿北京</a> | <a href="http://daf.tsinghua.edu.cn/" target="_blank">博学网</a> | <a href="http://old.student.tsinghua.edu.cn/" target="_blank">怀念老学清</a>
		</div>
	</div>
		<div id="mainbody">

		<div id="banner">
			<a href="#">
				<img src="/css/index/img/banner.jpg"/>
			</a>
		</div>

		<div id="navDiv">
			<ul class="navigator">
				<li><a href="/column/column.do?id=2" target="_blank">新闻</a></li>
				<li><a href="/column/column.do?id=8" target="_blank">专题</a></li>
				<li><a href="/studentActivity/showActivitiesList.do" target="_blank">活动</a></li>
				<li><a href="#">抽奖</a></li>
				<li><a href="http://146.tsinghua.me" target="_blank">视听</a></li>
				<li><a href="/column/column.do?id=6" target="_blank">生活</a></li>
				<li><a href="/activity/applyNotice.jsp" target="_blank">申请</a></li>
				<li><a href="/ticket/ticketNotice.jsp" target="_blank">订票</a></li>
			</ul>
		</div>

		<div class="Line">
			<div id="news">
            	<div class="Line">
            	  <table width="100%" border="0">
                    <tr>
						<td>
						<table width="100%" border="0" align="left">
							<tr>
							  <td colspan="2" align="center" valign="middle"><table width="100%" border="0">
								<tr>
								  <td width="10%" height="20%"></td>
								  <td class="title"></td>
								  <td width="80%" colspan="2" class="title"></td>
								</tr>
								<tr>
								  <td></td>
								  <td class="title"><img src="/css/index/img/internewssymbol.jpg" width="184%"></td>
								  <td></td>                              
								  <td width="75%" align="left" valign="middle"><font style="color:#737373"><span class="subtitle">综合新闻</span></td>
								</tr>
							  </table></td>
							</tr>
							<tr>
								<td colspan="2"><hr width="90%"></td>
							</tr>
							<tr height="200">
								<td width="5%" align="left"></td>
								<td align="left" valign="top" class="subcontent">
                                                                 <% int max = showIndexMessage.getIndexBottomLeftNews().size() > 10 ? 10 : showIndexMessage.getIndexBottomLeftNews().size();
                                                                    for (int i = 0; i < max; i++) {
                                                                  %>
                                                                 <a href="/new/new.do?id=<%=showIndexMessage.getIndexBottomLeftNews().get(i).getID()%>" target="_blank"
								   title="<%=showIndexMessage.getIndexBottomLeftNews().get(i).getTitle()%>"><% if (showIndexMessage.getIndexBottomLeftNews().get(i).getTitle().length() > 18) {%>  <%=showIndexMessage.getIndexBottomLeftNews().get(i).getTitle().substring(0, 18).concat("..")%> 
                                                                     <% } else {%> <%=showIndexMessage.getIndexBottomLeftNews().get(i).getTitle()%> <% }%> </a></br>
						<%}%>
				
								</td>
							</tr>
							<tr>
								<td colspan="2">
								<table width="100%" border="0" align="left">
									<tr>
										<td width="25%"></td>
										<td width="40%">&nbsp;</td>
                                                                                <td width="18%"><a href="/column/column.do?id=<%=IndexColumnMapping.IndexBottomLeftColumnId%>" target="_blank"><img src="/css/index/img/blue_more.jpg" alt="" align="right"></a></td>
										<td width="6%"></td>
									</tr>
								</table>
								</td>
							</tr>
						</table>
						</td>
                    </tr>
                  </table>
                </div>
            </div>
                        <div id="roller">                                                      
		        <div id="slide">
                            <div id="imagebox"></div>
                            <div id="tipbox"><div id="tiptextarea"><div id="tiptext"></div></div><div id="tipbtn"></div></div>
                        </div>
                            <div class="rollernews">滚动新闻 </div>
                        </div>
                         
			 <div id="calendar">
                             <span id="date" style="top: 0px;"></span>
                             <a style="color: #8CCCD6;"href="/studentActivity/showActivitiesList.do"target="_blank">
                                 <% int eventNum=showIndexMessage.getStudentActivityOfTodayEntitys().size() > 2? 2:showIndexMessage.getStudentActivityOfTodayEntitys().size();
                                   
                                        for(int i=0;i<eventNum;i++){ %>
                                          <div class="currentenvent">  <%=showIndexMessage.getStartTimeInStudentActivityOfToday(showIndexMessage.getStudentActivityOfTodayEntitys().get(i).getTimePeriod())
                                          %>&nbsp;&nbsp;
                                            <% if (showIndexMessage.getStudentActivityApplyEntitys().get(i).getActivityTheme().length() > 25) {%>  <%=showIndexMessage.getStudentActivityApplyEntitys().get(i).getActivityTheme().substring(0, 25).concat("..")%>
                                     <% } else {%> <%=showIndexMessage.getStudentActivityApplyEntitys().get(i).getActivityTheme()%> <% }%></div>
                                        
                                     <%   }
                                    
                                 %>
                             </a>
                         </div>
                            
                         
                                                                                 
		</div>

		<hr>
		<div class="Line">
		  <div class="inform">
            	<div class="Line">
            	  <table width="100%" border="0">
                    <tr>
                      <td><table width="100%" border="0" align="left">
                        <tr>
                          <td colspan="2" align="center" valign="middle"><table width="100%" border="0">
                            <tr>
                              <td width="10%" height="20%"></td>
                              <td class="title"></td>
                              <td width="80%" colspan="2" class="title"></td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td class="title"><img src="/css/index/img/informsymbol.jpg"></td>
                              <td>&nbsp;</td>                              <td width="75%" align="left" valign="middle"><font style="color:#737373"><span class="subtitle">通知公告</span></td>
                            </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td colspan="2"><hr width="90%"></td>
                        </tr>
                        <tr height="200">
                          <td width="5%" height="200" align="left">&nbsp;</td>
                          <td align="left" valign="top" class="subcontent">
                              
				  <% max = showIndexMessage.getIndexTopNews().size() > 6 ? 6 : showIndexMessage.getIndexTopNews().size();
			    for (int i = 0; i < max; i++) {%>
			    <a href="/new/new.do?id=<%=showIndexMessage.getIndexTopNews().get(i).getID()%>" target="_blank"
			       title="<%=showIndexMessage.getIndexTopNews().get(i).getTitle()%>"><% if (showIndexMessage.getIndexTopNews().get(i).getTitle().length() > 15) {%>  <%=showIndexMessage.getIndexTopNews().get(i).getTitle().substring(0, 15).concat("..")%>
				<% } else {%> <%=showIndexMessage.getIndexTopNews().get(i).getTitle()%> <% }%> </a></br>
                            
			<% }%>
					
                          </td>
                        </tr>
                        <tr>
                          <td colspan="2"><table width="100%" border="0" align="left">
                            <tr>
                              <td width="25%">&nbsp;</td>
                              <td width="40%">&nbsp;</td>
                              <td width="25%"><a href="/column/column.do?id=<%=IndexColumnMapping.IndexTopColumnId%>" target="_blank"><img src="/css/index/img/yellow_more.jpg"/></a></td>
                              <td width="10%">&nbsp;</td>
                            </tr>
                          </table></td>
                        </tr>
                      </table></td>
                    </tr>
                  </table>
                </div>
		  </div>
			<div class="inform">
            	<div class="Line">
            	  <table width="100%" border="0">
                    <tr>
                      <td><table width="100%" border="0" align="left">
                        <tr>
                          <td colspan="2" align="center" valign="middle"><table width="100%" border="0">
                            <tr>
                              <td width="10%" height="20%"></td>
                              <td class="title"></td>
                              <td width="80%" colspan="2" class="title"></td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td class="title"><img src="/css/index/img/schoolnewssymbol.jpg"></td>
                              <td>&nbsp;</td>                              <td width="75%" align="left" valign="middle"><font style="color:#737373"><span class="subtitle">院系新闻</span></td>
                            </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td colspan="2"><hr width="90%"></td>
                        </tr>
                        <tr height="200">
                          <td width="5%" height="200" align="left">&nbsp;</td>
                          <td align="left"  valign="top" class="subcontent">
                              <% max = showIndexMessage.getIndexBottomCenterNews().size() > 6 ? 6 : showIndexMessage.getIndexBottomCenterNews().size();
					for (int i = 0; i < max; i++) {
				    %>           
                                                <a href="/new/new.do?id=<%=showIndexMessage.getIndexBottomCenterNews().get(i).getID()%>" target="_blank"
								   title="<%=showIndexMessage.getIndexBottomCenterNews().get(i).getTitle()%>"><% if (showIndexMessage.getIndexBottomCenterNews().get(i).getTitle().length() > 15) {%>  <%=showIndexMessage.getIndexBottomCenterNews().get(i).getTitle().substring(0, 15).concat("..")%>
                                                <% } else {%> <%=showIndexMessage.getIndexBottomCenterNews().get(i).getTitle()%> <% }%> </a>
						<%}%>
                          </td>
                        </tr>
                        <tr>
                          <td height="28"colspan="2"><table width="100%" border="0" align="left">
                            <tr>
                              <td width="25%">&nbsp;</td>
                              <td width="40%">&nbsp;</td>
                              <td width="25%"><a href="/column/column.do?id=<%=IndexColumnMapping.IndexBottomCenterColumnId%>" target="_blank"><img src="/css/index/img/red_more.jpg"></a></td>
                              <td width="10%">&nbsp;</td>
                            </tr>
                          </table></td>
                        </tr>
                      </table></td>
                    </tr>
                  </table>
              </div>
			</div>
			<div class="inform">
            	<div class="Line">
            	  <table width="100%" border="0">
                    <tr>
                      <td><table width="100%" border="0" align="left">
                        <tr>
                          <td colspan="2" align="center" valign="middle"><table width="100%" border="0">
                            <tr>
                              <td width="10%" height="20%"></td>
                              <td class="title"></td>
                              <td width="80%" colspan="2" class="title"></td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td class="title"><img src="/css/index/img/activitysymbol.jpg"></td>
                              <td>&nbsp;</td>                              <td width="75%" align="left" valign="middle" class="subtitle"><font style="color:#737373">活动介绍</td>
                            </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td colspan="2"><hr width="90%"></td>
                        </tr>
                        <tr height="200">
                          <td width="5%" height="200" align="left">&nbsp;</td>
                          <td align="left" valign="top" class="subcontent">
                          <% max = showIndexMessage.getStudentActivityApplyEntitys().size() > 3 ? 3 : showIndexMessage.getStudentActivityApplyEntitys().size();
			    for (int i = 0; i < max; i++) {%>
                            <span class="newsrow"><a href="/studentActivity/showStudentActivityDetail.do?activityID=<%=showIndexMessage.getStudentActivityApplyEntitys().get(i).getID()%>" target="_blank"
                               title="<%=showIndexMessage.getStudentActivityApplyEntitys().get(i).getActivityTheme()%>"><% if (showIndexMessage.getStudentActivityApplyEntitys().get(i).getActivityTheme().length() > 15) {%>  <%=showIndexMessage.getStudentActivityApplyEntitys().get(i).getActivityTheme().substring(0, 15).concat("..")%>
                                    <% } else {%> <%=showIndexMessage.getStudentActivityApplyEntitys().get(i).getActivityTheme()%> <% }%></a></span><br>
                             <span class="subcontenttime"><%=Util.dateToStringAccurateToDayFormat1(showIndexMessage.getStudentActivityApplyEntitys().get(i).getActivityDate())%><%=showIndexMessage.getStartTimeInStudentActivityOfToday(showIndexMessage.getStudentActivityApplyEntitys().get(i).getTimePeriod())%></span></br>       
			<% }%>
                          </td>
                        </tr>
                        <tr>
                          <td height="28" colspan="2"><table width="100%" border="0" align="left">
                            <tr>
                              <td width="25%">&nbsp;</td>
                              <td width="40%">&nbsp;</td>
                              <td width="25%"><a href="/studentActivity/showActivitiesList.do" target="_blank"><img src="/css/index/img/green_more.jpg"></a></td>
                              <td width="10%">&nbsp;</td>
                            </tr>
                          </table></td>
                        </tr>
                      </table></td>
                    </tr>
                  </table>
                </div>
			</div>
			<div class="inform">
            	<div class="Line">
            	  <table width="100%" border="0">
                    <tr>
                      <td><table width="100%" border="0" align="left">
                        <tr>
                          <td colspan="3" align="center" valign="middle"><table width="100%" border="0">
                            <tr>
                              <td width="10%" height="20%"></td>
                              <td class="title"></td>
                              <td width="80%" colspan="2" class="title"></td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td class="title"><img src="/css/index/img/sthusymbol.jpg"></td>
                              <td>&nbsp;</td>                              <td width="75%" align="left" valign="middle"><font style="color:#737373"><span class="subtitle">关于学清</span></td>
                            </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td colspan="3"><hr width="90%"></td>
                        </tr>
                        <tr height="90">
                          <td width="25%" height="90" align="left">&nbsp;</td>
                          <td width="47%" align="left"><img style=""src="/css/index/img/QRcode.jpg"></td>
                          <td width="25%" align="left">&nbsp;</td>
                        </tr>
                        <tr>
                          <td height="73" colspan="3" align="left" class="subcontentaboutcenter">引领校园文化，<br>
                            汇集活动信息；<br>
                            关注身边热点，<br>
                          服务学生生活。</td>
                        </tr>
                        <tr>
                          <td colspan="3"><hr width="90%"></td>
                        </tr>
                        <tr>
                          <td height="8" colspan="3" align="center" valign="middle" class="subcontentaboutend">
                              <a href="mailto:chengcai@mail.tsinghua.edu.cn">加入我们</a> | 
                              <a href="mailto:chengcai@mail.tsinghua.edu.cn">我要投稿</a> | 
                              <a href="/app/STHUApp.apk">客户端下载</a>
                          </td>
                        </tr>
                      </table></td>
                    </tr>
                  </table>
                </div>
			</div>
    </div>

		<div id="ads">
			<p><img src="/css/index/img/ads.jpg"/></p>
      </div>

		<div class="Line">

	  <div id="theme" class="inform">
				<div id="themebanner">
					专题推广
				</div>
				<ul class="themeul">
					<li>
						<a href="/topic/tj2013/tj2013/index.html" target="_blank"><img src="/css/index/topic4.jpg"/></a>
						<div class="title">清华大学特等奖学金</div>
						<hr>
						<div class="boxcontent" align="left">清华大学特等奖学金设立于1989年，旨在表彰德、智、体、美全面发展或是在某一方面具有突出特长或贡献的优秀学子，是清华学生的最高荣誉。</div>
					</li>
					<li>
						<a href="/topic/mlhk/mlhk/index.html" target="_blank"><img src="/css/index/topic3.png"/></a>
						<div class="title">马兰花开</div>
						<hr>
						<div class="boxcontent" align="left">《马兰花开》是反映“两弹一星”元勋邓稼先同志投身新中国核事业的人生历程及伟大精神的大型话剧</div>
					</li>
					<li>
						<a href="/topic/photography_contest/index.html" target="_blank"><img style="width: 202px;height:115px;"src="/css/index/topic2.png"/></a>
						<div class="title">“清影华光”摄影大赛</div>
						<hr>
						<div class="boxcontent" align="left">在我们美丽的清华园中，发生着各种多姿多彩的故事，演绎着无数拨动心弦的瞬间。</div>
					</li>
					<li> </li>
				</ul>
			</div>

			<div id="study" class="inform">
				<div id="studybanner">
					学习园地
				</div>
		  <div class="boxcontent" align="left">
		    <table width="100%" border="0" align="left">
		      <tr height="200">
		        <td  colspan="3" align="left" valign="top" class="boxcontent">
                             <% max = showIndexMessage.getIndexStudyColumnNews().size()>10 ? 10 : showIndexMessage.getIndexStudyColumnNews().size();
					for (int i = 0; i < max; i++) {
				    %>
                                    <span class="newsrow"> <a href="/new/new.do?id=<%=showIndexMessage.getIndexStudyColumnNews().get(i).getID()%>" target="_blank"
			        title="<%=showIndexMessage.getIndexStudyColumnNews().get(i).getTitle()%>"><% if (showIndexMessage.getIndexStudyColumnNews().get(i).getTitle().length() > 20) {%>  <%=showIndexMessage.getIndexStudyColumnNews().get(i).getTitle().substring(0, 20).concat("..")%>
                                            <% } else {%> <%=showIndexMessage.getIndexStudyColumnNews().get(i).getTitle()%> <% }%> </a></span></br>
			      <%}%>
                        </td>
	          </tr>
                        <tr height="14"></tr>
		      <tr height="30">
		        <td width="65%" height="30">&nbsp;</td>
		        <td width="17%"><a href="/column/column.do?id=<%=IndexColumnMapping.IndexStudyColumnId%>" target="_blank"><img src="/css/index/img/orange_more.jpg"></a></td>
		        <td width="6%">&nbsp;</td>
	          </tr>
	        </table>
		  </div>
			</div>
		</div>

		<div class="Line">
			<div id="people" class="inform">
				<div id="peoplebanner">学清人物</div>
                <div class="boxcontent">
                  <table width="100%" border="0">
                    <tr>
                      <td width="50%"><table width="99%" border="0" align="left">
                        <tr>
                          <td><table width="100%" border="0">
                            <tr>
                              <td align="center" valign="bottom" class="title">孙启力</td>
                              <td width="50%"><a href="/topic/tj2013/tj2013/faq2.html" target="_blank"><img src="/css/index/img/people1.gif"></a></td>
                              <td width="10%">&nbsp;</td>
                            </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td><hr></td>
                        </tr>
                        <tr>
                          <td class="boxcontent">
                            筑一片砖瓦 撑一方蓝天</br></br></br></br></td>
                        </tr>
                      </table></td>
                      <td width="50%"><table width="99%" border="0" align="right">
                        <tr>
                          <td><table width="100%" border="0">
                            <tr>
                              <td align="center" valign="bottom" class="title">吴佳俊</td>
                              <td width="50%"><a href="/topic/tj2013/tj2013/faq11.html" target="_blank"><img src="/css/index/img/people2.gif"></a></td>
                              <td width="10%">&nbsp;</td>
                            </tr>
                          </table></td>
                        </tr>
                        <tr>
                          <td><hr></td>
                        </tr>
                        <tr>
                          <td class="boxcontent">交叉信息研究院</br></br></br></br></td>
                        </tr>
                      </table></td>
                    </tr>
                  </table>
                </div>
			</div>
		  <div id="organization" class="inform">
				<div id="organibanner">学生组织</div>
		  <div class="boxcontent">
		    <table width="100%" border="0">
                        <!--td height="100%" width="15%">
                           <tr height="50%"><a href="/showGroupHome.do?groupId=814" target="_blank"><img src="/css/index/img/logo1.jpg"></a></tr>
                           <tr height="2%"></tr>
                           <tr align="center" valign="middle">手语社</tr>
                       </td>
                        <td height="100%"width="15%">
                           <tr height="50%"><a href="/showGroupHome.do?groupId=668" target="_blank"><img src="/css/index/img/logo1.jpg"></a></tr>
                           <tr height="2%"></tr>
                           <tr align="center" valign="middle">手语社</tr>
                       </td>
                        <td height="100%"width="15%">
                           <tr height="50%"><a href="/showGroupHome.do?groupId=678" target="_blank"><img src="/css/index/img/logo1.jpg"></a></tr>
                           <tr height="2%"></tr>
                           <tr align="center" valign="middle">手语社</tr>
                       </td>
                        <td height="100%"width="15%">
                           <tr height="50%"><a href="/showGroupHome.do?groupId=667" target="_blank"><img src="/css/index/img/logo1.jpg"></a></tr>
                           <tr height="2%"></tr>
                           <tr align="center" valign="middle">手语社</tr>
                       </td>
                        <td height="100%"width="15%">
                           <tr height="50%"><a href="/showGroupHome.do?groupId=757" target="_blank"><img src="/css/index/img/logo1.jpg"></a></tr>
                           <tr height="2%"></tr>
                           <tr align="center" valign="middle">手语社</tr>
                       </td>
                        <td height="100%"width="15%">
                           <tr height="50%"><a href="/showGroupHome.do?groupId=777" target="_blank"><img src="/css/index/img/logo1.jpg"></a></tr>
                           <tr height="2%"></tr>
                           <tr align="center" valign="middle">手语社</tr>
                       </td-->
		      <tr>
		        <td width="15%"><a href="/showGroupHome.do?groupId=814" target="_blank"><img style="height: 50px;width: 50px;"src="/css/index/img/logo1.jpg"></a></td>
		        <td width="2%"></td>
		        <td width="15%"><a href="/showGroupHome.do?groupId=668" target="_blank"><img style="height: 50px;width: 50px;"src="/css/index/img/logo2.jpg"></a></td>
		        <td width="2%"></td>
		        <td width="15%"><a href="/showGroupHome.do?groupId=678" target="_blank"><img style="height: 50px;width: 50px;"src="/css/index/img/logo1.jpg"></a></td>
		        <td width="2%"></td>
		        <td width="15%"><a href="/showGroupHome.do?groupId=667" target="_blank"><img style="height: 50px;width: 50px;"src="/css/index/img/logo2.jpg"></a></td>
		        <td width="2%"></td>
		        <td width="15%"><a href="/showGroupHome.do?groupId=757" target="_blank"><img style="height: 50px;width: 50px;"src="/css/index/img/logo1.jpg"></a></td>
		        <td width="2%"></td>
		        <td width="15%"><a href="/showGroupHome.do?groupId=777" target="_blank"><img style="height: 50px;width: 50px;"src="/css/index/img/logo2.jpg"></a></td>
	          </tr>
                        <tr height="5"></tr>
		      <tr>
		        <td align="center"width="15%" valign="top">手语社</td>
		        <td align="center" width="2%"></td>
		        <td align="center" width="15%" valign="top">滑雪协会</td>
		        <td align="center" width="2%"></td>
		        <td align="center" width="15%" valign="top">定向越野协会</td>
		        <td align="center" width="2%"></td>
		        <td align="center" width="15%" valign="top">健美协会</td>
		        <td align="center" width="2%"></td>
		        <td align="center" width="15%" valign="top">古典爱乐社</td>
		        <td align="center" width="2%"></td>
		        <td align="center" width="15%" valign="top">天空工厂</td>
	          </tr>
                        <tr height="20"></tr>
	        </table>
		    <table width="100%" border="0">
		      <tr>
		        <td height="86">&nbsp;</td>
		        <td width="10%" align="center" valign="bottom"><a href="/showGroups.do" target="_blank"><img src="/css/index/img/green_more.jpg"></a></td>
		        <td width="4%">&nbsp;</td>
	          </tr>
	        </table>
		  </div>
			</div>
		</div>
        <hr>
		<div id="fifthLine" class="Line">
	  <div id="photo" class="divbackground">
              
		<div class="bigtitle" style="margin-left: 30px;margin-top: 10px;"align="left"><img class="biglogo" src="/css/index/img/photologo.jpg"/>
                       <span class="subtitle">&nbsp;&nbsp;影像清华</span>
                </div>
                       <hr width="95%">
                    
		  <div class="boxcontent">
					<div class="photocontent"><img src="/css/index/img/photo1.png"/>汽车系_高子强<br/> 在这里实现童年的梦想就是一种幸福</div>
					<div class="photocontent"><img src="/css/index/img/photo2.png"/>徐瑞<br/>这颗银杏树见证过无数春夏秋冬，无数个幸福的瞬间曾在这里被定格</div>
					<div class="photocontent"><img src="/css/index/img/photo3.png"/>化学系_王诗琪<br/> 电镜下的浪漫</div>
				</div>
			</div>
			<div id="ads2">
				<img src="/css/index/img/ads2.jpg"/>
			</div>
        </div>
		<div id="footer">
<div id="footnote">
				共青团清华大学委员会成才信息中心
				<br/>
				Copyright&copy2013 student.tsinghua.edu.cn, All Rights Reserved
			</div>
		</div>

	</div>
    </body>
    <script>
	//悬停下划线（CSS太麻烦！）
	$("a").mouseover(function(){
	    $(this).css("text-decoration", "underline");
	});
	
	$("a").mouseout(function(){
	    $(this).css("text-decoration", "none");
	});
	
	var imgs = new Array(
	<% for (int i = 0; i < settings.size(); i++) {
		IndexSettingEntity entity = settings.get(i);
	%>
	    '<%=entity.getImage()%>'<%=i == settings.size() - 1 ? "" : ","%>
	<% }%>
	);
	    var titles = new Array(
	<% for (int i = 0; i < settings.size(); i++) {
		IndexSettingEntity entity = settings.get(i);
	%>
	    '<%=entity.getTitle()%>'<%=i == settings.size() - 1 ? "" : ","%>
	<% }%>
	);
	    var links = new Array(
	<% for (int i = 0; i < settings.size(); i++) {
		IndexSettingEntity entity = settings.get(i);
	%>
	    '<%=entity.getLink()%>'<%=i == settings.size() - 1 ? "" : ","%>
	<% }%>
	);
	    init();
	    enableBrowserDetect();
	    
	    var timer;
	
	    var current = 0;
	    function init(){
		var imghtml = "";
		for (var i = 0; i < imgs.length; i++)
		{
		    imghtml += '<a href="' + links[i] + '" target="_blank"><img src="' + imgs[i] + '" id="slideimg' + i + '"></img>';  
		}
		$("#imagebox").html(imghtml);
	
		imghtml="";
		for (var i = 0; i < imgs.length; i++)
		{
		    imghtml += '<a href="#" id="imgbtn' + (imgs.length - 1 - i) + '"><img src="/css/index/tipbtn.png"></img></a>';
		}
		$("#tipbtn").html(imghtml);
	    
		for (var i = 0; i < imgs.length; i++)
		{
		    titles[i] = '<a href="' + links[i] + '">' + titles[i] + '</a>';
		}
	    
		for (var i = 0; i < imgs.length; i++)
		{
		    $("#imgbtn" + i).bind("click", {param1: i}, clickRecall);
		}
	    
		$("#slideimg0").show();
		$("#imgbtn0 img").css("opacity", "1");
		$("#tiptext").html(titles[0]);
		timer = setInterval(triggerRecall, 5000);
	    }
	
	    function triggerRecall()
	    {
		if (current == imgs.length - 1)
		{
		    showThis(0);
		}
		else 
		{
		    showThis(current + 1);
		}
	    }
	
	    function clickRecall(event)
	    {
		var t = event.data.param1;
		clearInterval(timer);
		timer = setInterval(triggerRecall, 5000);
		if (t == current)
		{
		    return false;
		}
		else 
		{
		    showThis(t);
		}
		return false;
	    }
	
	    function showThis(t)
	    {
  
		$("#slideimg" + current).css("z-index", "2");
		$("#slideimg" + t).css("z-index", "1");
		$("#slideimg" + t).show();
		$("#slideimg" + current).fadeOut(1000);
		$("#tiptextarea").fadeOut(500, function(){
		    $("#tiptext").html(titles[t]);
		    $("#tiptextarea").fadeIn(500);
		});
		$("#imgbtn" + current + " img").css("opacity", "0.5");
		$("#imgbtn" + t + " img").css("opacity", "1");
		current = t;
	    }
           /* var day = new Date();
             $('#date').DatePicker({
                flat: true,
                date: day,
                current: day,
                calendars: 1,
                starts: 1,
                format: 'Y-m-d',
                onChange:function(date){
                    //self.location.href = "showActivitiesList.do?selectedDate="+date;
                }
            }); */
           
    </script>
</html>
