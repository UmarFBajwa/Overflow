get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

get '/questions/new' do
  erb :'questions/new'
end

post '/questions' do
  @question = Question.new(params[:question])
  if @question.save
    redirect '/questions'
  else
    erb :'questions/new'
  end
end

get '/questions/:id/' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end

get '/questions/:id/edit' do
  @question = Question.find(params[:id])
  erb :'questions/edit'
end

put '/questions/:id' do
  #get params from url
  @question = Question.find(params[:id]) #define variable to edit
  @question.assign_attributes(params[:question]) #assign new attributes
  if @question.save #saves new question or returns false if unsuccessful
    redirect '/questions' #redirect back to questions index page
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

get '/questions/:question_id/answers' do
  @question = Question.find(params[:question_id])
  @answers = @question.answers
  erb :'answers/index'
end

get '/questions/:question_id/answers/new' do
  @question = Question.find(params[:question_id])
  erb :'answers/new'
end

post '/questions/:question_id/answers' do
  @question = Question.find(params[:question_id])
  @answer = @question.answers.new(params[:answer])
  if @answer.save
    redirect "/questions/#{@question.id}/answers"
  else
    erb :'answers/new' #show new answers view again(potentially displaying errors)
  end
end

get '/questions/:question_id/answers/:id' do
  @question = Question.find(params[:question_id])
  @answer = @question.answers.find(params[:id])
  erb :'answers/show'
end

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
  @answer = @question.answers.find(params[:id])
  @answer.destroy
  redirect "/questions/#{@question.id}/answers"
end
