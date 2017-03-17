get '/questions/:id/comments/new' do
  @question = Question.find_by(id: params[:id])

  erb :"/comments/new_on_question"
end

post '/questions/:id/comments' do
  @question = Question.find_by(id: params[:id])

  @comment = @question.comments.new(params[:comment])
  @comment.user_id = session[:user]
  if @comment.save
    redirect "/questions/#{@question.id}"
  else
    @errors = @comment.errors.full_messages
    erb :"/questions/show"
  end
end


get '/questions/:id/answers/:id/comments/new' do
  question = Question.find_by(id: params[:id])
  @answer = Answer.find_by(id: params[:id])

  erb :"/comments/new_on_answer"
end

post '/questions/:id/answers/:id/comments' do
  question = Question.find_by(id: params[:id])
  @answer = Answer.find_by(id: params[:id])
  @comment = @answer.comments.new(params[:comment])
  @comment.user_id = session[:user]

  if @comment.save
    redirect "/questions/#{question.id}"
  else
    @errors = @comment.errors.full_messages
    erb :"/questions/show"
  end
end

