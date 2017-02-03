$(document).ready(function() {
  $('#new_question_form').hide()
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  createNewQuestion();
  showForm();
});

var showForm = function(){
  $('#new_form_button').on('click', function(e){
    e.preventDefault();
    $('#new_question_form').show()
  })
}


var createNewQuestion = function(){
  $('#new_question').on('submit', function(e){
    e.preventDefault();
    $("#new_question_form").hide();
    var url = $(this).attr('action');
    var newQuestion = $('#new_question').serialize();
    $.ajax({
      url: '/questions',
      method: "POST",
      data: newQuestion
    }).done(function(response){
      $('#question_container').html(response);
    })
  });
}
