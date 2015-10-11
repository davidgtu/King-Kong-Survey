get '/register' do
  @user = User.new
  erb :'/users/new'
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    flash[:success] = "Account Created!"
    redirect '/'
  else
    flash[:error] = "Could not create account."
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
    flash[:success] = "Logged in as #{user.username}. Welcome!"
    redirect '/'
  else
    flash[:error] = "Mismatched username/password."
    redirect '/login'
  end
end

get '/logout' do
  session.clear
  flash[:success] = "Logged out of King Kong. :("
  redirect '/'
end
