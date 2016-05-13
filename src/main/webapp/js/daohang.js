!function ($) {
	$(document).on("click","ul.nav li.parent > a > span.icon", function(){		  
			$(this).find('em:first').toggleClass("glyphicon-plus");
			var ul=$(this).parent().parent().children('ul');
			if(($(this).find('em:first')).hasClass("glyphicon-plus")){
				ul.hide();
			}else{
				ul.show();
				
			}
			}); 

	}(window.jQuery);

$(window).on('resize', function () {
	if ($(window).width() > 768) $('#sidebar-collapse').collapse('show');
});
$(window).on('resize', function () {
	if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide');
});
