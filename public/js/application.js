$(document).ready(function() {
  hideForms();
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  showNewQuestionForm();
  showNewAnswerForm();
  createNewQuestion();
  createNewAnswer();
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
}

var showNewAnswerForm = function(){
  $('#new_answer_button').on('submit', function(e){
    e.preventDefault();
    $('#new_answer_form').show()
    $('#new_answer_button').hide()
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
  });
}

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
    $('#new_answer_form').children( ':first').val('')

    $('#new_answer_button').show();
    $('#new_answer_form').hide();

  })
}
