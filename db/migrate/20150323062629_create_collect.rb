class CreateCollect < ActiveRecord::Migration
  def change
    create_table :collects do |t|
      t.integer :user_id,:post_id
      t.timestamps
    end
  end
end
