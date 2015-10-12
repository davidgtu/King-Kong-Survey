get "/surveys" do
  @surveys = Survey.all
  erb :"surveys/index"
end


get "/surveys/new" do
  @survey = Survey.new #--> placeholder for form
  erb :"surveys/new"
end

get "/surveys/:id" do
  if !current_user
    flash[:error] = "You must be logged in to take a survey."
    redirect "/"
  else
    @survey = Survey.find(params[:id])
    erb :"surveys/show"
  end
end

post "/surveys" do
  @survey = Survey.new(params[:survey])
  @survey.author_id = current_user.id
  if @survey.valid?
      @survey.save
      if request.xhr?
        erb :"questions/_new_question", layout: false
      else
        redirect "/surveys/#{@survey.id}/questions/new"
      end
  else
    if request.xhr?
      redirect "/406"
    else
      @errors = @survey.errors.full_messages
      @errors.each do |error|
          flash[:error] = "#{error}"
      end
      erb :"surveys/new"
    end
  end
end

post "/surveys/:id/responses" do
  survey = Survey.find(params[:id])
  user = session[:user_id]
  params[:response].each do |key, value|
    response = Response.create(choice_id: value, user_id: user)
  end
  flash[:success] = "Thank you for your responses!"
  redirect "/"
end
