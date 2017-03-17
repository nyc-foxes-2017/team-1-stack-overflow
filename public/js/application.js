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

  //upvote & downvote

  $('.question-properties .upvote, .question-properties .downvote').submit(function() {
    event.preventDefault();
    var params = $(this).serializeArray().reduce(function(params, pair) {
      params[pair.name] = pair.value;
      return params;
    }, {});
    $.ajax({
      url: $(this).attr('action'),
      type: 'POST',
      data: params
    }).done(function(data) {
      $('.question-properties #score').text(data);
    });
  });

  $('.answer-container').on('submit', '.upvote, .downvote', (function() {
    event.preventDefault();
    var params = $(this).serializeArray().reduce(function(params, pair) {
      params[pair.name] = pair.value;
      return params;
    }, {});
    var thisAnswer = $(this).closest('.answer-properties')
    $.ajax({
      url: $(this).attr('action'),
      type: 'POST',
      data: params
    }).done(function(data) {
      thisAnswer.find('#score').text(data)
    });
  }));

});

