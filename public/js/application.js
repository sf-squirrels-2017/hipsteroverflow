$(document).ready(function() {
  hideForms();
  showNewQuestionForm();
  showNewAnswerForm();
  createNewQuestion();
  createNewAnswer();
  increaseVoteCount();
  decreaseVoteCount();

});


var hideForms= function(){
  $('#new_question_form').hide()
  $('#new_answer_form').hide()

}
var showNewQuestionForm = function(){
  $('#new_form_button').on('click', function(e){
    e.preventDefault();
    $('#new_question_form').show()
  })
};

var showNewAnswerForm = function(){
  $('#new_answer_button').on('submit', function(e){
    e.preventDefault();
    $('#new_answer_form').show()
  });
};

var createNewQuestion = function(){
  $('#new_question').on('submit', function(e){
    e.preventDefault();
    $("#new_question_form").hide();
    var url = $(this).attr('action');
    var newQuestion = $('#new_question').serialize();
    $.ajax({
      url: url,
      method: "POST",
      data: newQuestion
    }).done(function(response){
      $('#question_container').html(response);
    })
  })
};

var createNewAnswer = function(){
  $('#new_answer_form').on('submit', function(e){
    e.preventDefault();
    $('#new_answer_button').hide();
    var url= $(this).attr('action');
    var newAnswer = $('#new_answer_form').serialize();
    $.ajax({
      url: url,
      method: "POST",
      data: newAnswer
    }).done(function(response){
      $('#answer_container').append(response);
    })
  })
};


var increaseVoteCount = function() {
  $('.upvote-button').on("submit", function(e){
    e.preventDefault();

    var button = $(this);
    var url = $(this).attr('action');
    var method = $(this).attr('method');

    $.ajax({
      url: url,
      method: method
    }).done(function(response){
      button.siblings(".votes-count").html(response);
    })
  })
};

var decreaseVoteCount = function() {
  $('.downvote-button').on("submit", function(e){
    e.preventDefault();

    var button = $(this);
    var url = $(this).attr('action')
    var method = $(this).attr('method')

    $.ajax({
      url: url,
      method: method,
    }).done(function(response){
      button.siblings(".votes-count").html(response);
    })
  })
};
