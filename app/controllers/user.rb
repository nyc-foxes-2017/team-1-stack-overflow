get '/login' do
  erb :'users/login'
end

post '/login' do
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    session[:user] = user.id
    p session[:user]
    redirect '/'
  else
    @errors = ["Login failed."]
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
    @errors = user.errors.full_messages
    erb :'users/new'
  end
end

get '/logout' do
  session[:user] = nil
  p session[:user]
  redirect '/login'
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  if @user
    @questions = @user.questions
    @answers = @user.answers
    erb :'users/show'
  else
    redirect '/404'
  end
end

# STRETCH

get '/users/:id/edit' do # maybe, or maybe just form somewhere else
end

put '/users/:id' do
end

delete '/users/:id' do
end
