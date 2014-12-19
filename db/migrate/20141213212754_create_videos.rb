class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :youtube_id
      t.integer :like
      t.integer :dislike

      t.timestamps
    end
  end
end
