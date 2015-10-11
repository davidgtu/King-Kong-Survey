get "/surveys/:survey_id/questions/new" do
  if !current_user
    flash[:error] = "You must log in to create a new survey."
    redirect "/"
  else
    @survey = Survey.find(params[:survey_id])
    question = @survey.questions.new
    erb :"questions/new"
  end
end

get "/surveys/:survey_id/questions" do |survey_id|
  if !logged_in?
    flash[:error] = "You must be logged in to play."
    redirect '/'
  else
    @survey = Survey.find(survey_id)
    @question = @survey.questions
    erb :"questions/show"
  end
end

post "/surveys/:survey_id/questions" do
  @survey = Survey.find(params[:survey_id])
  question = @survey.questions.new(params[:question])
  choices = question.choices.new(params[:choice1])
  choices = question.choices.new(params[:choice2])
  choices = question.choices.new(params[:choice3])

    if question.save
      if request.xhr?
        erb :"questions/_new_question_finish", layout: false
      else
        flash[:success] = "Questions created!"
        redirect "/surveys/#{@survey.id}/questions/new"
      end
    else
      question.valid?
      @errors = question.errors.full_messages
      erb :"questions/new"
    end
end
