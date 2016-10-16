get '/games/:id/new' do
  @user = User.find(params[:id])
  erb :'games/new'
end

get '/games/:id' do
  @game = Game.find(params[:id])
  @host = User.find(@game.user_id)
  erb :'games/show'
end

post '/games' do
  @game_name =  params[:name]
  @user_id = current_user.id
  @host = User.find(@user_id)
  mod_game_name = @game_name.gsub(" ", "%20")
  game1 = HTTParty.get("http://www.boardgamegeek.com/xmlapi/search?search=#{mod_game_name}&exact=1")

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
    @game = Game.new(name: @game_name, description: @game_description, minplayers: @minplayers, maxplayers: @maxplayers, yearpublished: @yearpublished, user_id: @user_id)
    @games = Game.all
    if @game.save
      erb :index
    end
  end
end

post '/custom' do
  @game = Game.new(params[:game])
  @games = Game.all
  if @game.save
    erb :index
  end
end

# Dominion id: 36218
