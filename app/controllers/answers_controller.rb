#send user to answer-form
get '/questions/:id/answers/new' do
   @question = Question.find(params[:id])

  erb :"/answers/new"
end

#create answer
post '/questions/:id/answers' do
  @question = Question.find(params[:id])
  @answer = @question.answers.new(params[:answer])
  # @question.answers.find(params[:id])
  if request.xhr?
    erb :'answers/_new_answer', layout: false, locals:{
      answer: @answer }
  else
    if @answer.save
  			redirect "/questions/#{@question.id}"
  		else
        erb :"/answers/show"
      end
    end
end

#editing specific answer
get '/questions/:question_id/answers/:id/edit' do
  @question = Question.find(params[:id])
  @answer = Answer.find(params[:id])

  erb :"/answers/edit"
end

#submitting edited form
put '/questions/:question_id/answers/:id' do
  @question = Question.find(params[:id])
  @answer = @question.answers.find(params[:id])

  if @answer.update_attributes(params[:answer])
  		redirect "/questions/#{@question.id}"
  else
      erb :"/answers/show"
  end
end
