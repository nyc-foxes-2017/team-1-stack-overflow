
get '/questions/:id/answers/new' do
  @question = Question.find_by(id: params[:id])
  erb :'/questions/show'
end

post '/questions/:id/answers' do
  require_user
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


get '/questions/:id/solved/:answer_id' do
  @question = Question.find_by(id: params[:id])
  require_matching_user(@question.user_id)
  answer = Answer.find_by(id: params[:answer_id])
  answer.best_answer = true
  answer.save
  erb :'/questions/show'
end
