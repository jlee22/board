class CreateGamesUsers < ActiveRecord::Migration
  def change
    create_table :games_users, :id => false do |t|
      t.integer :game_id
      t.integer :user_id

      t.timestamps null:false
    end
  end
end
