get '/users/:id' do
  if !current_user
    flash[:error] = "You must be logged in or have an account."
  else
    @user = User.find(params[:id])
    @surveys_written = Survey.where(author_id: @user.id)

    @surveys_taken = @user.responses.map do |response|
      response.get_question
    end.uniq!
    erb :'/users/show'
  end
end
