// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better 
// to create separate JavaScript files as needed.
//
//= require jquery
//= require_tree .
//= require_self

if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
}
if (typeof jQuery !== 'undefined') {
	$(function() {
		if (!$('.buttons').length) {
			$('.footerFill').show();
		}

		$('nav > ul > li > span').click(function(e) {
			var seleccionar = $(this).hasClass('selectedMenu');
			if ($('nav > ul > li > span').hasClass('selectedMenu')) {
				$('nav > ul > li > span').removeClass('selectedMenu');
				$('nav > div').hide();
			} 
			if (!seleccionar) {
				$(this).addClass('selectedMenu');
				var idSubMenu = '#' + $(this).attr("name");
				$(idSubMenu).slideToggle();
			}
		});
	});
}
