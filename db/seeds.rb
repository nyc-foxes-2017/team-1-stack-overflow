User.create! [

  {:username => 'michael', :email =>'michael@email.com', :password_digest => 'password'},
  {:username => 'peter', :email =>'peter@email.com', :password_digest => 'password'},
  {:username => 'thomas', :email =>'thomas@email.com', :password_digest => 'password'},
  {:username => 'sophia', :email =>'sophia@email.com', :password_digest => 'password'}

]

Question.create! [
  {:question_content => 'how do i do something in ruby?', :user_id => 1},
  {:question_content => 'how do i make my website pretty?', :user_id => 2},
  {:question_content => 'how do i do something in javascript?', :user_id => 3},
  {:question_content => 'how do i activerecord?', :user_id => 4}
]

Answer.create! [
  {:answer_content => 'use ruby and bla bla bla bla', question_id: 1, :user_id => 2, best_answer: false},
  {:answer_content => 'ruby sucks use something else', question_id: 1, :user_id => 3, best_answer: true},
  {:answer_content => 'use css to make our website pretty', question_id: 2, :user_id => 4, best_answer: false},
  {:answer_content => 'javascript it this is an answer i dont know what to say', question_id: 3, :user_id => 1, best_answer: false},
]

Comment.create! [
  {:comment_content => 'this is a good question about ruby', :user_id => 2, :commentable_type => 'question', :commentable_id => 1},
  {:comment_content => 'this is a good answer about ruby', :user_id => 2, :commentable_type => 'comment', :commentable_id => 1},
  {:comment_content => 'this is a good question about website', :user_id => 1, :commentable_type => 'question', :commentable_id => 2}
]

Vote.create! [
 {:up_down => 100, :votable_type => 'question', :votable_id => 1},
 {:up_down => 200, :votable_type => 'question', :votable_id => 2},
 {:up_down => 300, :votable_type => 'question', :votable_id => 3},
 {:up_down => 400, :votable_type => 'question', :votable_id => 4},
 {:up_down => 100, :votable_type => 'answer', :votable_id => 1},
 {:up_down => 200, :votable_type => 'answer', :votable_id => 2},
 {:up_down => 300, :votable_type => 'answer', :votable_id => 3},
 {:up_down => 400, :votable_type => 'answer', :votable_id => 4},
 {:up_down => 1, :votable_type => 'comment', :votable_id => 1},
 {:up_down => 2, :votable_type => 'comment', :votable_id => 2},
 {:up_down => 3, :votable_type => 'comment', :votable_id => 3}
]





