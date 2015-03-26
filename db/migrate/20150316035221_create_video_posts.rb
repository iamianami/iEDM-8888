class CreateVideoPosts < ActiveRecord::Migration
  def change
    create_table :video_posts do |t|
      t.integer :user_id
      t.string :title
      t.string :url
      t.text :description
      t.timestamps
    end
  end
end
