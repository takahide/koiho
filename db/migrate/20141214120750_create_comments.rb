class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :video_id
      t.text :text

      t.timestamps
    end
  end
end
