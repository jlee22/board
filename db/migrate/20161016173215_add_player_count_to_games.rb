class AddPlayerCountToGames < ActiveRecord::Migration
  def change
    add_column :games, :player_count, :integer, default: 1
  end
end
