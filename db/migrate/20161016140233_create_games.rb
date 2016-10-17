class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string  :name
      t.string  :description
      t.integer :minplayers
      t.integer :maxplayers
      t.integer :minage
      t.integer :yearpublished
      t.integer :user_id
      t.string  :host_name
      t.integer :player_count
    end
  end
end

# user = User.first
# game = Game.new(blah)
# user.games
# > []
# user.games << game
# user.games
# > [game]

# game.user_id = user.id
