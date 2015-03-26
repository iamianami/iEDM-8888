class CreateVideoComments < ActiveRecord::Migration
  def change
    create_table :video_comments do |t|
      t.text :body
      t.integer :rating
      t.integer :video_post_id,:user_id
      t.timestamps
    end
  end
end
