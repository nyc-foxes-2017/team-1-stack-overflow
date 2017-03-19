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
      var i = $('#answer_number').html();
      var i = parseInt(i)
      i += 1
      var i = i.toString();
      $('#answer_number').html(i);
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
    var thisAnswer = $(this).closest('.answer-properties');
    $.ajax({
      url: $(this).attr('action'),
      type: 'POST',
      data: params
    }).done(function(data) {
      thisAnswer.find('#score').text(data);
      thisAnswer.find('#score').css('border', '1px solid red');
    });
  }));

  $('.question-comments').on('click', '#show-question-comment-form', function(event){
    $('form#answers').hide();
    event.preventDefault();
    var url = $(this).attr('href');
    $.ajax({
      url:url,
      method:'get'
    }).done(function(response){
      $('#question-comment-container').append(response);
    });
  });

  $('#question-comment-container').on('submit', '#comment-on-question',function(event){

    event.preventDefault();
    var url = $(this).attr('action'),
        method = $(this).attr('method'),
        data = $(this).serialize();
      $.ajax({
        url: url,
        method: method,
        data: data
      }).done(function(response){
        $('.question-comments:nth-last-child(2)').append(response);
        $('#question-comment-container').empty();
      }).fail(error){
        // error handling
      }

  })



});

