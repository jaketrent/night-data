class CreateNightActivities < ActiveRecord::Migration
  def change
    create_table :night_activities do |t|
      t.integer :night_id
      t.integer :activity_id

      t.timestamps
    end
    add_index :night_activities, [:night_id, :activity_id], unique: true
  end
end
