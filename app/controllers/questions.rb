get "/surveys/:survey_id/questions/new" do
  @survey = Survey.find(params[:survey_id])
  question = @survey.questions.new
  erb :"questions/new"
end

get "/surveys/:survey_id/questions" do |survey_id|
  @survey = Survey.find(survey_id)
  @question = @survey.questions
  erb :"questions/show"
end

post "/surveys/:survey_id/questions" do
  @survey = Survey.find(params[:survey_id])
  question = @survey.questions.new(params[:question])
  choices = question.choices.new(params[:choice1])
  choices = question.choices.new(params[:choice2])
  choices = question.choices.new(params[:choice3])

    if question.save
      redirect "/surveys/#{@survey.id}/questions/new"
    else
      question.valid?
      @errors = question.errors.full_messages
      erb :"questions/new"
    end
end
