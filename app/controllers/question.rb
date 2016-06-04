get '/questions' do
  questions = Question.all
  @questions_h = questions.map {|q| {question_id: q.id, title: q.title, votes: q.votes.count, answers: q.answers.count, date:q.created_at}}
  erb :'questions/index'
end

get '/questions/new' do
  erb :'questions/new'
end

post '/questions' do
  @question = Question.new(title: params[:title], body: params[:body], user_id: session[:user_id])

  if @question.save
    redirect '/questions'
  else
    erb :'questions/new'
  end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.answers.map {|a| {id: a.id, user_id: a.user_id, votes: a.votes.count, body: a.body, date:a.created_at}}
  erb :'questions/show'
end

get '/questions/:id/edit' do
  @question = Question.find(params[:id])
  erb :'questions/edit'
end

put '/questions/:id' do
  #get params from url
  @question = Question.find(params[:id])
  @question.assign_attributes(params[:question])
  if @question.save
    redirect '/questions'
  else
    erb :'questions/edit' #show edit question view again(potentially displaying errors)
  end
end

delete '/questions/:id' do
  #get params from url
  @question = Question.find(params[:id]) #define question to delete
  @question.destroy #delete question
  redirect '/questions' #redirect back to questions index page
end

# get '/questions/:question_id/answers' do
#   @question = Question.find(params[:question_id])
#   @answers = @question.answers
#   erb :'answers/index'
# end

get '/questions/:question_id/answers/new' do
  @question = Question.find(params[:question_id])
  if request.xhr?
  erb :'answers/new', layout: false
  else
  erb :'answers/new'
  end
end

post '/questions/:question_id/answers' do
  if request.xhr?
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(params[:answer])
    if @answer.save
      erb :"answers/new_answer", layout: false
    else
      erb :'answers/new'
    end
  else
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(params[:answer])
    if @answer.save
      redirect "/questions/#{@question.id}"
    else
      erb :'answers/new'
    end
  end
end

# get '/questions/:question_id/answers/:id' do
#   @question = Question.find(params[:question_id])
#   @answer = @question.answers.find(params[:id])
#   erb :'answers/show'
# end

get '/questions/:question_id/answers/:id/edit' do
  @question = Question.find(params[:question_id])
  @answer = @question.answers.find(params[:id])
  erb :'answers/edit'
end

put '/questions/:question_id/answers/:id' do
  @question = Question.find(params[:question_id])
  @answer = @question.answers.find(params[:id])
  if @answer.update_attributes(params[:answer])
    redirect "/questions/#{@question.id}/answers"
  else
    erb :'answers/edit' #show edit answers view again(potentially displaying errors)
  end
end

delete '/questions/:question_id/answers/:id' do
  @question = Question.find(params[:question_id])
  @answer = Answer.find(params[:id])
  @answer.destroy
  redirect "/questions/#{@question.id}"
end
