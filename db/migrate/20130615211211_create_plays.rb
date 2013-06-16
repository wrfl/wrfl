class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.integer :track_id
      t.integer :album_id
      t.integer :user_id
      t.timestamp :played_at

      t.timestamps
    end
  end
end
