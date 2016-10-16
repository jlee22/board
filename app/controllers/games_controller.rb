get '/games/:id/new' do
  @user = User.find(params[:id])
  erb :'games/new'
end

post '/games' do
  @game_name =  params[:name]
  mod_game_name = @game_name.gsub(" ", "%20")
  game1 = HTTParty.get("http://www.boardgamegeek.com/xmlapi/search?search=#{mod_game_name}&exact=1")
  game_array1 = game1.first
  game_id = game_array1.last["boardgame"].first["objectid"]
  game2 = HTTParty.get("http://boardgamegeek.com/xmlapi2/thing?id=#{game_id}")



  @minage = game2.first[1]["item"]["minage"]["value"]
  @year_published = game2.first[1]["item"]["yearpublished"]["value"]
  @minplayers = game2.first[1]["item"]["minplayers"]["value"]
  @maxplayers = game2.first[1]["item"]["maxplayers"]["value"]
  @game_description = game2.first[1]["item"]["description"].gsub("(from the back of the box:)","").gsub("&#10;","").gsub("&quot;","")

  erb :index
end

# Dominion id: 36218
