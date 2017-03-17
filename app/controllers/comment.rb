get '/questions/:id/comments/new' do
  @question = Question.find_by(id: params[:id])

  erb :"/comments/new"
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
