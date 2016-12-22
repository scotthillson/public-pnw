class AddActivities < ActiveRecord::Migration
  def change
    create_table "activities", force: :cascade do |t|
      t.integer  "d4h_id"
      t.string   "reference"
      t.text     "description"
      t.string   "lat"
      t.string   "lng"
      t.integer  "attendance_percent"
      t.integer  "attendance"
      t.integer  "distance"
      t.datetime "end_on"
      t.datetime "start_on"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
    
    add_column :searches, :incident_id, :integer
    add_column :searches, :reference, :string
  end
end
