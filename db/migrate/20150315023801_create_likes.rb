class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.boolean :like
      t.integer :user_id
      t.references :likeable,polymorphic: true
      t.timestamps
    end
  end
end
