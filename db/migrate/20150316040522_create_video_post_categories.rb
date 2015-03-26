class CreateVideoPostCategories < ActiveRecord::Migration
  def change
    create_table :video_post_categories do |t|
      t.integer :category_id
      t.integer :video_post_id
      t.timestamps
    end
  end
end
