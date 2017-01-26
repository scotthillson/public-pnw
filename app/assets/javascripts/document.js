var ready = function(){
  $(document).on('click','.paypal-button',function(){$('#paypal-form').submit();});
  $(document).on('click','.logo',function(){window.location.href='/';});
  $(document).on('click','.close',function(){$(this).parent().hide();});
  $(document).on('change','#choose-file',dup_file_check);
  $(document).on('change','#page_name',load_last_page);
  $(document).on('change','#page_body',preview);
  $(document).on('keyup','#page_body',preview);
};

$(document).on('page:load',ready);
$(document).ready(ready);

String.prototype.snake_case = function(){
  return this.replace(/([A-Z])/g, function($1){return "_"+$1.toLowerCase();});
}
