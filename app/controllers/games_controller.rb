put '/games/:id' do
  "*" * 90
  game = Game.find(params[:id])
  game.update(player_count: params[:player_count])
  redirect "/games/#{params[:id]}"
end

get '/games/:id/new' do
  @user = User.find(params[:id])
  if request.xhr?
    erb :'games/new', layout: false
  else
    erb :'games/new'
  end
end

get '/games/:id' do
  @game = Game.find(params[:id])
  @host = User.find(@game.user_id)
  erb :'games/show'
end

post '/games' do
  @game_name =  params[:name]
  @user_id = current_user.id
  @user_name = current_user.username
  @host = User.find(@user_id)
  mod_game_name = @game_name.gsub(" ", "%20")
  game1 = HTTParty.get("http://www.boardgamegeek.com/xmlapi/search?search=#{mod_game_name}")

  game_array1 = game1.first
    # p game_array1
  game_search = game_array1.last["boardgame"]
  if game_search == nil
    erb :'/games/new_custom'
  else
    game_id = game_search.first["objectid"]
    game2 = HTTParty.get("http://boardgamegeek.com/xmlapi2/thing?id=#{game_id}")
    @minage = game2.first[1]["item"]["minage"]["value"]
    @year_published = game2.first[1]["item"]["yearpublished"]["value"]
    @minplayers = game2.first[1]["item"]["minplayers"]["value"]
    @maxplayers = game2.first[1]["item"]["maxplayers"]["value"]
    @game_description = game2.first[1]["item"]["description"].gsub("(from the back of the box:)","").gsub("&#10;","").gsub("&quot;","")
    @game = Game.new(name: @game_name, description: @game_description, minplayers: @minplayers, maxplayers: @maxplayers, yearpublished: @yearpublished, user_id: @user_id, host_name: @user_name)
    @games = Game.all
    if @game.save
      erb :index
    end
  end
end

post '/custom' do
  @game = Game.new(params[:game])
  @games = Game.all
  @host = User.find(@game.user_id)
  if @game.save
    erb :index
  end
end


delete '/games/:id' do
  game = Game.find(params[:id])
  game.destroy
  redirect '/'
end


# Dominion id: 36218

