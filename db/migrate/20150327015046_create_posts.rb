class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :url
      t.text :description
      t.integer :user_id
      t.timestamps
      t.string :slug
    end
  end
end
