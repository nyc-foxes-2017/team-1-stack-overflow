post '/questions/:question_id/vote' do
  vote = Vote.find_by(user_id: session[:user], votable_id: params[:question_id], votable_type: "Question")
  if !vote
    vote = Vote.new(up_down: params[:up_down].to_i, user_id: session[:user], votable_id: params[:question_id], votable_type: "Question")
    vote.save
  else
    vote.destroy
  end
  redirect "/questions/#{params[:question_id]}"
end

post '/answers/:answer_id/vote' do
  vote = Vote.find_by(user_id: session[:user], votable_id: params[:question_id], votable_type: "Answer")
  if !vote
    vote = Vote.new(up_down: params[:up_down].to_i, user_id: session[:user], votable_id: params[:answer_id], votable_type: "Answer")
    vote.save
  else
   vote.destroy
  end
  redirect "/questions/#{answer.question.id}"
end
