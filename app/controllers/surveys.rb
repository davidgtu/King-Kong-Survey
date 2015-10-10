get "/surveys" do
  @surveys = Survey.all
  erb :"surveys/index"
end


get "/surveys/new" do
  @survey = Survey.new #--> placeholder for form
  erb :"surveys/new"
end

get "/surveys/:survey_id" do
  @survey = Survey.find(params[:survey_id])
  @question = @survey.questions.find(params[:id])
  erb :"surveys/show"
end

post "/surveys" do
  @survey = Survey.new(params[:survey])
  @survey.author_id = current_user.id

  if @survey.save!
    redirect "/surveys/#{@survey.id}/questions/new"
  else
    @survey.valid? #--> need to call this to get messages for some reason
    @errors = @survey.errors.full_messages
  end
end
