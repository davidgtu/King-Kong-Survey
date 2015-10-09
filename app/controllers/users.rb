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

get '/login' do
  @user = User.new
  erb :'/users/login'
end

post '/login' do
  user_params = params[:user]
  user = User.find_by(username: user_params[:username])
  if user && user.password == user_params[:password]
    session[:user_id] = user.id
    #flash login success
    redirect '/'
  else
    #flash login error
    redirect '/login'
  end
end
