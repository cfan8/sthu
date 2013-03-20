/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
function enableBrowserDetect()
{
    if (getCookie("browserInfo") != "")
    {
	return;
    }
    var ua = navigator.userAgent.toLowerCase();
    if (ua.indexOf("msie 6") != -1 || ua.indexOf("msie 7") != -1 || ua.indexOf("msie 8") != -1)
    {
	$("body").append('<div id="floatDiv" style="padding: 201px 0px 0px 0px;"><div class="bg"></div><div id="hint" style="margin: 0px auto;"><img src="/css/general/alert.png"></img><div id="laterbtn">&nbsp;</div></div></div>');
	$("body").css({
	    "overflow": "hidden"
	});
	$("#laterbtn").click(function(){
	    $("#floatDiv").hide();
	    $("body").css({
		"overflow": "auto"
	    });
	    setCookie("browserInfo", true, 1);
	});
    }
}

function setCookie(c_name,value,expiredays)
{
    var exdate=new Date()
    exdate.setDate(exdate.getDate()+expiredays)
    document.cookie=c_name+ "=" +escape(value)+
    ((expiredays==null) ? "" : ";expires="+exdate.toGMTString())
}

function getCookie(c_name)
{
    if (document.cookie.length>0)
    {
	c_start=document.cookie.indexOf(c_name + "=")
	if (c_start!=-1)
	{ 
	    c_start=c_start + c_name.length+1 
	    c_end=document.cookie.indexOf(";",c_start)
	    if (c_end==-1) c_end=document.cookie.length
	    return unescape(document.cookie.substring(c_start,c_end))
	} 
    }
    return ""
}