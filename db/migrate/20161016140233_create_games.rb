class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string  :name
      t.string  :description
      t.integer :minplayers
      t.integer :maxplayers
      t.integer :minage
      t.integer :yearpublished
      t.integer :host_id

      t.timestamps null: false
    end
  end
end
