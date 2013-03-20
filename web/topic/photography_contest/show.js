var $$ = function (id) {
	return "string" == typeof id ? document.getElementById(id) : id;
};

var Extend = function(destination, source) {
	for (var property in source) {
		destination[property] = source[property];
	}
	return destination;
}

var CurrentStyle = function(element){
	return element.currentStyle || document.defaultView.getComputedStyle(element, null);
}

var Bind = function(object, fun) {
	var args = Array.prototype.slice.call(arguments).slice(2);
	return function() {
		return fun.apply(object, args.concat(Array.prototype.slice.call(arguments)));
	}
}

var forEach = function(array, callback, thisObject){
	if(array.forEach){
		array.forEach(callback, thisObject);
	}else{
		for (var i = 0, len = array.length; i < len; i++) { callback.call(thisObject, array[i], i, array); }
	}
}

var Tween = {
	Quart: {
		easeOut: function(t,b,c,d){
			return -c * ((t=t/d-1)*t*t*t - 1) + b;
		}
	}
}


//容器对象,滑动对象,切换数量
var SlideTrans = function(container, slider, count, options) {
	this._slider = $$(slider);
	this._container = $$(container);//容器对象
	this._timer = null;//定时器
	this._count = Math.abs(count);//切换数量
	this._target = 0;//目标值
	this._t = this._b = this._c = 0;//tween参数
	
	this.Index = 0;//当前索引
	
	this.SetOptions(options);
	
	this.Auto = !!this.options.Auto;
	this.Duration = Math.abs(this.options.Duration);
	this.Time = Math.abs(this.options.Time);
	this.Pause = Math.abs(this.options.Pause);
	this.Tween = this.options.Tween;
	this.onStart = this.options.onStart;
	this.onFinish = this.options.onFinish;
	
	var bVertical = !!this.options.Vertical;
	this._css = bVertical ? "left" : "left";//方向
	
	//样式设置
	var p = CurrentStyle(this._container).position;
	p == "relative" || p == "absolute" || (this._container.style.position = "relative");
	this._container.style.overflow = "hidden";
	this._slider.style.position = "absolute";
	
	this.Change = this.options.Change ? this.options.Change :
		this._slider[bVertical ? "offsetHeight" : "offsetWidth"] / this._count;
};
SlideTrans.prototype = {
  //设置默认属性
  SetOptions: function(options) {
	this.options = {//默认值
		Vertical:	false,//是否垂直方向（方向不能改）
		Auto:		true,//是否自动
		Change:		0,//改变量
		Duration:	30,//滑动持续时间
		Time:		10,//滑动延时
		Pause:		5000,//停顿时间(Auto为true时有效)
		onStart:	function(){},//开始转换时执行
		onFinish:	function(){},//完成转换时执行
		Tween:		Tween.Quart.easeOut//tween算子
	};
	Extend(this.options, options || {});
  },
  //开始切换
  Run: function(index) {
	//修正index
	index == undefined && (index = this.Index);
	index < 0 && (index = this._count - 1) || index >= this._count && (index = 0);
	//设置参数
	this._target = -Math.abs(this.Change) * (this.Index = index);
	this._t = 0;
	this._b = parseInt(CurrentStyle(this._slider)[this.options.Vertical ? "left" : "left"]);
	this._c = this._target - this._b;
	
	this.onStart();
	this.Move();
  },
  //移动
  Move: function() {
	clearTimeout(this._timer);
	//未到达目标继续移动否则进行下一次滑动
	if (this._c && this._t < this.Duration) {
		this.MoveTo(Math.round(this.Tween(this._t++, this._b, this._c, this.Duration)));
		this._timer = setTimeout(Bind(this, this.Move), this.Time);
	}else{
		this.MoveTo(this._target);
		this.Auto && (this._timer = setTimeout(Bind(this, this.Next), this.Pause));
	}
  },
  //移动到
  MoveTo: function(i) {
	this._slider.style[this._css] = i + "px";
  },
  //下一个
  Next: function() {
	this.Run(++this.Index);
  },
  //上一个
  Previous: function() {
	this.Run(--this.Index);
  },
  //停止
  Stop: function() {
	clearTimeout(this._timer); this.MoveTo(this._target);
  }
};



function H$(i) {return document.getElementById(i)}
function H$$(c, p) {return p.getElementsByTagName(c)}
var sliderlck = function () {
function init (o) {
this.id = o.id;
this.at = o.auto ? o.auto : 3;
this.o = 0;
this.pos();
}
init.prototype = {
pos : function () {
clearInterval(this.__b);
this.o = 0;
var el = H$(this.id), li = H$$('li', el), l = li.length;
var _t = li[l-1].offsetHeight;
var cl = li[l-1].cloneNode(true);
cl.style.opacity = 0; cl.style.filter = 'alpha(opacity=0)';
el.insertBefore(cl, el.firstChild);
el.style.top = -_t + 'px';
this.anim();
},
anim : function () {
var _this = this;
this.__a = setInterval(function(){_this.animH()}, 20);
},
animH : function () {
var _t = parseInt(H$(this.id).style.top), _this = this;
if (_t >= -1) {
clearInterval(this.__a);
H$(this.id).style.top = 0;
var list = H$$('li',H$(this.id));
H$(this.id).removeChild(list[list.length-1]);
this.__c = setInterval(function(){_this.animO()}, 20);
//this.auto();
}else {
var __t = Math.abs(_t) - Math.ceil(Math.abs(_t)*.07);
H$(this.id).style.top = -__t + 'px';
}
},
animO : function () {
this.o += 2;
if (this.o == 100) {
clearInterval(this.__c);
H$$('li',H$(this.id))[0].style.opacity = 1;
H$$('li',H$(this.id))[0].style.filter = 'alpha(opacity=100)';
this.auto();
}else {
H$$('li',H$(this.id))[0].style.opacity = this.o/100;
H$$('li',H$(this.id))[0].style.filter = 'alpha(opacity='+this.o+')';
}
},
auto : function () {
var _this = this;
this.__b = setInterval(function(){_this.pos()}, this.at*1000);
}
}
return init;
}();