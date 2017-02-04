post '/answer/:id/upvote' do
  @commentable_instance = Answer.find(params[:id])

  if request.xhr?
    @vote = Vote.new(value: 1, votable_type: Answer, votable_id: params[:id], user_id: current_user)
     @vote.save
     response = "#{vote_count(@commentable_instance)}"
  else
    redirect '/answers'
  end
end


post '/answer/:id/downvote' do
  @commentable_instance = Answer.find(params[:id])

  if user?
  @vote = Vote.new(value: -1, votable_type: Answer, votable_id: params[:id], user_id: current_user)
   if vote_user_include(@commentable_instance == false)
     @vote.save
     response = "#{vote_count(@commentable_instance)}"
   end
   redirect '/answers'
  else
    redirect '/answers'
  end
end
