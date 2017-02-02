get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    login(@user)
    redirect "users/#{@user.username}"
  else
    erb :'users/new'
  end
end

get '/users/:username' do
  erb :'users/profile'
end
