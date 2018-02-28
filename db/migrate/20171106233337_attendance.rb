class Attendance < ActiveRecord::Migration
  def change
    create_table :attendances, force: true do |t|
      t.string   "status"
      t.string   "status"
      t.string   "role"
      t.integer  "duration"
      t.integer  "d4h_id"
      t.integer  "activity_id"
      t.integer  "member_id"
      t.datetime "start_on"
      t.datetime "end_on"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
