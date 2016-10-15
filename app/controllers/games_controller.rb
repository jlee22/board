get '/games/:id/new' do
  @user = User.find(params[:id])
  erb :'games/new'
end

post '/games' do

end
