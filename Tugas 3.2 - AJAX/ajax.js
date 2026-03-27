$(document).ready(function(){
  $("#shoutbutton").click(function() {
    $.ajax({
      type: "GET",
      url: "reply.php",
      data: $("#form1").serialize(),
      success: function(rsp) {
        $("#data").append(`<div>${rsp}</div>`);
      },
      error: function(rsp) {
        alert(rsp);
      }
    });
  });
});