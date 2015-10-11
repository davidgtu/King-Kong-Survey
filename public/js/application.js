$(document).ready(function() {


  $(".flash-success").fadeIn('slow', function(){
    $(this).delay(2000).fadeOut('slow')
  })

  $(".flash-error").fadeIn('slow', function(){
    $(this).delay(2000).fadeOut('slow')
  })

  $("#new-survey").on("submit", createSurvey);

  $("#questions").on("submit", ".new-question", addQustionForm);

});


function createSurvey(event) {

    event.preventDefault();
    var url = $(this).attr("action");
    var type = $(this).attr("method");
    var data = $(this).serialize();
    $.ajax({
      url: url,
      type: type,
      data: data
    })
    .done(function(result) {
      $("#questions").append(result);
    })
    .fail();

}

function addQustionForm(event) {
    event.preventDefault();
    var url = $(this).attr("action");
    var type = $(this).attr("method");
    var data = $(this).serialize();
    $.ajax({
      url: url,
      type: type,
      data: data
    })
  .done(function(result) {
    $(".new-question").remove();
    $("#questions").append(result);
  })
  .fail();
}

