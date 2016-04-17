class Createimages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :content
      t.references :post
      t.references :user

      t.timestamps null: false
    end
  end
end
