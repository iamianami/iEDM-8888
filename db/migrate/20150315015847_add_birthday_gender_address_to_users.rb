class AddBirthdayGenderAddressToUsers < ActiveRecord::Migration
  def change
    add_column :users, :birthday, :string
    add_column :users, :gender , :string
    add_column :users, :address, :string
  end
end
