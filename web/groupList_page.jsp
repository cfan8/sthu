<%-- 
    Document   : groupList_page
    Created on : 2013-11-28, 23:23:16
    Author     : anna
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="cn.edu.tsinghua.sthu.action.FollowGroupInBatchPageAction"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.entity.UserEntity"%>
<%@page import="cn.edu.tsinghua.sthu.message.FollowGroupInBatchPageMessage"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    FollowGroupInBatchPageMessage message = Util.getMessage(FollowGroupInBatchPageAction.class);
    List<UserEntity> groups = message.getAllGroups();
    List<Integer> groupsFollowNumbers = message.getGroupsFollowNum();
    List<Integer> isGroupFollowed = message.getIsFollowed();
    List<Integer> isBatchFollowed = new ArrayList<Integer>();
    Integer showFollowed = message.getShowFollowed();
    for(int k=0;k<groups.size();k++){
        isBatchFollowed.add(0);
     }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>全部组织</title>
	<script type="text/javascript" src="/js/jquery.js"></script>
	<script type="text/javascript" src="/js/pageview.js"></script>
        <script type="text/javascript" src="/js/utils.js"></script>
    <style>
        .backToTop {
    display: none;
    width: 20px;
    line-height: 1.2;
    padding: 5px 0;
    background-color: #000;
    color: #fff;
    font-size: 15px;
    text-align: center;
    position: fixed;
    _position: absolute;
    right: 100px;
    bottom: 100px;
    _bottom: "auto";
    cursor: pointer;
    opacity: .6;
    filter: Alpha(opacity=60);
}
    </style>
    </head>
    
    <%@include file="/templates/new_general_header.jsp" %>
   
    <div id="title-board"  style="width: 900px;height: 64px; margin:30px auto;background-color:rgb(112, 194, 206)" >
            <div style="float:left;margin-top:10px;"><p style="margin-top:10px;margin-left: 40px;font-size:25px;color:white;">全部学生组织</p></div>
        </div>

    <div id="main_content" class="main-style">
        <div id="content_div" class="content-div-style">
            <div id="content_board" class="content-style">
                <div id="content_main_board" class="content-main-style" >
                   <!--添加主要代码-->
                   <div id="page"style="height:auto;padding-top: 20px;padding-bottom: 20px;margin:25px 0;">
                        <!--div-->
                        
                        <%if(showFollowed==1){%>
                            <div >
                            <input type="checkbox" name="chooseAll2" id="All" style="margin-left: 45px;margin-bottom: 5px;" onclick="chooseAll()" >全选</input>
                            </div>
                         
                         <form id="followForm"method="post" action="/showGroups.do">
                        <div style="margin:10px 40px;">
                        <input type="image" onclick="follow()"id="batchFollowed" src="/css/activity/followInBatch_btn.jpg" style="width:100px;height: 30px;"></input>
                        </div>
                        <%}%>
                        <%for(int i = 0; i < groups.size(); i ++){
                          UserEntity group = groups.get(i);
                          int followNum = groupsFollowNumbers.get(i);
                          //int isFollowed = isGroupFollowed.get(i);
                         %>
                         <div style="float:left;margin-left:45px; margin-bottom:10px;width:240px;height: 100px;">
                        <div style="float: right;width:240px;height:100px;border: 2px dashed #DBDBDB;padding-bottom: 2px;"> 
                            <div style="float:left;width: 90px;height: 100px;text-align: center;">
                                 <a  style="text-decoration:none;"href="/showGroupHome.do?groupId=<%=group.getID()%>" target="_blank"> 
                                     <%if(group.getLogoImg() != null  && group.getLogoImg().compareTo("null") != 0){%>
                                     <img src="<%=group.getLogoImg()%>" style="margin-left:13px;padding:5px; width:64px;height:64px;"/>
                                     <%}else{%>
                                     <img src="/images/logo.jpg" style="margin-left: 13px;padding:5px; width:64px;height:64px;" />
                                     <%}%> 
                                </a>
                                <%if(showFollowed == 1){
                                     int isFollowed = isGroupFollowed.get(i);
                                %>
                                <%if(isFollowed == 1){%>
                                
                                
                                 <a href="/followGroup.do?noAlert=1&type=0&groupId=<%=group.getID()%>">
                                    <img src="/css/activity/unfollow_btn.png" style="margin-top: 5px;margin-left: 13px;width:64px; height:20px;" />
                                </a>
                                <%}else{%>
                                <a href="/followGroup.do?noAlert=1&type=1&groupId=<%=group.getID()%>">
                                    <img src="/css/activity/follow_btn.png" style="margin-top: 5px;margin-left: 13px;width:64px; height:20px;"/>
                        
                                </a>   
           
                                <%}%>
                                <%}%>
                            </div>
                            <div style="float:left;margin-left: 10px;margin-top: 5px;width:140px;height:100px;">
                                <a  style="text-decoration:none;" href="/showGroupHome.do?groupId=<%=group.getID()%>" target="_blank"> 
                                    <h3 style="margin: 0;color:#000;font-size :14px;height: 45px;line-height: 15px;overflow:hidden;"><%=group.getNickname()%></h3>
                                    <h4 style="font-size:9px; color:#888;height: 15px; margin:0 0 15px 0;">已有<%=followNum%>人关注</h4>
                                </a>
                                 <%if(showFollowed==1&&isGroupFollowed.get(i) == 0){%>
                                 
                                <input type="checkbox" style="height:13px; width:13px;" name="chooseAll" value=<%=group.getID()%> ><b style="font-size:13px; color: rgba(0, 153, 255, 0.8);">关注</b></input>
                                
                                
                                 <%}%>
                           </div>
               
                       </div>
                       </div>
                      <%}%>
                      </form>
                      <div style="clear:both;"></div>
                  </div>


                   </div>
                </div>
           </div>
       </div>
        <script type="text/javascript">
     // ArrayList<Boolean> isBatchFollowed = new ArrayList<Boolean>();
   function chooseAll(){
   
       var y = document.getElementById("All").checked;
        var x = document.getElementsByName("chooseAll");
     
        if(y ==true)
           for(var t=0;t<x.length;t++){
               x[t].checked = true;
         }
        else{
            for(var t=0;t<x.length;t++){
               x[t].checked = false;
        }
        }
      
   }
   
 
   function follow(){
    
    document.getElementById("followForm").submit;
   
   }
 (function() {
    var $backToTopTxt = "返回顶部", $backToTopEle = $('<div class="backToTop"></div>').appendTo($("body"))
        .text($backToTopTxt).attr("title", $backToTopTxt).click(function() {
            $("html, body").animate({ scrollTop: 0 }, 120);
    }), $backToTopFun = function() {
        var st = $(document).scrollTop(), winh = $(window).height();
        (st > 0)? $backToTopEle.show(): $backToTopEle.hide();    
        //IE6下的定位
        if (!window.XMLHttpRequest) {
            $backToTopEle.css("top", st + winh - 166);    
        }
    };
    $(window).bind("scroll", $backToTopFun);
    $(function() { $backToTopFun(); });
})();
   </script>
     </div>   
  
        
   <%@include file="/templates/general_footer.jsp" %>
    </html>




