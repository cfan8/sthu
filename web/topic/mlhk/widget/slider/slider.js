~function(smart_ui, document) {
	var TRANSFORM = smart_ui.style.transform;
	smart_ui.events
		.register(
			smart_ui.touch.start,
			'slider.drag',
			function(e, elem) {
				var ctx = smart_ui.inits.get(elem);
				if (e.target.nodeName === 'OBJECT') {
					// stop timer
					ctx.stopTimer();
					// hide cursors
					elem.nextElementSibling.style.display = 'none';
					return;
				}
				e.preventDefault();
				// TODO: column gap
				var width = elem.children[0].clientWidth + 12, Width = elem.scrollWidth - width - width, currPos = elem.style[TRANSFORM];
				currPos = currPos ? -currPos.match(/translateX\((-?\d+)/)[1] : 0;

				smart_ui.initDrag(e, function(type, e) {
					// console.log(this, type, e);
					switch (type) {
					case 'startmove':
						ctx.stopTimer();
						elem.classList.add('moving');
						break;
					case 'move':
						var pos = currPos - this.moved.x;
						if (pos < -12) {
							pos = -12;
						} else if (pos > Width) {
							pos = Width;
						}
						elem.style[TRANSFORM] = 'translateX(' + -pos + 'px)';
						// TODO
						break;
					case 'end':
						if (this.moved) {
							e.preventDefault();
							elem.classList.remove('moving');
							// TODO
							// speed^2
							var v = this.moved.x / (Date.now() - this.time), dx = v * v * (v < 0 ? 200 : -200);
							var page = Math.round((dx - elem.style[TRANSFORM].match(/translateX\((-?\d+)/)[1]) / (width + 12));
							if (page < 0)
								page = 0;
							else if (page >= ctx.count)
								page = ctx.count - 1;
							ctx.setCurrentPage(page);
							// elem.nextElementSibling.innerHTML = '';
							ctx.startTimer();
						}
						break;
					}
				});
			});

	smart_ui.inits.register('slider', function(elem, interval) {
		if (!elem.children.length)
			return {
				dispose : Boolean
			};
		var width = elem.clientWidth;
		if (width > 9000) {
			width = elem.children[0].clientWidth;
		}
		interval = interval ? +interval : 5000;
		var ctx = {
			count : elem.children.length,
			$timer : 0,
			startTimer : function() {
				this.stopTimer();
				this.$timer = setInterval(function() {
					var page = ctx.getCurrentPage() + 1;
					if (page >= ctx.count) {
						setTimeout(function() {
							elem.classList.add('moving');
							setTimeout(function() {
								ctx.setCurrentPage(0);
								setTimeout(function() {
									elem.classList.remove('moving');
								}, 0);
							}, 0);
						}, 640);
					}
					ctx.setCurrentPage(page);
				}, interval);
			},
			stopTimer : function() {
				if (this.$timer) {
					clearInterval(this.$timer);
					this.$timer = 0;
				}
			},
			dispose : function() {
				this.stopTimer();
			},
			getCurrentPage : function() {
				return Math.round(-elem.style[TRANSFORM].match(/translateX\((-?\d+)/)[1] / (width + 12));
			},
			setCurrentPage : function(n) {
				elem.style[TRANSFORM] = 'translateX(' + -n * (width + 12) + 'px)';
				var arr = Array(this.count);
				arr[n % arr.length] = ' class="active"';
				elem.nextElementSibling.innerHTML = '<o' + arr.join('></o><o') + '></o>';
			}
		};
		ctx.startTimer();
		ctx.setCurrentPage(0);
		var last = elem.firstElementChild.cloneNode(true);
		elem.appendChild(last);
		return ctx;
	});
}(smart_ui, document);