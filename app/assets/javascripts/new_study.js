$(document).ready(function(){
  $("#snp-location-1").on('blur', verifyLocation);
});

function verifyLocation(){
  var location = $("#snp-location-1").val();
  $.ajax({
    url: "http://genomematchmaker.herokuapp.com/api/v1/verify_location/" + location,
    method: "GET",
    dataType: "json",
    success: function(validity){
      if(validity.validity == "true"){
        $("#result").removeClass("glyphicon-remove");
        $("#result").addClass("glyphicon-ok");
      }
      else{
        $("#result").removeClass("glyphicon-ok").addClass("glyphicon-remove");
      }
    }
  })
}
