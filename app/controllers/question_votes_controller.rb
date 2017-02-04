post '/question/:id/upvote' do
  @commentable_instance = Question.find(params[:id])

  if request.xhr?
    @vote = Vote.new(value: 1, votable_type: Question, votable_id: params[:id], user_id: current_user)
     @vote.save
     response = "#{vote_count(@commentable_instance)}"
  else
    redirect '/questions'
  end
end


post '/question/:id/downvote' do
  @commentable_instance = Question.find(params[:id])

  if user?
    @vote = Vote.new(value: -1, votable_type: Question, votable_id: params[:id], user_id: current_user)
     @vote.save
     response = "#{vote_count(@commentable_instance)}"
   else
   redirect '/questions'
  end
end
