var ready = function(){
	$('.container').popover();
	$('.popover-dismiss').popover({trigger: 'focus'});
	$('.houser').popover({ title:'hrrm', content:'drrrrrrrr', html:true});
	$('.container').on('click','.houser',function(){$(this).popover('toggle');});
	console.log('all clear boss');
};
$(document).on('page:load',ready);