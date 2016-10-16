class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.string :description
      t.integer :minplayers
      t.integer :maxplayers
      t.integer :minage
      t.integer :yearpublished
    end
  end
end
