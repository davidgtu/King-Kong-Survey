$(document).ready(function() {

  $(".flash-success").fadeIn('slow', function(){
    $(this).delay(2000).fadeOut('slow')
  })

  $(".flash-error").fadeIn('slow', function(){
    $(this).delay(2000).fadeOut('slow')
  })

  var surveyForm = $("#new-survey");
  surveyForm.on("submit", function(event) {
    event.preventDefault();
    var url = $(this).attr("action");
    var data = $(this).serialize;
    var type = $(this).attr("method");
    $.ajax({
      url: url,
      data: data,
      type: type
    })
    .done(function(data) {
      debugger;
    })
    .fail();
  } );

});
