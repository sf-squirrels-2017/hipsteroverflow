get '/questions' do
  @questions = Question.all
  @questions = @questions.sort_by{|question| vote_count(question)}.reverse
  erb :'questions/index'
end

get '/questions/new' do
  erb :'questions/new'
end

post '/questions' do
  @questions = Question.all
  @question = Question.create(params[:question])
  @user = User.find_by(params[:username])
  if request.xhr?
    erb :'questions/_questions', layout: false, locals: { questions: @questions }
  else
    if @question.save
      redirect '/questions'
    else
      erb :'questions/new'
    end
  end

end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  erb :'questions/show'
end

get '/questions/:id/edit' do
  @question = Question.find(params[:id])

  erb :'questions/edit'
end

put '/questions/:id' do
  @question = Question.find(params[:id])
  @question.assign_attributes(params[:question])
  if @question.save
    redirect '/questions'
  else
    erb :'questions/edit'
  end
end

delete '/questions/:id' do
  @question = Question.find(params[:id])
  @votes = @question.votes
  @votes.each do |vote|
    vote.destroy
  end
  @question.destroy

  redirect '/questions'
end
