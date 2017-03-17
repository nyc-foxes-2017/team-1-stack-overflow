post '/questions/:question_id/vote' do
  require_user
  question = Question.find_by(id: params[:question_id])
  vote = question.votes.find_by(user_id: session[:user])
  if !vote
    vote = question.votes.new(up_down: params[:up_down].to_i, user_id: session[:user])
    vote.save
  else
    vote.destroy
  end
  if request.xhr?
    question.score.to_s
  else
    redirect "/questions/#{params[:question_id]}"
  end
end

post '/answers/:answer_id/vote' do
  require_user
  answer = Answer.find_by(id: params[:answer_id])
  vote = answer.votes.find_by(user_id: session[:user])
  if !vote
    vote = answer.votes.new(up_down: params[:up_down].to_i, user_id: session[:user])
    vote.save
  else
   vote.destroy
  end
  redirect "/questions/#{answer.question.id}"
end
