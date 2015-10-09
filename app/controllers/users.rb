get '/register' do
  @user = User.new
  erb :'/users/new'
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    #flash message for success
    redirect '/'
  else
    #flash message for error
    redirect '/'
  end
end
