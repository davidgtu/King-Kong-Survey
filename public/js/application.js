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
    var type = $(this).attr("method");
    var data = $(this).serialize();
    debugger;
    $.ajax({
      url: url,
      type: type,
      data: data
    })
    .done(function(data) {
      $("#survey").append(data);
      debugger;
    })
    .fail();
  } );

});
