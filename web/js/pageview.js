/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
function init(pageConfig)
{
    if(!window.jQuery)
    {
	var script = document.createElement('script');
	script.type = "text/javascript";
	script.src = "/js/jquery.js";
	document.getElementsByTagName('head')[0].appendChild(script);
    }
    pageConfig.root.html('<div id="pageview"><div class="pagecontent"></div><div class="pagecontrol" style="text-align:center; margin: 0 auto; width: 100%;"><div style="display:inline-block;"><a href="#" class="first"><img src="/css/general/first.png" ></img></a><a href="#" class="pre2"></a><a href="#" class="pre"></a><input type="text" class="current" value="1" style="display:inline-block;float:left;border-color: #7e7a7b;border-style: solid; border-width: 1px;margin-top: 1px;margin-right: 5px; width: 38px;text-align: center;background-color: #bdbdbd;font-size: 12px;padding: 0px;height: 19px;line-height: 19px; font-weight:bold;" /><a href="#" class="next"></a><a href="#" class="next2"></a><a href="#" class="last"><img src="/css/general/last.png" ></img></a></div></div></div>');
    pageConfig.obj = {
	content:pageConfig.root.find(".pagecontent").first(),
	fb:pageConfig.root.find(".first").first(),
	pre2:pageConfig.root.find(".pre2").first(),
	pre:pageConfig.root.find(".pre").first(),
	current:pageConfig.root.find(".current").first(),
	next:pageConfig.root.find(".next").first(),
	next2:pageConfig.root.find(".next2").first(),
	lb:pageConfig.root.find(".last").first()
    };
    if (pageConfig.css == false)
    {
	pageConfig.root.find(".pagecontrol").first().find("img").css({
	    "border":"none"
	});
	pageConfig.root.find(".pagecontrol").first().find("a").css({
	    "min-width": "5px",
	    "height": "19px",
	    "border": "solid",
	    "border-width": "1px",
	    "border-color": "#7e7a7b",
	    "display": "inline-block",
	    "text-align": "center",
	    "margin-top": "1px",
	    "float": "left",
	    "background-color": "#e2e1dd",
	    "padding": "0px 6px",
	    "margin-right": "5px"
	});
	pageConfig.root.find(".pagecontrol").first().css({
	    "width":"100%",
	    "height": "21px",
	    "margin":"0 auto"
	});
	pageConfig.root.find(".pagecontrol").first().find("a:link, a:visited").css({
		"font-size": "13.34px",
		"line-height": "19px",
		"text-decoration": "none",
		"color": "#636363"
	});
    }
    pageConfig.obj.pre.bind("click",{
	param1: pageConfig
    }, clickRecall);
    pageConfig.obj.pre2.bind("click",{
	param1: pageConfig
    }, clickRecall);
    pageConfig.obj.next.bind("click",{
	param1: pageConfig
    }, clickRecall);
    pageConfig.obj.next2.bind("click",{
	param1: pageConfig
    }, clickRecall);
    pageConfig.obj.fb.bind("click",{
	param1: pageConfig
    }, function(event){
	showPage(event.data.param1, 1);
	return false;
    });
    pageConfig.obj.lb.bind("click",{
	param1: pageConfig
    }, function(event){
	showPage(event.data.param1, event.data.param1.total);
	return false;
    });
    pageConfig.obj.current.keypress({
	param1:pageConfig
    }, function(event){
	var code = event.keyCode? event.keyCode : event.which;
	code = parseInt(code);
	if (code == 13)
	{
	    var page = parseInt($(event.target).val());
	    if (page < 1 || page > event.data.param1.total)
	    {
		alert("页码数必须在1到" + event.data.param1.total + "之间！");
		return false;
	    }
	    pageConfig.obj.current.blur();
	    showPage(event.data.param1, page);
	}
	if (code == 8 || code >= 112)
	{
	    return true;
	}
	if (code < 48 || code >57){
	    return false;
	}
	if (parseInt($(event.target).val() + (code-48))  < 0 )
	{
	    $(event.target).val(1);
	    return false;
	}
	if (parseInt($(event.target).val() + (code-48)) > event.data.param1.total )
	{
	    $(event.target).val(event.data.param1.total);
	    return false;
	}
    });
    refreshView(pageConfig);
}
function clickRecall(event)
{
    var page = $(event.target).text();
    showPage(event.data.param1, page);
    return false;
}
function showPage(pageConfig, page)
{
    if (page >= 1 && page <= pageConfig.total)
    {
	pageConfig.current = parseInt(page);
	refreshView(pageConfig);
    }
}
function refreshView(pageConfig)
{
    pageConfig.obj.current.val(pageConfig.current);
    pageConfig.obj.pre2.text(pageConfig.current - 2);
    pageConfig.obj.pre.text(pageConfig.current - 1);
    pageConfig.obj.next.text(pageConfig.current + 1);
    pageConfig.obj.next2.text(pageConfig.current + 2);
    if (pageConfig.current <= 2)
    {
	pageConfig.obj.pre2.hide();
	if (pageConfig.current == 1)
	{
	    pageConfig.obj.pre.hide();
	}
	else
	{
	    pageConfig.obj.pre.show();
	}
    }
    else
    {
	pageConfig.obj.pre.show();
	pageConfig.obj.pre2.show();
    }
    if (pageConfig.current >= pageConfig.total - 1)
    {
	pageConfig.obj.next2.hide();
	if (pageConfig.current >= pageConfig.total)
	{
	    pageConfig.obj.next.hide();
	}
	else
	{
	    pageConfig.obj.next.show();
	}
    }
    else
    {
	pageConfig.obj.next.show();
	pageConfig.obj.next2.show();
    }
    var url = pageConfig.url;
    if (url.indexOf("?") == -1)
    {
	url += "?";
    }
    else
    {
	url += "&";
    }
    url += (pageConfig.arguName + "=" + pageConfig.current);
    //pageConfig.obj.content.html("");
    pageConfig.obj.content.load(url);
}
function adjustHeight(pageConfig)
{
    pageConfig.obj.current.css("height", "21px");
}
