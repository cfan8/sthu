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

    </head>
    
    <%@include file="/templates/new_general_header.jsp" %>
   
    <div id="title-board"  style="width: 900px;height: 64px; margin:30px auto;background-color:#DAD8D8" >
            <div style="float:left;margin-top:10px;"><p style="margin-top:10px;font-size:25px;">全部学生组织</p></div>
        </div>

    <div id="main_content" class="main-style">
        <div id="content_div" class="content-div-style">
            <div id="content_board" class="content-style">
                <div id="content_main_board" class="content-main-style" >
                   <!--添加主要代码-->
                   <div id="page"style="height:auto;min-height:400px;padding-top: 20px;padding-bottom: 20px;margin:25px 0;">
                        <!--div-->
                        <div style="margin-bottom:10px;">
                            <input type="image"onclick="follow()"id="batchFollowed" src="/css/activity/followInBatch_btn.jpg" style="margin: 10px 0 0px 45px ;width:100px;height: 30px;"></input>
                            <input type="checkbox" name="chooseAll" id="chooseAll"  onclick="chooseAll()" style="margin: 0 0 0 20px;">全选</input>
                        </div>
                        <%for(int i = 0; i < groups.size(); i ++){
                          UserEntity group = groups.get(i);
                          int followNum = groupsFollowNumbers.get(i);
                          int isFollowed = isGroupFollowed.get(i);
                         %>
                         <div style="float:left;margin-left:45px; margin-bottom:10px;width:240px;height: 100px;">
                        <div style="float: right;width:240px;height:100px;border: 2px dashed #DBDBDB;"> 
                            <div style="float:left;width: 90px;height: 100px;">
                                 <a  style="text-decoration:none;"href="/showGroupHome.do?groupId=<%=group.getID()%>" target="_blank"> 
                                     <%if(group.getLogoImg() != null  && group.getLogoImg().compareTo("null") != 0){%>
                                     <img src="<%=group.getLogoImg()%>" style="margin-left:13px;padding:5px; width:64px;height:64px;"/>
                                     <%}else{%>
                                     <img src="/images/logo.jpg" style="margin-left: 13px;padding:5px; width:64px;height:64px;" />
                                     <%}%> 
                                </a>
                                <%if(isFollowed == 1){%>
                                
                                
                                 <a href="/followGroupInBatchPage.do?doFollow=0&groupID=<%=group.getID()%>">
                                    <img src="/css/activity/unfollow_btn.png" style="margin-top: 5px;margin-left: 13px;width:64px; height:20px;" />
                                </a>
                                <%}else{%>
                                <a href="/followGroupInBatchPage.do?doFollow=1&groupID=<%=group.getID()%>">
                                    <img src="/css/activity/follow_btn.png" style="margin-top: 5px;margin-left: 13px;width:64px; height:20px;"/>
                        
                                </a>   
           
                                <%}%>
                            </div>
                            <div style="float:left;margin-left: 10px;margin-top: 5px;width:140px;height:100px;">
                                <a  style="text-decoration:none;" href="/showGroupHome.do?groupId=<%=group.getID()%>" target="_blank"> 
                                    <h3 style="margin: 0;color:#000;font-size :14px;height: 45px;line-height: 15px;overflow:hidden;"><%=group.getNickname()%></h3>
                                    <h4 style="font-size:9px; color:#888;height: 15px; margin:0 0 15px 0;">已有<%=followNum%>人关注</h4>
                                </a>
                                 <%if(isFollowed == 0){%>
                                <input type="checkbox" style="height:13px; width:13px;"name="aaaa" id="checkbox" value=<%=i%> ><b style="font-size:13px; color: rgba(0, 153, 255, 0.8);">关注</b></input>
                                 <%}%>
                           </div>
               
                       </div>
                       </div>
                      <%}%>
                      <div style="clear:both;"></div>
                  </div>


                   </div>
                </div>
           </div>
       </div>
        <script type="text/javascript">
     // ArrayList<Boolean> isBatchFollowed = new ArrayList<Boolean>();
   function chooseAll(){
       var y = document.getElementById("chooseAll").checked;
        var x = document.getElementsByName("aaaa");
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
      
        var x = document.getElementsByName("aaaa");
      //  alert(x.length);
        var list;
        list = <%=isBatchFollowed%>;
       // alert(list.length);
       for(var t=0;t<x.length;t++)
       {
         //  alert(t.toString());
           if(x[t].checked==true){
           list[x[t].value] = 1;   
           }
               
       }
      // alert(list.get(10));
        self.location.href = "/followGroupInBatchPage.do?groupID=-1&batchListString="+list;
   }
 
   </script>
     </div>   
  
        
   <%@include file="/templates/general_footer.jsp" %>
    </html>




