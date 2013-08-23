<%-- 
    Document   : grouphome
    Created on : 2013-8-13, 15:00:20
    Author     : xiaobo
--%>

<%@page import="cn.edu.tsinghua.sthu.action.ShowGroupHomeAction"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.message.ShowGroupHomeMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ShowGroupHomeMessage message = Util.getMessage(ShowGroupHomeAction.class);
    Integer showFollow = message.getShowFollow();
    Integer isGroupFollowed = message.getIsGroupFollowed();
    String organizeName= message.getOrganizeName();
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>社团主页</title>
        <script type="text/javascript" src="/js/jquery.js"></script>
	<script type="text/javascript" src="/js/pageview.js"></script>
	<link href="/css/activity/NaviBar_sheet.css" type="text/css" rel="stylesheet" />
        <link href="/css/activity/FooterBar_sheet.css" type="text/css" rel="stylesheet" />
        <link href="/css/activity/organizationPage.css" type="text/css" rel="stylesheet" />
        <link href="/css/activity/flexagon.css" type="text/css" rel="stylesheet" />
        <link href="/css/activity/effects.css" type="text/css" rel="stylesheet" />
    </head>
    <%@include file="/templates/new_general_header.jsp" %> 
    
    
    <div id="main_part" class="main-style">
        <div id="main_content_part" class="main-content-style">
            <div id="title_part" class="title-part-style">
                <!-- 画折角效果 -->
                <div id="content_flexagon1" class="flexagon-style">
                    <!-- 左折角 -->
                    <div id="flexagon1">
                        <canvas id="c1" width="8" height="8"></canvas>
                        <script>
                            var myCanvas = document.getElementById("c1");
                            var context = myCanvas.getContext("2d");
                            context.lineWidth = 1;
                            context.beginPath();
                            context.fillStyle = "black";
                            context.moveTo(8, 8);
                            context.lineTo(8, 0);
                            context.lineTo(0, 8);
                            context.fill();
                        </script>
                    </div>
                    <!-- 右折角 -->
                    <div id="flexagon2">
                        <canvas id="c2" width="8" height="8"></canvas>
                        <script>
                            var myCanvas = document.getElementById("c2");
                            var context = myCanvas.getContext("2d");
                            context.lineWidth = 1;
                            context.beginPath();
                            context.fillStyle = "black";
                            context.moveTo(0, 0);
                            context.lineTo(0, 8);
                            context.lineTo(8, 8);
                            context.fill();
                        </script>
                    </div>
                </div>
                <div style="height: 7px;"></div>
                <div id="title_background" class="title-background-style">
                    <div id="right_logo" class="xsh-logo-part">
                        <div id="xsh_logo" class="xsh-logo">
                            <img src="/css/activity/xsh_logo.jpg" class="img-shadow" />
                        </div>
                        <div id="follow" class="follow-style" style="text-shadow: 2px 2px 5px #222;">
                            <a style="color: #fff;"><b>已有</b></a>
                            <a id="follow_num" style="color: #d55;"><b>2460</b></a>
                            <a style="color: #fff;"><b>人关注</b></a>
                        </div>
                    </div>
                </div>
                <div id="lantern_slide" class="slide-style">
                    <img src="/css/activity/org_main.jpg" class="slide-img" />
                </div>
                <div id="xsh_intro" class="xsh_intro-style">
                    <div id="intro_right" class="intro-right-part">
                        <div id="xsh_name" style="text-align: right">
                            <a style="font-size: 20px">
                                <%=organizeName %>
                            </a>
                        </div>
                        <div id="follow_part">                                                             
                            <%if(showFollow == 1){%>
                                <div class="btn-border">
                                <%if(isGroupFollowed == 1){%>
                                <a href="/followGroup.do?type=0&groupId=<%=message.getGroupId()%>">
                                    <img src="/css/activity/unfollow_btn.png" />
                                </a>
                                <%}else{%>
                                <a href="/followGroup.do?type=1&groupId=<%=message.getGroupId()%>">
                                    <img src="/css/activity/follow_btn.png" />
                                </a>
                                </div>
                                <%}}%>                            
                        </div>
                        <div id="txt_intro" style="font-size: large; float: right; width: 220px; word-wrap: break-word; overflow: hidden;">
                            <p>清华美院学生会是属于清华大学美术学院学生自己的组织，她来自广大同学，在美院党委和团委的领导下，为活跃本院学习气氛，丰富广大同学的课余生活.....<a class="blue-border"><b>&ensp;+&ensp;</b></a></p>
                        </div>
                        <div style="padding-left: 30px;">
                            <hr />
                        </div>
                    </div>
                </div>
            </div>

            <div id="content_part" class="content-style">
                <div id="left_content" style="float: left; width: 750px;">
                    <div id="content_flexagon2" class="flexagon-style">
                        <!-- 左折角 -->
                        <div id="flexagon3">
                            <canvas id="c3" width="8" height="8"></canvas>
                            <script>
                                var myCanvas = document.getElementById("c3");
                                var context = myCanvas.getContext("2d");
                                context.lineWidth = 1;
                                context.beginPath();
                                context.fillStyle = "black";
                                context.moveTo(8, 8);
                                context.lineTo(8, 0);
                                context.lineTo(0, 8);
                                context.fill();
                            </script>
                        </div>
                        <!-- 右折角 -->
                        <div id="flexagon4">
                            <canvas id="c4" width="8" height="8"></canvas>
                            <script>
                                var myCanvas = document.getElementById("c4");
                                var context = myCanvas.getContext("2d");
                                context.lineWidth = 1;
                                context.beginPath();
                                context.fillStyle = "black";
                                context.moveTo(0, 0);
                                context.lineTo(0, 8);
                                context.lineTo(8, 8);
                                context.fill();
                            </script>
                        </div>
                    </div>
                    <div style="height: 7px;"></div>
                    
                    <div id="activity_content" class="activity-style">
                        <div id="text_content" style="height: 500px;">   
                        </div>
                        <script type="text/javascript">
                            var pageConfig = {
                                root:$("#text_content"),
                                url:"/showGroupPageHome.do?groupId=<%=message.getGroupId()%>",
                                total:<%=message.getTotalPageNumber()%>,
                                current:1,
                                arguName:"page",
                                css:false
                            };
                            init(pageConfig);
                       </script>                      
                    </div>
                </div>        
                
                <div id="right_content" style="float: right; width: 250px;">
                    <div style="height:8px;"></div>
                    <div id="join_us_part" style="height:60px;margin-top:8px;margin-left:30px">
                        <img src="/css/activity/join-us.png" class="img-shadow"/>
                    </div>
                    <div style="height:30px;">
                        <div id="Decoration1">
                        <canvas id="cd1" width="30" height="30"></canvas>
                        <script>
                            var myCanvas = document.getElementById("cd1");
                            var context = myCanvas.getContext("2d");
                            context.lineWidth = 1;
                            context.beginPath();
                            context.fillStyle = "#bbb";
                            context.moveTo(0, 0);
                            context.lineTo(0, 30);
                            context.lineTo(30, 30);
                            context.fill();
                        </script>
                        </div>
                    </div>
                    <div id="function_part" class="function-style">
                        <div id="good_btn" style="float:left;height:40px;margin-right:40px;">
                            <img src="/css/activity/good.png" style="cursor:pointer;"/>
                        </div>
                        <div id="file_btn" style="float:left;height:40px;margin-right:40px;">
                            <img src="/css/activity/collect.png" style="cursor:pointer;"/>
                        </div>
                        <div id="mail_btn" style="float:left;height:40px;">
                            <img src="/css/activity/mail.png" style="cursor:pointer;"/>
                        </div>
                    </div>

                    <div id="other_organization" style="height:300px;margin-top:20px;">
                        <div style="float:right;width:230px;background-color:#fff;height:340px;">
                            <div style="padding-top:10px;padding-left:10px;">
                                <a><b>友情主页</b></a>
                            </div>
                            <div style="margin-top:2px;">
                                <ul style="list-style:none;padding-left:10px;margin-left:0px;">
                                    <li style="min-height:60px;">
                                        <div style="float:left;">
                                            <img src="/css/activity/shsj.jpg" class="org-logo" />
                                        </div>
                                        <div style="float:left;margin-left:5px;font-size:small;">
                                            <div style="color:#47a"><a><b>清华大学社会实践</b></a></div>
                                            <div style="width:170px;word-wrap: break-word; overflow: hidden;"><a>受教育，长才干，做贡献；知国情、悟责任、立志向！</a></div>
                                        </div>
                                    </li>

                                    <li style="min-height:60px;">
                                        <div style="float:left;">
                                            <img src="/css/activity/xczx.jpg" class="org-logo" />
                                        </div>
                                        <div style="float:left;margin-left:5px;font-size:small;">
                                            <div style="color:#47a"><a><b>清华大学宣传中心</b></a></div>
                                            <div style="width:170px;word-wrap: break-word; overflow: hidden;"><a></a></div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
        
                
    <%@include file="/templates/new_general_footer.jsp" %>
</html>
