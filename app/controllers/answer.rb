
get '/questions/:id/answers/new' do
  @question = Question.find_by(id: params[:id])
  erb :'/questions/show'
end

post '/questions/:id/answers' do
  @question = Question.find_by(id: params[:id])
  @answer = Answer.new(params[:answer])
  @answer.question_id = params[:id]
  @answer.user_id = session[:user]

  if request.xhr?
    if @answer.save
      status 200

      erb :'partials/_answer', layout: false, locals: {answer: @answer}
    else
      status 442
    end
  else
    if @answer.save
      redirect "/questions/#{params[:id]}"
    else
      @errors = @answer.errors.full_messages
      erb :'/questions/show'
    end
  end
end


get '/questions/:id/solved/:answer_id' do
  @question = Question.find_by(id: params[:id])
  answer = Answer.find_by(id: params[:answer_id])
  answer.best_answer = true
  answer.save
  erb :'/questions/show'
end
