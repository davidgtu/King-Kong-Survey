
get '/users/:id' do
  @user = User.find_by(id: params[:id])
  @survey = Survey.find_by(author_id: @user.id)
  erb :'/users/show'
end

