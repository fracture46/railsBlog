class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :titre
      t.date :date_publication
      t.string :image
      t.string :chapeau
      t.string :corps
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
