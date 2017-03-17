get '/questions' do
# List out the questions
  @questions = Question.all
  erb :'questions/index'

end

get '/questions/new' do
# Shows a form for a new question
  redirect '/404' if !signed_in?
  erb :'questions/new'
end


post '/questions/new' do
  require_user
# Save the question into database, otherwise show page with
  @question = Question.new(params[:question])
  @question.views = 0
  @question.user_id = session[:user]
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
    @question.views += 1
    @question.save
    erb :'questions/show'
  else
    erb :'404'
  end
end

# Stretch Challenges

get '/questions/:id/edit' do
  redirect '/404' if !current_user
  @question = Question.find_by(id: params[:id])
  require_matching_user(@question.user_id)
  erb :'questions/edit'
end

put '/questions/:id/edit' do
  redirect '/404' if !current_user
  question = Question.find_by(id: params[:id])
  require_matching_user(question.user_id)
  question.update_attributes(params[:question])
  redirect "/questions/#{question.id}"
end

delete '/questions/:id/delete' do
  redirect '/404' if !current_user
  question = Question.find_by(id: params[:id])
  require_matching_user(question.user_id)
  question.transaction do
    question.answers.map { |answer| answer.comments.destroy_all }
    question.answers.map { |answer| answer.votes.destroy_all }
    question.answers.destroy_all
    question.comments.destroy_all
    question.votes.destroy_all
    question.destroy
  end
  redirect '/'
end
