var json_ajax = function(params,type,url,callback,objects){
  $.ajax({
    type: type,
    dataType: 'json',
    data: params,
    url: url,
    success: function(data){
      if ( data ){
        if ( data.message ){
          info_notice(data.message);
        }
        if ( data.error ){
          bad_notice(data.error);
        } else{
          callback(data,objects);
        }
      } else {
        callback(data,objects);
      }
    },
    error: function(jqXHR, textStatus, errorThrown){
      if ( errorThrown.length ){
        bad_notice(errorThrown);
      } else {
        bad_notice(textStatus);
      }
    }
  });
}

var bad_notice = function(string){
  console.log(string);
}
