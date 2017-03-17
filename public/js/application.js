$(document).ready(function() {
  $("#new_answer").on("submit", "#answers", function(event){
    event.preventDefault();
    url = $(this).attr('action');
    data = $(this).serialize();
    $.ajax({
      url: url,
      method: 'post',
      data: data
    }).done(function(response){
      $('.answer-container').append(response);
      $('#answers').trigger("reset");
    })
  })
  // submit answer ends
  $(".answer-container").on('submit', '#solved-button', function(e) {
    e.preventDefault(e)
    url= $(this).attr('action')
    $.ajax({
      url: url,
      method: 'post'
    }).done(function(response){
      $('#checkmark').append(response)
      $("#solved-button").hide()
    })

  })

  $( function() {
    $("#tabs").tabs()
  })
});

