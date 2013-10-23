~function(smart_ui, document) {

	smart_ui.events.register('click', 'albumview.select', function(e, elem) {
		if (e.target.nodeName !== 'IMG')
			return;
		var ctx = smart_ui.inits.get(smart_ui.closest(elem, 'section'));
		ctx.display(e.target);
	});

	smart_ui.events.register(smart_ui.touch.start, 'albumview.seek', function(e, seeker) {
		var ctx = smart_ui.inits.get(smart_ui.closest(seeker, 'section'));
		e.preventDefault();

		var currPos = parseInt(seeker.style.left || 0), maxPos = seeker.parentNode.clientWidth - seeker.clientWidth - 4;
		smart_ui.initDrag(e, function(type, e) {
			if (type === 'move') {
				var pos = currPos + this.moved.x;
				if (pos < 0)
					pos = 0;
				else if (pos > maxPos)
					pos = maxPos;
				seeker.style.left = pos + 'px';
				ctx.elem.querySelector('ul').style.left = -pos / seeker.clientWidth * 100 + '%';
			}
		});
	});

	smart_ui.events.register('click', 'albumview.pageup', function(e, elem) {
		smart_ui.inits.get(smart_ui.closest(elem, 'section')).seek(false);
	});
	smart_ui.events.register('click', 'albumview.pagedown', function(e, elem) {
		smart_ui.inits.get(smart_ui.closest(elem, 'section')).seek(true);
	});

	smart_ui.inits.register('albumview', function(elem) {

		var ctx = {
			elem : elem,
			display : function(img) {
				var li = img.parentNode;
				if (li.classList.contains('active'))
					return;
				var curr = li.parentNode.querySelector('.active');
				curr && curr.classList.remove('active');
				li.classList.add('active');
				var url = img.getAttribute('data-url');
				elem.querySelector('[data-function="pic"]').innerHTML = '<img src="' + url + '"/>';
				elem.querySelector('[data-function="pic_url"]').href = url;
				elem.querySelector('[data-function="pic_desc"]').innerHTML = img.title || '&nbsp;';
			},
			seek : function(next) {
				var ul = elem.querySelector('ul');
				var curr = parseFloat(ul.style.left || 0);
				if (next) {
					curr -= 100;
					var max = -ul.scrollWidth / ul.parentNode.clientWidth * 100 + 100;
					if (curr < max)
						curr = max;
				} else {
					curr += 100;
					if (curr > 0)
						curr = 0;
				}
				ul.style.left = curr + '%';
				var seeker = elem.querySelector('seeker');
				seeker.style.left = ~~(seeker.clientWidth * -curr / 100) + "px";
			}
		};
		// init seeker
		var ul = elem.querySelector('ul');
		if (ul.clientWidth > 9000) {
			ul.style.width = ul.children.length * (ul.children[0].clientWidth + 12) + "px";
		}
		elem.querySelector('seeker').style.width = ul.parentNode.clientWidth / ul.scrollWidth * 100 + '%';
		ctx.display(ul.querySelector('img'));
		return ctx;
	});

}(smart_ui, document);