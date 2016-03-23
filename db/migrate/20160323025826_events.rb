class Events < ActiveRecord::Migration
  def change
    create_table :events, force: true do |t|
      t.string   "description"
      t.string   "category"
      t.string   "address"
      t.string   "weather"
      t.string   "notes"
      t.string   "miles"
      t.string   "name"
      t.string   "link"
      t.datetime "start_time"
      t.datetime "end_time"
      t.integer  "updated_by"
      t.integer  "created_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
