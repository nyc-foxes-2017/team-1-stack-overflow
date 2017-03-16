get '/login' do
  erb :'users/login'
end

post '/login' do
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    session[:user] = user.id
    redirect '/'
  else
    @error_message = "Login failed."
    erb :'users/login'
  end
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  user = User.new(username: params[:username], email: params[:email], password: params[:password])
  if user.save
    session[:user] = user.id
    redirect '/'
  else
    @error_messages = user.errors.full_messages
    erb :'users/new'
  end
end

get '/logout' do
  session[:user] = nil
  redirect '/login'
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  if @user
    @questions = @user.questions
    @answers = @user.comments
    @comments = @user.answers
    erb :'users/show'
  else
    erb :'404'
  end
end

# STRETCH

get '/users/:id/edit' do # maybe, or maybe just form somewhere else
end

put '/users/:id' do
end

delete '/users/:id' do
end
