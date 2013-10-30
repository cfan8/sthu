var smart_ui = function(document) {
	document.on = document.addEventListener;
	NodeList.prototype.forEach = Array.prototype.forEach;
	var TOUCH_START, TOUCH_MOVE, TOUCH_END;
	if ("ontouchstart" in document) {
		TOUCH_START = 'touchstart';
		TOUCH_MOVE = "touchmove";
		TOUCH_END = "touchend";
	} else {
		TOUCH_START = 'mousedown';
		TOUCH_MOVE = "mousemove";
		TOUCH_END = "mouseup";
	}
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
	// /////////////////////////////////// inits ///////
	var inits = function() {
		var $DATA_INIT = 'data-init';
		// inits
		var inits = {}, works = {};

		return {
			register : function(name, handle) {
				inits[name] = handle;
			},
			init : function(elem) {
				if (elem.hasAttribute($DATA_INIT)) {
					init(elem);
				}
				elem.querySelectorAll('[' + $DATA_INIT + ']').forEach(init);
			},
			get : function(elem) {
				return works[elem.getAttribute($DATA_INIT)];
			},
			dispose : function(elem) {
				if (elem.hasAttribute($DATA_INIT)) {
					dispose(elem);
				}
				elem.querySelectorAll('[' + $DATA_INIT + ']').forEach(dispose);
			}
		};

		function init(elem) {
			var args = elem.getAttribute($DATA_INIT).split('::'), name = args[0];
			if (name in inits) {
				var uid = guid();
				elem.setAttribute($DATA_INIT, uid);
				args[0] = elem;
				works[uid] = inits[name].apply(null, args);
			}
		}

		function dispose(elem) {
			var uid = elem.getAttribute($DATA_INIT);
			if (works[uid] !== undefined) {
				works[uid].dispose();
				works[uid] = undefined;
			}
		}
	}();
	document.addEventListener('DOMContentLoaded', function() {
		inits.init(document.body);
	});
	// ////////////////////////////////////// events ////
	var events = function() {
		var handlers = {};
		function onEvent(e) {
			var callbacks = handlers[e.type];
			if (!callbacks)
				return;
			for ( var elem = e.target; elem !== this; elem = elem.parentNode) {
				if (elem.hasAttribute('data-action')) {
					var handler = callbacks[elem.getAttribute('data-action')];
					if (handler) {
						handler(e, elem);
					}
				}
			}
		}

		return {
			register : function(type, action, handler) {
				if (!handlers[type]) {
					document.on(type, onEvent, true);
					handlers[type] = {};
				}
				handlers[type][action] = handler;
			}
		};
	}();

	// ///////////init drag /////////
	var initDrag = function() {
		var dragging = null;
		document.on(TOUCH_MOVE, function(e) {
			if (!dragging)
				return;
			e.preventDefault();
			var currPos = pos(e), dx = currPos.x - dragging.pos.x, dy = currPos.y - dragging.pos.y;
			dragging.moved = {
				x : dx,
				y : dy
			};
			if (dragging.testing) {
				if (dx * dx + dy * dy > 100) {
					dragging.testing = false;
					dragging.callback('startmove', e);
				}
			}
			dragging.testing || dragging.callback('move', e);
		}, true);
		document.on(TOUCH_END, ontouchend, true);
		document.on(TOUCH_START, ontouchend, true);
		function ontouchend(e) {
			if (dragging) {
				if (dragging.testing) {
					// TODO
				} else {
					// 
					dragging.callback('end', e);
				}
				dragging = null;
			}
		}
		return function(e, $callback) {
			if (!dragging) {
				dragging = {
					moved : null,
					testing : true,
					time : Date.now(),
					pos : pos(e),
					callback : $callback
				};
			}
		};
		function pos(e) {
			var touch = e.changedTouches ? e.changedTouches[0] : e;
			return {
				x : touch.clientX,
				y : touch.clientY
			};
		}
	}();

	var ua = navigator.userAgent;

	return {
		inits : inits,
		events : events,
		initDrag : initDrag,
		touch : {
			start : TOUCH_START,
			move : TOUCH_MOVE,
			end : TOUCH_END
		},
		style : {
			transform : /Gecko\/\d+/.test(ua) ? 'MozTransform' : /MSIE \d+/.test(ua) ? 'msTransform' : 'WebkitTransform'
		},
		closest : function(elem, tag) {
			tag = tag.toUpperCase();
			for (; elem; elem = elem.parentNode) {
				if (elem.nodeName === tag)
					return elem;
			}
		}
	};

	function guid() {
		return Math.floor(Date.now() * (Math.random() + 0.5)).toString(36);
	}
}(document);