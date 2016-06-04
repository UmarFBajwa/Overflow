$(document).ready(function() {

// Obtain new answer form
$("#add_answer_button").on("click", function(event){
  event.preventDefault();

  var urlPost = $(this).attr("href")
  var response = $.ajax( {
    url: urlPost,
    method: "GET",
  })
  response.done(function(form) {
    $('#form-div').html(form);
    $('#add_answer_button').hide();
  })

})

// Submit  new answer form
$("#form-div").on("submit", "#new-answer-form", function(event){
  event.preventDefault();
  var link = $(this).attr('action');
  var answerData = $(this).serialize();
  console.log(answerData);

  var request = $.ajax({
    url: link,
    method: "post",
    data: answerData
  })
  request.done(function(answer){
    $('#answers-container').append(answer);
    $('#add_answer_button').show();
    $('#form-div').empty();
  })
})







});

