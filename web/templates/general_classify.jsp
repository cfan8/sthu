<%-- 
    Document   : general_classify
    Created on : 2013-10-3, 9:37:27
    Author     : xiaobo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<div id="input_div" class="input-bar">
        <div class="choosediv">
            <div class="chooseActivity">
                <span class="ActivityTitle"><a id="btn_clear" style="cursor: pointer">活动</a></span>
                <div class="chooseActivityClass">
                    <div class="ActivityClass">                       
                        <div class="class-bar-text">
                            <div id="btn_group">
                                <a style="cursor: pointer;">党团活动  </a>
                            </div>
                        </div>
                        <div class="class-bar-text">
                            <div id="btn_sport" >
                                <a style="cursor: pointer;">体育赛事  </a>
                            </div>
                        </div>
                        <div   class="class-bar-text">
                            <div id="btn_lecture" >
                                <a style="cursor: pointer;">学术讲座  </a>
                            </div>
                        </div>
                        <div  class="class-bar-text">
                            <div id="btn_culture" >
                                <a style="cursor: pointer;">文化活动  </a>
                            </div>
                        </div>
                        <div  class="class-bar-text">
                            <div id="btn_amuse" >
                                <a style="cursor: pointer;">文艺活动  </a>
                            </div>
                        </div>
                        <div  class="class-bar-text">
                            <div id="btn_other" >
                                <a style="cursor: pointer;">其他活动  </a>
                            </div>
                        </div>
                    </div>
                </div>
                
                
            </div>
           
            
            <div class="hotActivity">
                <span class="hotTitle">热点推荐</span>
                <div class="hotClass">
                    <div style="color:#fff;font-size:large;">
                        <iframe style="border:none;width:240px; height: 170px; padding-left: 10px;" id="frame1" src="/studentActivity/showHotActivities.do"></iframe>
                    </div>
                </div>
            </div>
            <div class="choosedate" style="bottom:0;">
                <span id="date"></span>
                
            </div>
        </div>
    </div>
