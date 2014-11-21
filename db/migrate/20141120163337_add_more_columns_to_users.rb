class AddMoreColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile_image_url, :string
    add_column :users, :name, :string
    add_column :users, :location, :string
    add_column :users, :description, :string
    add_column :users, :friends_count, :string
    add_column :users, :followers_count, :string
  end
end
