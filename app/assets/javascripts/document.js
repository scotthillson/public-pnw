var ready = function(){
  $('.container').popover();
  $('.popover-dismiss').popover({trigger: 'focus'});
  $('.houser').popover({ title:'hrrm', content:'drrrrrrrr', html:true});
  $('.container').on('click','.houser',function(){$(this).popover('toggle');});
  $(document).on('click','.paypal-button',function(){$('#paypal-form').submit();});
  $(document).on('click','.logo',function(){window.location.href='/';});
  $(document).on('click','.close',function(){$(this).parent().hide();});
};
$(document).on('page:load',ready);
$(document).ready(ready);
