class AddBacknumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :koiho_name, :string
    add_column :users, :back_number, :string
  end
end
