class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :address
      t.string :phone_number
      t.string :password_hash

      t.timestamps null:false
    end
  end
end
