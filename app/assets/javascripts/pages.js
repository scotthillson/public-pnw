var load_last_page = function(){
  var name = $(this).val();
  json_ajax({name:name},'get','/last_version',last_page_success,'');
}

var last_page_success = function(data,objects){
  if(data==null){
    $('#page_body').html('');
  } else {
    $('#page_body').html(data.body);
  }
  $('#page_body').height($('#page_body')[0].scrollHeight);
  preview();
}

var preview = function(){
  var body = $('#page_body').val();
  $('#body-preview').html(body);
}
