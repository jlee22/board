get '/sessions/new' do
  erb :'sessions/new'
end


post '/sessions' do
  @user = User.find_by_email(params[:email])

  if @user && @user.password == params[:password]
    # session[:id] = @user.id
    login(@user)
    redirect '/'

  else
    @errors = "Username && Password not found. Try registering for a new account"
    erb :'sessions/new'
  end
end



# delete '/sessions/:id' do
delete '/sessions' do
  # session[:id] = nil
  logout
  redirect '/'
end
