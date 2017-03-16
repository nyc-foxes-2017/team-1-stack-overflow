get '/questions' do
# List out the questions
  @questions = Question.all
  erb :'questions/index'
  
end

get '/questions/ask' do
# Shows a form for a new question
  erb :'questions/new'
end

post '/questions/ask' do
# Save the question into database, otherwise show page with
  @question = Question.new(params[:question])
  @question.user_id = session[:user_id]
  if @question.save
    redirect "/questions/#{@question.id}"
  else
    @errors = @question.errors.full_messages
    erb :'questions/new'
  end
end

get '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  if @question
    @answers = @question.answers
    @question_comments = @question.comments
    @answer_comments = @answers.map { |answer| answer.comments }
    erb :'questions/show'
  else
    erb :'404'
  end
end

# Stretch Challenges

get '/questions/:id/edit' do
  @question = Question.find_by(id: params[:id])
  erb :'questions/edit'
end

put '/questions/:id/edit' do
  question = Question.find_by(id: params[:id])
  question = update_attributes(params[:question])
  redirect "/questions/#{@question.id}"
end

delete '/questions/:id/delete' do
  question = Question.find_by(id: params[:id])
  question.destroy
  redirect '/questions'
end
