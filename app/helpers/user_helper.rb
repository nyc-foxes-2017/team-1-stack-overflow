def current_user?
 session[:user] == @question.user_id
end
