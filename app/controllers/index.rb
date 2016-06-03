get '/' do
  questions = Question.all
  @questions_h = questions.map {|q| {question_id: q.id, title: q.title, votes: q.votes.count, answers: q.answers.count, date:q.created_at}}
  erb :index
end
