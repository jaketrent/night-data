class CreateNightSongs < ActiveRecord::Migration
  def change
    create_table :night_songs do |t|
      t.integer :night_id
      t.integer :song_id

      t.timestamps
    end

    add_index :night_songs, [:night_id, :song_id], unique: true
  end
end

