class CreateNightScriptures < ActiveRecord::Migration
  def change
    create_table :night_scriptures do |t|
      t.integer :night_id
      t.integer :scripture_id

      t.timestamps
    end
    add_index :night_scriptures, [:night_id, :scripture_id], unique: true
  end
end
