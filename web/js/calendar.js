/**
 * Calendar
 * 
 * @author kyriosli
 * @date 2013/9/27
 */
var calendar = function(document) {
	var MSPerDay = 86400000, Data_Month = 'data-month';
	var events = {};
	// 每个学期的第一天（星期一），用来计算周次
	var FirstMondayOfSemesters = [ '2013-09-16' ];
	var weeks = {};
	FirstMondayOfSemesters.forEach(function(str) {
		var t = dateToDays(str);
		weeks[t] = 1;
		for ( var i = 2; i <= 16; i++) {
			t += 7;
			weeks[t] = i;
		}
	});

	'classList' in document.documentElement || function() {
		function ClassList(entry) {
			this.entry = entry;
		}
		ClassList.prototype = {
			add : function(name) {
				this.contains(name) || (this.entry.className += ' ' + name);
			},
			remove : function(name) {
				if (this.contains(name)) {
					var arr = this.entry.className.split(" "), L = arr.length;
					while (L--) {
						if (arr[L] === name)
							arr.splice(L, 1);
					}
					this.entry.className = arr.join(' ');
				}
			},
			contains : function(name) {
				return (' ' + this.entry.className + ' ').indexOf(' ' + name + ' ') !== -1;
			},
			toggle : function(name, bool) {
				if (arguments.length < 2)
					bool = !this.contains(name);
				if (bool) {
					this.add(name);
				} else {
					this.remove(name);
				}
				return bool;
			}
		};
		Object.defineProperty(Element.prototype, 'classList', {
			get : function() {
				return new ClassList(this);
			}
		});
	}();

	function initCalendar(elem) {
		var isSmall = elem.classList.contains('small');
		elem.redraw = isSmall ? redraw : redraw2;
		elem.redraw();
		elem.addEventListener('click', captureClick, true);
	}

	function captureClick(e) {
		var target = e.target, elem = this;
		while (target.nodeName !== 'A') {
			if (target === elem)
				return;
			target = target.parentNode;
		}
		if (elem.classList.contains('large') && target.classList.contains('event')) {
			e.preventDefault();
			redrawEvent(elem, target.getAttribute('data-day'));
			elem.querySelector('.curr').classList.remove('curr');
			target.classList.add('curr');
		} else if (target.hasAttribute(Data_Month)) {
			elem.setAttribute(Data_Month, target.getAttribute(Data_Month));
			elem.redraw();
		}
	}

	function redraw() {
		var elem = this;
		var t = new Date(), today = t / MSPerDay << 0;
		var m = /^(\d{4})\/(\d{1,2})$/.exec(elem.getAttribute(Data_Month));
		if (m) {
			t.setFullYear(+m[1], +m[2] - 1, 1);
		} else {
			t.setDate(1);
		}
		var firstDay = t.getDay(), currMonth = t.getMonth(), currYear = t.getFullYear();
		var day1 = t / MSPerDay << 0, day2 = t.setMonth(t.getMonth() + 1) / MSPerDay << 0;
		day1 -= firstDay ? firstDay - 1 : 6;
		var buf = '<div><a class="icon-arrow-up" href="javascript:;" data-month="' + getDataMonth(currMonth, currYear, false)
			+ '"></a>' + (currMonth + 1) + '月<a class="icon-arrow-down" href="javascript:;" data-month="'
			+ getDataMonth(currMonth, currYear, true) + '"></a></div><table>';
		while (day1 < day2) {
			if (day1 in weeks) {
				buf += '<tr><td><span>' + weeks[day1] + 'W</span></td>';
			} else
				buf += '<tr><td><span></span></td>';
			for ( var i = 7; i--;) {
				var t = new Date(day1 * MSPerDay), data = events[day1];
				var month = t.getMonth();

				var attributes = {
					href : 'javascript:;',
					'data-day' : day1
				}, classNames = [];

				if (day1 === today) {
					classNames.push('today');
					attributes.title = '今天';
				} else if (currMonth !== month) {
					classNames.push('lighter');
					attributes['data-month'] = t.getFullYear() + '/' + (month + 1);
				}
				if (data) {
					classNames.push('event');
					attributes.href = data[0].href;
					attributes.title = data.map(function(event) {
						return event.title + '\n时间：' + event.time + '\n地点: ' + event.place;
					}).join('\n----------------\n');
				}
				if (classNames.length)
					attributes['class'] = classNames.join(' ');

				buf += '<td><a' + handleAttributes(attributes) + '>' + t.getDate() + '</a></td>';
				day1++;
			}
			buf += '</tr>';
		}
		buf += '</table>';
		elem.innerHTML = buf;
	}

	// 我的学清页面日历点击生成活动详情函数
	function redrawEvent(elem, day) {
		var data = events[day];
		elem.lastChild.innerHTML = data ? data.map(function(event) {
			return event.time + ' <a href=\''+ event.href +'\'>' + event.title + '</a>';
		}).join('<br/>') : '';
	}

	function redraw2() {
		var elem = this;
		var t = new Date(), today = t / MSPerDay << 0;
		var m = /^(\d{4})\/(\d{1,2})$/.exec(elem.getAttribute(Data_Month));
		if (m) {
			t.setFullYear(+m[1], +m[2] - 1, 1);
		} else {
			t.setDate(1);
		}
		var firstDay = t.getDay(), currMonth = t.getMonth(), currYear = t.getFullYear();
		var day1 = t / MSPerDay << 0, day2 = t.setMonth(t.getMonth() + 1) / MSPerDay << 0;
		day1 -= firstDay ? firstDay - 1 : 6;
		var buf = '<table><tr><th class="fields"><span class="week">周</span><span class="day">星期</span></th><th>一</th><th>二</th><th>三</th><th>四</th><th>五</th><th>六</th><th>日</th></tr>';
		while (day1 < day2) {
			if (day1 in weeks) {
				buf += '<tr><td>' + weeks[day1] + 'w</td>';
			} else
				buf += '<tr><td><span></span></td>';
			for ( var i = 7; i--;) {
				var t = new Date(day1 * MSPerDay), data = events[day1];
				var month = t.getMonth();

				var attributes = {
					href : 'javascript:;',
					'data-day' : day1
				}, classNames = [];

				if (day1 === today) {
					classNames.push('curr');
					attributes.title = '今天';
				} else if (currMonth !== month) {
					classNames.push('lighter');
					attributes['data-month'] = t.getFullYear() + '/' + (month + 1);
				}
				if (data) {
					classNames.push('event');
					attributes.href = data[0].href;
					attributes.title = data.map(function(event) {
						return event.title + '\n时间：' + event.time + '\n地点: ' + event.place;
					}).join('\n----------------\n');
				}
				if (classNames.length)
					attributes['class'] = classNames.join(' ');

				buf += '<td><a' + handleAttributes(attributes) + '>' + t.getDate() + '</a></td>';
				day1++;
			}
			buf += '</tr>';
		}
		buf += '</table><div></div>';
		elem.innerHTML = buf;
		redrawEvent(elem, today);
	}
	function handleAttributes(attributes) {
		var buf = '';
		for ( var k in attributes) {
			buf += ' ' + k + '="' + escape(attributes[k]) + '"';
		}
		return buf;
	}
	var escape = function() {
		var repls = {
			'"' : '&quot;',
			'<' : '&lt;',
			'>' : '&gt;',
			'&' : '&amp;',
			'\'' : '&apos;'
		}, r = /["<>&]/g, m = function(m) {
			return repls[m];
		};
		return function(html) {
			return String(html).replace(r, m);
		};
	}();
	// on load auto init
	document.addEventListener('DOMContentLoaded', function() {
		[].forEach.call(document.querySelectorAll('.calendar'), initCalendar);
	});

	return {
		addData : function(obj) {
			for ( var k in obj) {
				events[dateToDays(k)] = obj[k];
			}
		}
	};

	function dateToDays(date) {
		return new Date(date) / MSPerDay << 0;
	}
	function getDataMonth(currMonth, currYear, inc) {
		if (inc) {
			return currMonth == 11 ? currYear + 1 + '/1' : currYear + '/' + (currMonth + 2);
		} else {
			return currMonth == 0 ? currYear - 1 + '/12' : currYear + '/' + currMonth;
		}
	}
}(document);
