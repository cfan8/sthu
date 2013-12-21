<%-- 
    Document   : create_student_activity_form
    Created on : 2013-7-22, 19:47:16
    Author     : xiaobo
--%>
<%@page import="cn.edu.tsinghua.sthu.action.StudentActivity.ShowApplyStudentActivityPageAction"%>
<%@page import="cn.edu.tsinghua.sthu.action.StudentActivity.GroupUserValidationAction"%>
<%@page import="cn.edu.tsinghua.sthu.message.studentActivity.ShowApplyStudentActivityPageMessage"%>
<%@page import="cn.edu.tsinghua.sthu.Util"%>
<%@page import="cn.edu.tsinghua.sthu.entity.StudentActivityApplyEntity"%>
<%@page import="cn.edu.tsinghua.sthu.constant.IdentityMapping"%>
<%@page import="cn.edu.tsinghua.sthu.entity.StudentApplyOptionsEntity"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    ShowApplyStudentActivityPageMessage message = Util.getMessage(ShowApplyStudentActivityPageAction.class);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>申请学生活动</title>
        <script type="text/javascript" charset="utf-8" src="/ueditor/editor_config_user.js"></script>
	    <script type="text/javascript" charset="utf-8" src="/ueditor/editor_all_min.js"></script>
	    <script type="text/javascript" charset="utf-8" src="/js/moment.min.js"></script>
	    <script type="text/javascript" charset="utf-8" src="/js/pikaday.min.js"></script>
	    <link rel='stylesheet' type='text/css' href='/css/pikaday.css' />
	    <link rel='stylesheet' type='text/css' href='/css/classroom/status.css' />
	    <link rel='stylesheet' type='text/css' href='/css/classroom/apply.css' />
            <link rel="stylesheet" type="text/css" href="/uploadify/uploadify.css"/>
            
            <style type="text/css">
                textarea{
                    vertical-align: top;
                    resize: none;
                    width:200px;
                }
                
            </style>
    </head>
        <%@include file="/templates/general_header.jsp" %>
    <span id="position">您当前的位置：学生活动申请</span>
    <div class="processtype" id="processtype0"></div>
    <div id="formdiv">
	<form action="submitStudentActivityApply.do" method="post" id="submitf">
            <div id="requiredinfo">
                <%if(message.getApplyType() == ShowApplyStudentActivityPageMessage.USER_APPLY){%>
                <div><span class="tag">主办方（者）名称：</span><span><input type="text" name="organizerName"/></span></div>
                <%}else{%>
                <div><span class="tag">主办方（者）名称：</span><span><input type="text" disabled="disabled" name="organizerName" value="<%=message.getOrganizerName()%>"/></span></div>
                <%}%>
                <div><span class="tag">协办方（者）名称：</span><span><input type="text" name="associateOrganizerName"/></span></div>

                <div><span class="tag">申请人：</span><span class="value"><input disabled="disabled" type="text" name="applicantName" value="<%=message.getApplyUserNickname() %>" /></span></div>
                <div><span class="tag">申请人联系电话：</span><span class="value"><input type="text" name="applicantCell"/></span></div>
                <div><span class="tag">活动类型：</span><span class="value_select">
                        <select name="activityType" id="activityUsage">
                            <option value="<%=StudentActivityApplyEntity.USAGE_GROUP%>" selected="selected">党团活动</option>
                            <option value="<%=StudentActivityApplyEntity.USAGE_SPORTS%>">体育赛事</option>
                            <option value="<%=StudentActivityApplyEntity.USAGE_LECTURE%>">学术报告</option>
                            <option value="<%=StudentActivityApplyEntity.USAGE_CULTURE%>">文化活动</option>
                            <option value="<%=StudentActivityApplyEntity.USAGE_AMUSE%>">文艺活动</option>
                            <option value="<%=StudentActivityApplyEntity.USAGE_OTHER%>">其它活动</option>
                        </select>
                        <input type="text" name="usageComment" id="usageComment" style="display: none;" placeholder="请在此填写"  value="党团活动"/>
                    </span></div>
                <div><span class="tag">活动对象：</span><span class="value_select">
                    <select name="activityRange" id="activityRange">
                        <option value="<%=StudentActivityApplyEntity.RANGE_DEPART%>" selected="selected">院系</option>
                        <option value="<%=StudentActivityApplyEntity.RANGE_SCHOOL%>">全校</option>
                    </select>
                    </span></div>   
                <div><span class="tag">一级审批部门：</span><%if(message.getApplyType() == ShowApplyStudentActivityPageMessage.USER_APPLY || (message.getApplyType() == ShowApplyStudentActivityPageMessage.GROUP_APPLY && message.getGroupType() == ShowApplyStudentActivityPageMessage.GROUP_TYPE_STUDENTUNION)){%><span class="value_select">
                        <select name="applyType" id="applyType">
                            <% for (int i = 0; i < IdentityMapping.names.length; i++) {%>
                            <option value="<%=i%>" <%=i == 0 ? "selected=\"selected\"" : ""%> ><%=IdentityMapping.names[i]%></option>
                            <% }%>
                        </select>
                    </span>
                    <%}else if(message.getApplyType() == ShowApplyStudentActivityPageMessage.GROUP_APPLY && message.getGroupType() == ShowApplyStudentActivityPageMessage.GROUP_TYPE_SHETUAN){%><span class="value"><input disabled="disabled" type="text" value="<%=IdentityMapping.names[1]%>" /><input type="hidden" name="applyType" value="1"/></span>
                    <%}%>
                </div>
                <div><span class="tag">负责人：</span><span class="value"><input type="text" name="managerName"/></span></div>
                <div><span class="tag">负责人联系电话：</span><span class="value"><input type="text" name="managerCell"/></span></div>
                <div><span class="tag">活动主题：</span><span class="value"><input type="text" name="activityTheme"/></span></div>
                <div><span class="tag">活动参与人数：</span><span class="value"><input type="text" name="participantsNumber" />
                        <input type="hidden" name="applyId" value="-1"></span></div>

                <div><span class="tag">活动日期：</span><span class="value"><input type="text" id="activityDate" name="activityDate"/></span></div>
                <div><span class="tag">活动时间：</span><span class="value"><input type="text" name="timePeriod"  placeholder="请用24小时制，例：11:00-13:00" value="请用24小时制，例：11:00-13:00"/></span></div>
            </div>
            <hr />
            <div><span class="tag">涉校外：</span><span class="value">
                    <input type="radio" name="externalFlag" value="<%=StudentApplyOptionsEntity.EXTERNAL_APPLY%>" onclick="changeExternalState(1)"/>是
                    <input type="radio" name="externalFlag" value="<%=StudentApplyOptionsEntity.EXTERNAL_NOTAPPLY%>" onclick="changeExternalState(2)" checked="true"/>否
                </span></div>
            <div id="outSchoolInfo" style="display: none">
                <div><span class="tag">校外人员情况：</span><span class="value"><textarea name="externalIntro" rows="5"></textarea></span></div>
                <div><span class="tag">校外合作单位：</span><span class="value"><textarea name="externalOrganizationIntro" rows="5"></textarea></span></div>
                <div><span class="tag">出校活动安全预案：</span>
                    <div class="ueditorBlock"><script id="securityEditor" type="text/plain" style="width: 400px;">如内容较多请使用上传附件功能上传说明文档。</script><input type="hidden" name="securityPreparedness" id="securityPreparedness"/></div>
                </div>
            </div>
            <hr />
            <div><span class="tag">涉境外：</span><span class="value">
                    <input type="radio" name="overseasFlag" value="<%=StudentApplyOptionsEntity.OVERSEAS_APPLY%>" onclick="changeOverseasState(1)"/>是
                    <input type="radio" name="overseasFlag" value="<%=StudentApplyOptionsEntity.OVERSEAS_NOTAPPLY%>" onclick="changeOverseasState(2)" checked="true"/>否
                </span></div>
            <div id="outCountryInfo" style="display: none">
                <div><span class="tag">境外人员情况：</span><span class="value"><textarea name="overseasIntro" rows="5"></textarea></span></div>
                <div><span class="tag">境外合作单位：</span><span class="value"><textarea name="overseasOrganizationIntro" rows="5"></textarea></span></div>
                <div><span class="tag">相关材料：</span><div class="ueditorBlock"><script id="overseasEditor" type="text/plain" style="width: 400px;">如内容较多请使用上传附件功能上传说明文档。</script><input type="hidden" name="overseasMaterial" id="overseasMaterial"/></div></div>
            </div>
            <hr />
            <div><span class="tag">申请教室：</span><span class="value">
                    <input type="radio" name="croomFlag" value="<%=StudentApplyOptionsEntity.CROOMFLAG_APPLY%>" onclick="changeCroomState(1)"/>是
                    <input type="radio" name="croomFlag" value="<%=StudentApplyOptionsEntity.CROOMFLAG_NOTAPPLY%>" onclick="changeCroomState(2)" checked="true"/>否
                </span>
            </div> 
            <div id="croomInfo" style="display:none">
                <div><span class="tag">教室类型要求：</span><span class="value_select">
		    <select name="croomType">
			<option value="<%=StudentApplyOptionsEntity.ROOMTYPE_ORDINARY%>" selected="selected">普通教室</option>
			<option value="<%=StudentApplyOptionsEntity.ROOMTYPE_MEDIA%>">多媒体教室</option>
			<option value="<%=StudentApplyOptionsEntity.ROOMTYPE_CBUILDING_NORMAL%>">C楼普通教室</option>
			<option value="<%=StudentApplyOptionsEntity.ROOMTYPE_CBUILDING_MEDIA%>">C楼多媒体教室</option>
		    </select>
		</span></div>
                <div><span class="tag">是否服从调剂：</span><span class="value">
                    <input type="radio" name="allowAdjust" value="<%=StudentApplyOptionsEntity.ALLOWADJUST_ACCEPT%>" checked="true"/>是
                    <input type="radio" name="allowAdjust" value="<%=StudentApplyOptionsEntity.ALLOWADJUST_REJECT%>"/>否
                </span></div>
                <div><span class="tag">教室容量：</span><span class="value"><input type="text" name="croomCapacity"/></span></div>
                <div><span class="tag">借用周次:</span><span class="value_select">
                        <select name="croomWeek" id="croomWeek">
                            <option value="1" selected ="selected">第1周</option>
                            <option value="2" >第2周</option>
                            <option value="3" >第3周</option>
                            <option value="4" >第4周</option>
                            <option value="5" >第5周</option>
                            <option value="6" >第6周</option>
                            <option value="7" >第7周</option>
                            <option value="8" >第8周</option>
                            <option value="9" >第9周</option>
                            <option value="10" >第10周</option>
                            <option value="11" >第11周</option>
                            <option value="12" >第12周</option>
                            <option value="13" >第13周</option>
                            <option value="14" >第14周</option>
                            <option value="15" >第15周</option>
                            <option value="16" >第16周</option>
                        </select>
                    </span></div>
                <div><span class="tag"></span><span class="value">
                        <table class="biaodan_table" style="border-collapse:collapse;width:85%!important">
                                <tbody>
                                <tr>
                                        <td class="td_bg_blue" style="text-align:center!important" colspan="2">
                                                节次
                                        </td>
                                        <td class="td_bg_blue" style="text-align:center!important">
                                                周一<label id="monday" name="monday" style="display:none"></label>
                                        </td>
                                        <td class="td_bg_blue" style="text-align:center!important">
                                                周二<label id="tuesday" name="tuesday" style="display:none"></label>
                                        </td>
                                        <td class="td_bg_blue" style="text-align:center!important">
                                                周三 <label id="wednesday" name="wednesday" style="display:none"></label>
                                        </td>
                                        <td class="td_bg_blue" style="text-align:center!important">
                                                周四<label id="thursday" name="thursday" style="display:none"></label>
                                        </td>
                                        <td class="td_bg_blue" style="text-align:center!important">
                                                周五<label id="friday" name="friday" style="display:none"></label>
                                        </td>
                                        <td class="td_bg_blue" style="text-align:center!important">
                                                周六<label id="saturday" name="saturday" style="display:none"></label>
                                        </td>
                                        <td class="td_bg_blue" style="text-align:center!important">
                                                周日<label id="sunday" name="sunday" style="display:none"></label>
                                        </td>
                                </tr>

                                <tr>

                                        <td class="td_bg_blue" style="text-align:center!important" rowspan="2">
                                                上午
                                        </td>



                                        <td class="td_bg_blue" style="text-align:center!important">
                                                第
                                                1
                                                大节(8:00-9:35)
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_1" id="seg_1" value="1">
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_2" id="seg_2" value="1">
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_3" id="seg_3" value="1">
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_4" id="seg_4" value="1">
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_5" id="seg_5" value="1">
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_6" id="seg_6" value="1">
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_7" id="seg_7" value="1">
                                        </td>

                                </tr>

                                <tr>



                                        <td class="td_bg_blue" style="text-align:center!important">
                                                第
                                                2
                                                大节(9:50-12:15)
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_1" id="seg_1" value="2">
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_2" id="seg_2" value="2">
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_3" id="seg_3" value="2">
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_4" id="seg_4" value="2">
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_5" id="seg_5" value="2">
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_6" id="seg_6" value="2">
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_7" id="seg_7" value="2">
                                        </td>

                                </tr>

                                <tr>


                                        <td class="td_bg_blue" style="text-align:center!important" rowspan="3">
                                                中午
                                        </td>


                                        <td class="td_bg_blue" style="text-align:center!important">
                                                第
                                                3
                                                大节(13:30-15:05)
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_1" id="seg_1" value="3">
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_2" id="seg_2" value="3">
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_3" id="seg_3" value="3">
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_4" id="seg_4" value="3">
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_5" id="seg_5" value="3">
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_6" id="seg_6" value="3">
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_7" id="seg_7" value="3">
                                        </td>

                                </tr>

                                <tr>



                                        <td class="td_bg_blue" style="text-align:center!important">
                                                第
                                                4
                                                大节(15:20-16:55)
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_1" id="seg_1" value="4">
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_2" id="seg_2" value="4">
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_3" id="seg_3" value="4">
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_4" id="seg_4" value="4">
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_5" id="seg_5" value="4">
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_6" id="seg_6" value="4">
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_7" id="seg_7" value="4">
                                        </td>

                                </tr>

                                <tr>



                                        <td class="td_bg_blue" style="text-align:center!important">
                                                第
                                                5
                                                大节(17:05-18:40)
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_1" id="seg_1" value="5">
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_2" id="seg_2" value="5">
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_3" id="seg_3" value="5">
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_4" id="seg_4" value="5">
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_5" id="seg_5" value="5">
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_6" id="seg_6" value="5">
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_7" id="seg_7" value="5">
                                        </td>

                                </tr>

                                <tr>



                                        <td class="td_bg_blue" style="text-align:center!important">
                                                晚上
                                        </td>

                                        <td class="td_bg_blue" style="text-align:center!important">
                                                第
                                                6
                                                大节(19:20-21:50)
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_1" id="seg_1" value="6">
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_2" id="seg_2" value="6">
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_3" id="seg_3" value="6">
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_4" id="seg_4" value="6">
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_5" id="seg_5" value="6">
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_6" id="seg_6" value="6">
                                        </td>

                                        <td style="text-align:center; vertical-align:middle">
                                                <input type="checkbox" name="seg_7" id="seg_7" value="6">
                                        </td>

                                </tr>
                        </tbody></table>
                    </span></div>
                <div><span class="tag">借用具体时间:</span>
                    <span class="value">
                        <input type="text" id="croomClassTime" name="croomClassTime" readonly="true"/>
                        <input type="text"  style="display:none;" id="HDSJ" name="HDSJ"/>
                    </span></div>
                
                <div><span class="tag">开始日期和时间:</span><span class="value"><input type="text" id="croomStartTime" name="croomStartTime" /></span></div>
                <div><span class="tag">结束日期和时间:</span><span class="value"><input type="text" id="croomEndTime" name="croomEndTime" /></span></div>
            
            </div>
            <hr />
            <div><span class="tag">申请电子屏：</span><span class="value">
                    <input type="radio" name="LEDFlag" value="<%=StudentApplyOptionsEntity.LEDFLAG_APPLY%>" onclick="changeLEDState(1)"/>是
                    <input type="radio" name="LEDFlag" value="<%=StudentApplyOptionsEntity.LEDFLAG_NOTAPPLY%>" checked="true" onclick="changeLEDState(2)"/>否
                </span>
            </div>
            <div id="LEDInfo" style="display: none">
                <div><span class="tag">电子屏显示内容：</span><span class="value"><textarea name="LEDContent" rows="3"></textarea></span></div>
                <div><span class="tag">开始日期和时间：</span><span class="value"><input type="text" name="LEDStartTime"/></span></div>
                <div><span class="tag">结束日期和时间：</span><span class="value"><input type="text" name="LEDEndTime"/></span></div>
            </div>
            <hr />
            <div><span class="tag">申请室外场地：</span><span class="value">
                    <input type="radio" name="outsideFlag" value="<%=StudentApplyOptionsEntity.OUTSIDEFLAG_APPLY%>" onclick="changeOutsideState(1)"/>是
                    <input type="radio" name="outsideFlag" value="<%=StudentApplyOptionsEntity.OUTSIDEFLAG_NOTAPPLY%>" checked="true" onclick="changeOutsideState(2)"/>否
                </span>
            </div>
            <div id="outsideInfo" style="display: none">
                <div><span class="tag">活动地点:</span><span class="value_select">
		    <select name="activityLocation">
			<option value="<%=StudentApplyOptionsEntity.LOCATION_ZIJING%>" selected="selected">紫荆园门口</option>
			<option value="<%=StudentApplyOptionsEntity.LOCATION_TAOLI%>">桃李园门口</option>
			<option value="<%=StudentApplyOptionsEntity.LOCATION_TINGTAOSHULIN%>">听涛园附近小树林区域</option>
			<option value="<%=StudentApplyOptionsEntity.LOCATION_TINGTAOBEI%>">听涛园以北学堂路段学生生活区</option>
		    </select>
		</span></div>
                <div><span class="tag">借用日期:</span><span class="value"><input type="text" name="outsideBorrowDate"/></span></div>
                <div><span class="tag">借用时间段:</span><span class="value"><input type="text" name="outsideTimePeriod"/></span></div>
            </div>
            <hr />
            <div><span class="tag">申请展板：</span><span class="value">
                    <input type="radio" name="boardFlag" value="<%=StudentApplyOptionsEntity.BOARDFLAG_APPLY%>" onclick="changeBoardState(1)"/>是
                    <input type="radio" name="boardFlag" value="<%=StudentApplyOptionsEntity.BOARDFLAG_NOTAPPLY%>" checked="true" onclick="changeBoardState(2)"/>否
                </span>
            </div>
            <div id="boardInfo" style="display: none">
                <div><span class="tag">规格:</span><span class="value_select">
                        <select name="boardSize">
                            <option value="<%=StudentApplyOptionsEntity.BOARDSIZE_LARGE%>" selected="selected">2x3(限1块)</option>
                            <option value="<%=StudentApplyOptionsEntity.BOARDSIZE_MEDIUMONE%>">2x1.5(限2块)</option>
                            <option value="<%=StudentApplyOptionsEntity.BOARDSIZE_SMALL%>">0.9x1.2</option>
                        </select>
                    </span></div>
                <div><span class="tag">块数:</span><span class="value"><input type="text" name="boardNum"/></span></div>
                <div><span class="tag">开始日期和时间:</span><span class="value"><input type="text" name="BoardStartTime"/></span></div>
                <div><span class="tag">结束日期和时间:</span><span class="value"><input type="text" name="BoardEndTime"/></span></div>
                <div><span class="tag">活动材料（附件）:</span><div class="ueditorBlock"><script id="boardEditor" type="text/plain" style="width: 400px;">必须上传附件。</script><input type="hidden" name="boardMaterial" id="boardMaterial"/></div></div>
            </div>
            <hr />
            <div style="display:none;"><span class="tag">申请宣传栏：</span><span class="value">
                    <input type="radio" name="bulletinFlag" value="<%=StudentApplyOptionsEntity.BULLETINFLAG_APPLY%>" onclick="changeBulletinState(1)"/>是
                    <input type="radio" name="bulletinFlag" value="<%=StudentApplyOptionsEntity.BULLETINFLAG_NOTAPPLY%>" checked="true" onclick="changeBulletinState(2)"/>否
                </span>
            </div>
            <div id="bulletinInfo" style="display:none">
                <div><span class="tag">申请区域：</span><span class="value_select">
                        <select name="bulletinArea">
                            <option value="<%=StudentApplyOptionsEntity.BULLETINAREA_CBUILDING%>" selected="selected">C楼区</option>
                            <option value="<%=StudentApplyOptionsEntity.BULLETINAREA_ZICAO%>">紫操区</option>
                            <option value="<%=StudentApplyOptionsEntity.BULLETINAREA_TAOLI%>">桃李园区</option>
                            <option value="<%=StudentApplyOptionsEntity.BULLETINAREA_ZIJING%>">紫荆园区</option>
                            <option value="<%=StudentApplyOptionsEntity.BULLETINAREA_DONGSUSHE%>">东侧宿舍区</option>
                            <option value="<%=StudentApplyOptionsEntity.BULLETINAREA_XISUSHE%>">西侧宿舍区</option>
                        </select>
                    </span></div>
                <div><span class="tag">展板编号：</span><span class="value"><input type="text" name="bulletinIndex" placeholder="请使用连续数字字符，如1-5"/></span></div>
                <div><span class="tag">使用原因：</span><span class="value"><textarea name="bulletinApplyReason" rows="3"></textarea></span></div>
                <div class="manage_item">
                    <img src="/images/banner.jpg" width="80px" height="60px" id="poster_img"/>
                    上传图片（400*300）：<div class="upbtn"><input type="button" id="upbtn_poster"/></div>
                    <input type="hidden" name="posterImg" id="posterImg" value="/images/banner.jpg"/>
                </div>
            </div>
            <hr />
            <div><span class="tag">申请发布到学生清华：</span><span class="value">
                    <input type="radio" name="publicityFlag" value="<%=StudentApplyOptionsEntity.PUBLICITYFLAG_APPLY%>" checked="true" onclick="changePublicityState(1)"/>是
                    <input type="radio" name="publicityFlag" value="<%=StudentApplyOptionsEntity.PUBLICITYFLAG_NOTAPPLY%>" onclick="changePublicityState(2)"/>否
                </span>
            </div>
            <div id="publicityInfo">
                <div><span class="tag">宣传图片：</span>
                <div class="manage_item">
                    <img src="/images/banner.jpg" width="80px" height="60px" id="main_img"/>
                    上传图片（400*300）：<div class="upbtn"><input type="button" id="upbtn_main"/></div>
                    <input type="hidden" name="mainImg" id="mainImg" value="/images/banner.jpg"/>
                </div>
                </div>
                <div><span class="tag">宣传材料:</span><div class="ueditorBlock"><script id="publicityEditor" type="text/plain" style="width: 400px;">如内容较多请使用上传附件功能上传说明文档。</script><input type="hidden" name="publicityMaterials" id="publicityMaterials"/></div></div>
            </div>
            <hr />
            <div><span class="tag">申请门票抽签：</span><span class="value">
                    <input type="radio" name="ticketFlag" value="<%=StudentApplyOptionsEntity.TICKETFLAG_APPLY%>" onclick="changeTicketState(1)"/>是
                    <input type="radio" name="ticketFlag" value="<%=StudentApplyOptionsEntity.TICKETFLAG_NOTAPPLY%>" checked="true" onclick="changeTicketState(2)"/>否
                </span>
            </div>
            <div id="ticketInfo" style="display: none">
                <div><span class="tag">门票数目:</span><span class="value"><input type="text" name="ticketNum"/></span></div>
                <div><span class="tag">抽票日期:</span><span class="value"><input type="text" id="ticketRandomDate" name="ticketRandomDate"/></span></div>
                <div><span class="tag">发票时间:</span><span class="value"><input type="text" name="ticketTime"/></span></div>
                <div><span class="tag">发票地点:</span><span class="value"><input type="text" name="ticketLocation"/></span></div>
            </div>
            <hr />
            <div><span class="tag">活动具体内容：</span>
		<div class="ueditorBlock"><script id="contentEditor" type="text/plain" style="width: 400px;">如内容较多请使用上传附件功能上传说明文档。</script><input type="hidden" name="activityContent" id="contentInput"/></div>
	    </div>
	    <div id="submitbutton"><a href="#" id="submitbtn">下一步</a></div>
	</form>
    </div>
    <%@include file="/templates/general_footer.jsp" %>
    
    <script type="text/javascript" charset="utf-8" src="/uploadify/jquery.uploadify.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){ 
                $("input[name^='seg_']").change(function() { 
                        getcheck();
                }); 
                $("#croomWeek").change(function(){
                    getcheck();
                });
        }); 
        function getcheck(){
            document.getElementById("croomClassTime").value="";
            document.getElementById("HDSJ").value = "";
            var week = document.getElementById("croomWeek").options[document.getElementById("croomWeek").selectedIndex].value;
            var a = parseInt(week) - 1;
            var str="";
            for(var i = 0; i < 16; i ++){
                if(i == a)
                    str +="1";
                else
                    str +="0";
            }
            str += ";"
            document.getElementById("HDSJ").value=str;
            
            
            var x1 = document.getElementsByName("seg_1");
            for(var i = 0; i < x1.length; i ++){
                    if (x1[i].checked == true) {
                            document.getElementById("croomClassTime").value+="周一第"+x1[i].value.toString()+"大节 ";
                            document.getElementById("HDSJ").value += "1"+x1[i].value.toString()+";";
                    }
            }
            var x2 = document.getElementsByName("seg_2");
            for(var i = 0; i < x2.length; i ++){
                    if (x2[i].checked == true) {
                            document.getElementById("croomClassTime").value+="周二第"+x2[i].value.toString()+"大节 ";
                            document.getElementById("HDSJ").value += "2"+x2[i].value.toString()+";";
                    }
            }
            var x3 = document.getElementsByName("seg_3");
            for(var i = 0; i < x3.length; i ++){
                    if (x3[i].checked == true) {
                            document.getElementById("croomClassTime").value+="周三第"+x3[i].value.toString()+"大节 ";
                            document.getElementById("HDSJ").value += "3"+x3[i].value.toString()+";";
                    }
            }
            var x4 = document.getElementsByName("seg_4");
            for(var i = 0; i < x4.length; i ++){
                    if (x4[i].checked == true) {
                            document.getElementById("croomClassTime").value+="周四第"+x4[i].value.toString()+"大节 ";
                            document.getElementById("HDSJ").value += "4"+x4[i].value.toString()+";";
                    }
            }
            var x5 = document.getElementsByName("seg_5");
            for(var i = 0; i < x5.length; i ++){
                    if (x5[i].checked == true) {
                            document.getElementById("croomClassTime").value+="周五第"+x5[i].value.toString()+"大节 ";
                            document.getElementById("HDSJ").value += "5"+x5[i].value.toString()+";";
                    }
            }
            var x6 = document.getElementsByName("seg_6");
            for(var i = 0; i < x6.length; i ++){
                    if (x6[i].checked == true) {
                            document.getElementById("croomClassTime").value+="周六第"+x6[i].value.toString()+"大节 ";
                            document.getElementById("HDSJ").value += "6"+x6[i].value.toString()+";";
                    }
            }
            var x7 = document.getElementsByName("seg_7");
            for(var i = 0; i < x7.length; i ++){
                    if (x7[i].checked == true) {
                            document.getElementById("croomClassTime").value+="周日第"+x7[i].value.toString()+"大节 ";
                            document.getElementById("HDSJ").value += "7"+x7[i].value.toString()+";";
                    }
            }
    }
	var ce = UE.getEditor('contentEditor');
        var se = UE.getEditor('securityEditor');
        var oe = UE.getEditor('overseasEditor');
        var be = UE.getEditor('boardEditor');
        var pe = UE.getEditor('publicityEditor');
        
        function changeExternalState(state){
            if(state == 1){
                $("#outSchoolInfo").show();
            }else{
                $("#outSchoolInfo").hide();
            }
        }
        
        function changeOverseasState(state){
            if(state == 1){
                $("#outCountryInfo").show();
            }else{
                $("#outCountryInfo").hide();
            }
        }
        
        function changeCroomState(state){
            if(state == 1){
                $("#croomInfo").show();
            }else{
                $("#croomInfo").hide();
            }
        }
        
        function changeLEDState(state){
            if(state == 1){
                $("#LEDInfo").show();
            }else{
                $("#LEDInfo").hide();
            }
        }
        
        function changeOutsideState(state){
            if(state == 1){
                $("#outsideInfo").show();
            }else{
                $("#outsideInfo").hide();
            }
        }
        
        function changeBoardState(state){
            if(state == 1){
                $("#boardInfo").show();
            }else{
                $("#boardInfo").hide();
            }
        }
        
        function changeBulletinState(state){
            if(state == 1){
                $("#bulletinInfo").show();
            }else{
                $("#bulletinInfo").hide();
            }
        }
        
        function changePublicityState(state){
            if(state == 1){
                $("#publicityInfo").show();
            }else{
                $("#publicityInfo").hide();
            }
        }
        
        $("#upbtn_main").uploadify({
            'multi'    : false,
            'height':'35px',
            'width':'710px',
            'buttonText' : '上传图片',
            'fileSizeLimit' : '4000KB',
            'fileTypeDesc' : '图片文件',
            'fileTypeExts' : '*.gif; *.jpg; *.png',
            'swf'      : '/uploadify/uploadify.swf',
            'uploader' : '/ueditor/jsp/imageUp.jsp',
            'onUploadSuccess' : function(file, data, response) {
		json=eval('('+data+')');
		$("#main_img").attr("src","/"+json.url);
                $("#mainImg").val("/"+json.url);
	    }
        });
        
        $("#upbtn_poster").uploadify({
            'multi'    : false,
            'height':'35px',
            'width':'710px',
            'buttonText' : '上传图片',
            'fileSizeLimit' : '4000KB',
            'fileTypeDesc' : '图片文件',
            'fileTypeExts' : '*.gif; *.jpg; *.png',
            'swf'      : '/uploadify/uploadify.swf',
            'uploader' : '/ueditor/jsp/imageUp.jsp',
            'onUploadSuccess' : function(file, data, response) {
		json=eval('('+data+')');
		$("#poster_img").attr("src","/"+json.url);
                $("#posterImg").val("/"+json.url);
	    }
        });
        
        function changeTicketState(state){
            if(state == 1){
                $("#ticketInfo").show();
            }else{
                $("#ticketInfo").hide();
            }
        }
        
	$("#activityUsage").change(function(){
	    $("#usageComment").val($("#activityUsage").find("option:selected").text());
	    if ($("#activityUsage").val() == <%=StudentActivityApplyEntity.USAGE_OTHER%>){
		$("#usageComment").val("请在此填写");
		$("#usageComment").show();
	    }
	    else
	    {
		$("#usageComment").hide();
	    }
	});
        
	var picker = new Pikaday({
	    field: document.getElementById('activityDate'),
	    format: 'YYYY-MM-DD',
	    minDate: moment(moment().format("YYYY-MM-DD")).toDate(),
	    maxDate: moment(moment().format("YYYY-MM-DD")).add("days", 10).toDate()
	});
    
        var ticketPicker = new Pikaday({
            field: document.getElementById('ticketRandomDate'),
            format:'YYYY-MM-DD'
        });
        
	$("#activityDate").change(function(){
	
	});
	$("form input[name='participantsNumber']").blur(function(){
	    var str = $(this).val().replace(/[^\d]+/g, "");
	    $(this).val(str);
	});
	
	$("#submitbtn").click(function(){
	    $("#contentInput").val(ce.getContent());
	    var needalert = false;
	    $("form #requiredinfo input").each(function(){
		if ($(this).val() == "")
		{
		    needalert = true;
		    return false;
		}
	    });
            if($("input[name='externalFlag']")[0].checked){
                $("#securityPreparedness").val(se.getContent());
                $("#outSchoolInfo input").each(function(){
                    if($(this).val() == "")
                    {
                        needalert = true;
                        return false;
                    }
                });
                $("#outSchoolInfo textarea").each(function(){
                    if ($(this).val() == "")
                    {
                        needalert = true;
                        return false;
                    }
                });
            }
            if($("input[name='overseasFlag']")[0].checked){
                $("#overseasMaterial").val(oe.getContent());
                $("#outCountryInfo input").each(function(){
                    if($(this).val() == "")
                    {
                        needalert = true;
                        return false;
                    }
                });
                $("#outCountryInfo textarea").each(function(){
                    if ($(this).val() == "")
                    {
                        needalert = true;
                        return false;
                    }
                });
            }
            if($("input[name='croomFlag']")[0].checked){
                $("#croomInfo input").each(function(){
                    if ($(this).val() == "")
                    {
                        needalert = true;
                        return false;
                    }
                });
            }
            if($("input[name='LEDFlag']")[0].checked){
                $("#LEDInfo input").each(function(){
                    if ($(this).val() == "")
                    {
                        needalert = true;
                        return false;
                    }
                });
                $("#LEDInfo textarea").each(function(){
                    if ($(this).val() == "")
                    {
                        needalert = true;
                        return false;
                    }
                });
            }
            if($("input[name='outsideFlag']")[0].checked){
                $("#outsideInfo input").each(function(){
                    if ($(this).val() == "")
                    {
                        needalert = true;
                        return false;
                    }
                });
            }
            if($("input[name='boardFlag']")[0].checked){
                $("#boardMaterial").val(be.getContent());
                $("#boardInfo input").each(function(){
                    if ($(this).val() == "")
                    {
                        needalert = true;
                        return false;
                    }
                });
            }
            if($("input[name='bulletinFlag']")[0].checked){
                $("#bulletinInfo input").each(function(){
                    if($(this).val() == "")
                    {
                        needalert = true;
                        return false;
                    }
                });
                $("#bulletinInfo textarea").each(function(){
                    if ($(this).val() == "")
                    {
                        needalert = true;
                        return false;
                    }
                });
            }
            if($("input[name='publicityFlag']")[0].checked){
                $("#publicityMaterials").val(pe.getContent());
                $("#publicityInfo input").each(function(){
                    if ($(this).val() == "")
                    {
                        needalert = true;
                        return false;
                    }
                });
            }
            if($("input[name='ticketFlag']")[0].checked){
                $("#ticketInfo input").each(function(){
                    if ($(this).val() == "")
                    {
                        needalert = true;
                        return false;
                    }
                });
            }
	    if ($("select[name='applyType']").val() == 0)
	    {
		needalert = true;
	    }
	    if (needalert)
	    {
		alert("请完整填写所有表格！");
	    }
	    else
	    {
		$("input[disabled='disabled']").removeAttr("disabled");
		$("#submitf").submit();
	    }
	    return false;
	});
        
        
        
        
    </script>
</html>
