$(document).ready(function() {

//

$("#add_answer_button").on("click", function(event){
  event.preventDefault();

var urlPost = $(this).attr("href")
var response = $.ajax( {
  url: urlPost,
  method: "GET",
})

  response.done(function(data) {
    $('#add_answer_button').append(data);

})

})

});

