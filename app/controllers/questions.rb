get "/questions/:id" do |id|
  @question = Question.find(id)
  erb :"questions/show"
end

get "/surveys/:survey_id/questions/new" do
  @survey = Survey.find(params[:survey_id])
  @question = @survey.questions.new
  erb :"questions/new"
end

post "/surveys/:survey_id/questions" do
  @survey = Survey.find(params[:survey_id])
  @question = @survey.questions.new(params[:question])
    if @question.save
      redirect "/"
    else
      @question.valid?
      @errors = @question.errors.full_messages
      erb :"questions/new"
    end
end
