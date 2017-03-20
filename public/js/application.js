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

// SHOW QUESTION COMMENT FORM
  $('.question-comment').on('click', '#show-question-comment-form', function(event){
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

  // ADD COMMENT TO QUESTION

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
        $('p.question-comment:nth-last-child(2)').after(response);
        $('#question-comment-container').empty();
        $('form#answers').show();
      }).fail(function(error){
        if (error){
          alert("You must write a comment first.")
        }
      });

  });
//SHOW ANSWER COMMENT FORM

  $('.answer-comment').on('click', '#show-answer-comment-form', function(event){
    $('form#answers').hide();
    event.preventDefault();
    var url = $(this).attr('href');
    $.ajax({
      url:url,
      method:'get'
    }).done(function(response){
      $('#answer-comment-container').append(response);
    });
  });

  // ADD COMMENT TO ANSWER

  $('#answer-comment-container').on('submit', '#comment-on-answer',function(event){

    event.preventDefault();
    var url = $(this).attr('action'),
        method = $(this).attr('method'),
        data = $(this).serialize();
      $.ajax({
        url: url,
        method: method,
        data: data
      }).done(function(response){
        $('p.answer-comment:nth-last-child(2)').after(response);
        $('#answer-comment-container').empty();
        $('form#answers').show();
      }).fail(function(error){
        if (error){
          alert("You must write a comment first.")
        }
      });
  });


});

