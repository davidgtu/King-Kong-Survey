get "/questions/:id" do |id|
  @question = Question.find(id)
  erb :"questions/show"
end

get "/survey/:survey_id/questions/new" do
  @user = User.find(session[:user_id])
  @survey = @user.surveys.find(params[:survey_id])
  @question = @survey.questions.new
  erb :"questions/new"
end

post "/questions" do
  @question = Question.new(params[:question])
    if @question.save
      redirect "/"
    else
      @question.valid?
      @errors = @question.errors.full_messages
      erb :"questions/new"
    end
end
