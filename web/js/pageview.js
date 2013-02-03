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
    pageConfig.root.html("<div class='pagecontent'></div><div class='pagecontrol'><a href='#' class='first'>第一页</a><a href='#' class='pre2'></a><a href='#' class='pre'></a><input type='text' class='current' value='1' /><a href='#' class='next'></a><a href='#' class='next2'></a><a href='#' class='last'>最后一页</a></div></div>");
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
	pageConfig.root.find(".pagecontrol").first().find("a").css({
	    "margin-right":"10px",
	    "font-size":"14px"
	});
	pageConfig.root.find(".pagecontrol").first().find("input").css({
	    "margin-right":"10px",
	    "width":"25px",
	    "font-size":"14px"
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

