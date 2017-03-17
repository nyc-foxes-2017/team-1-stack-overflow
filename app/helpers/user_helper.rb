def current_user?
 session[:user] == @question.user_id
end


def current_user
  @user ||= User.find_by(id: session[:user])
end

def require_user
  redirect back if !current_user
end
