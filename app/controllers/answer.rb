
get '/questions/:id/answers/new' do
  @question = Question.find_by(id: params[:id])
  erb :'/questions/show'
end
post '/questions/:id/answers' do
  @question = Question.find_by(id: params[:id])
  @answer = Answer.new(params[:answer])
  @answer.question_id = params[:id]
  @answer.user_id = session[:user]
  if @answer.save
    redirect "/questions/#{params[:id]}"
  else
    @errors = @answer.errors.full_messages
    erb :'/questions/show'
  end
end
