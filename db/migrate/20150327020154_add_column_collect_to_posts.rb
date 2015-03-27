class AddColumnCollectToPosts < ActiveRecord::Migration
  def change
    add_column :posts,:collect,:string
  end
end
