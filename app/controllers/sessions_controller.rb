get '/login' do
  @user = User.new
  erb :'sessions/new'
end

post '/login' do
  @user = User.find_by(username: params[:user][:username])
  if @user.authenticate(params[:user][:password])
    login(@user)
    redirect "/users/#{@user.username}"
  else
    erb :'sessions/new'
  end
end

delete '/logout' do
  logout
  redirect '/'
end
