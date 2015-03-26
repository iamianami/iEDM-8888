class AddVideoPostIdToComments < ActiveRecord::Migration
  def change
    add_column :comments,:video_post_id,:integer
  end
end
