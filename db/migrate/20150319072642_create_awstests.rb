class CreateAwstests < ActiveRecord::Migration
  def change
    create_table :awstests do |t|
      t.string :name
      t.text :bio
      t.date :birthday

      t.timestamps null: false
    end
  end
end
