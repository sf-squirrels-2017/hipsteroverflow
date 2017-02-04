helpers do
  def login(user)
    session[:user_id] = user.id
  end

 def logout
    session.clear
  end

 def current_user
    if session[:user_id]
      User.find(session[:user_id])
    else
      nil
    end
  end

  def user?
    if current_user != nil
       true
    else
      false
    end
  end

end
