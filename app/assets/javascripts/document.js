var load_twitter = function(d,s,id){
  var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';
  if(!d.getElementById(id)){
    js=d.createElement(s);
    js.id=id;
    js.src=p+"://platform.twitter.com/widgets.js";
    fjs.parentNode.insertBefore(js,fjs);
  }
}
var ready = function(){
  $('.container').popover();
  $('.popover-dismiss').popover({trigger: 'focus'});
  $('.houser').popover({ title:'hrrm', content:'drrrrrrrr', html:true});
  $('.container').on('click','.houser',function(){$(this).popover('toggle');});
  $(document).on('click','.paypal-button',function(){$('#paypal-form').submit();});
  $(document).on('click','.logo',function(){window.location.href='/';});
  $(document).on('click','.close',function(){$(this).parent().hide();});  
  load_twitter(document,"script","twitter-wjs");
  //console.log('all clear boss');
};
$(document).on('page:load',ready);
$(document).ready(ready);
