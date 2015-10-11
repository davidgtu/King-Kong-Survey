get '/surveys/:id/responses' do
  @user = User.find(session[:user_id])
  # @survey = @user.surveys.find(params[:id])
  erb :'/responses/show'
end
