var dup_file_check = function(){
  file = $(this).val().split(/(\\|\/)/g).pop();
  json_ajax({file:file},'get','/dup_form_check',dup_form_success,'');
}
var dup_form_success = function(data,objects){
  console.log(data);
  if(data==true){
    $('#choose-file').css('background-color','red');
  }
}
