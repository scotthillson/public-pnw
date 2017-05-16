class Locations < ActiveRecord::Migration
  def change
    create_table "locations", force: :cascade do |t|
      t.integer  "user_id"
      t.integer  "horizon_accuracy"
      t.integer  "vert_accuracy"
      t.datetime "reported_at"
      t.datetime "created_at"
      t.string   "altitude"
      t.string   "course"
      t.string   "speed"
      t.string   "lat"
      t.string   "lng"
    end
  end
end
