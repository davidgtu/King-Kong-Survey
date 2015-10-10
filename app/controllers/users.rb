
get '/users/:id' do
  @user = User.find(params[:id])
  @surveys_written = Survey.where(author_id: @user.id)
  @surveys_taken = @user.surveys
  erb :'/users/show'
end

