class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users] do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :username, null: false
      t.string :email, null: false, unique: true , index: true
      t.string :password_digest, null: false 
      t.text :bio 
      t.timestamps null: false
    end
  end
end
