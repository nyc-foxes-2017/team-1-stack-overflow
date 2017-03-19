User.destroy_all
Question.destroy_all
Answer.destroy_all
Comment.destroy_all
Vote.destroy_all


User.create! [

  {:username => 'michael', :email =>'michael@email.com', :password =>'password'},
  {:username => 'peter', :email =>'peter@email.com', :password => 'password'},
  {:username => 'thomas', :email =>'thomas@email.com', :password => 'password'},
  {:username => 'sophia', :email =>'sophia@email.com', :password => 'password'}

]

Question.create! [
  {:views => 0, :title => 'n00b ruby question l0l', :question_content => 'how do i do something in ruby?', :user_id => 1},
  {:views => 0, :title =>  'noob css question', :question_content => 'how do i make my website pretty?', :user_id => 2},
  {:views => 0, :title => 'javascript is hard', :question_content => 'how do i do something in javascript?', :user_id => 3},
  {:views => 0, :title => 'i want to make a database', :question_content => 'how do i activerecord?', :user_id => 4}
]

Answer.create! [
  {:answer_content => 'use ruby and bla bla bla bla', question_id: 1, :user_id => 2, :best_answer => false},
  {:answer_content => 'ruby sucks use something else', question_id: 1, :user_id => 3, :best_answer => true},
  {:answer_content => 'use css to make our website pretty', question_id: 2, :user_id => 4, :best_answer => false},
  {:answer_content => 'javascript it this is an answer i dont know what to say', question_id: 3, :user_id => 1, :best_answer => false},
]

Comment.create! [
  {:comment_content => 'this is a good question about ruby', :user_id => 2, :commentable_type => 'Question', :commentable_id => 1},
  {:comment_content => 'this is a good answer about ruby', :user_id => 2, :commentable_type => 'Answer', :commentable_id => 1},
  {:comment_content => 'this is a good question about website', :user_id => 1, :commentable_type => 'Question', :commentable_id => 2}
]

Vote.create! [
 {:up_down => 100, :votable_type => 'Question', :votable_id => 1, :user_id => 1},
 {:up_down => 200, :votable_type => 'Question', :votable_id => 2, :user_id => 1},
 {:up_down => 300, :votable_type => 'Question', :votable_id => 3, :user_id => 1},
 {:up_down => 400, :votable_type => 'Question', :votable_id => 4, :user_id => 1},
 {:up_down => 100, :votable_type => 'Answer', :votable_id => 1, :user_id => 1},
 {:up_down => 200, :votable_type => 'Answer', :votable_id => 2, :user_id => 1},
 {:up_down => 300, :votable_type => 'Answer', :votable_id => 3, :user_id => 1},
 {:up_down => 400, :votable_type => 'Answer', :votable_id => 4, :user_id => 1},
 {:up_down => 1, :votable_type => 'Comment', :votable_id => 1, :user_id => 1},
 {:up_down => 2, :votable_type => 'Comment', :votable_id => 2, :user_id => 1},
 {:up_down => 3, :votable_type => 'Comment', :votable_id => 3, :user_id => 1}
]





