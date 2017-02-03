get '/questions' do
  @questions = Question.all
  @questions = @questions.sort_by{|question| question.votes.length}.reverse
  erb :'questions/index'
end

get '/questions/new' do
  erb :'questions/new'
end

post '/questions' do
  @question = Question.new(params[:question])
  @user = User.find_by(params[:username])
  if @question.save
    redirect '/questions'
  else
    erb :'questions/new'
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
  @votes = Vote.all.each {|vote| vote.votable_id == @question.id}
  @votes.each {|vote| vote.destroy}
  @question.destroy

  redirect '/questions'
end
