class SponsorsAndCarpools < ActiveRecord::Migration
  def change
    create_table :sponsors, force: true do |t|
      t.string   "name"
      t.string   "link"
      t.string   "image"
      t.integer  "created_by"
      t.datetime "created_at"
    end
    create_table :carpools, force: true do |t|
      t.string   "event"
      t.string   "address"
      t.string   "notes"
      t.datetime "depart"
      t.datetime "return"
      t.integer  "seats_offered"
      t.integer  "created_by"
      t.datetime "updated_at"
      t.datetime "created_at"
    end
    create_table :seats, force: true do |t|
      t.integer  "carpool_id"
      t.integer  "created_by"
      t.datetime "updated_at"
      t.datetime "created_at"
    end
    create_table :rentals, force: true do |t|
      t.date     "event_date"
      t.string   "description"
      t.string   "event"
      t.string   "notes"
      t.integer  "claimed_by"
      t.integer  "created_by"
      t.datetime "updated_at"
      t.datetime "created_at"
    end
    create_table :equipment, force: true do |t|
      t.string   "category"
      t.string   "description"
      t.string   "expiration"
      t.string   "importance"
      t.string   "notes"
      t.string   "status"
      t.integer  "quantity"
      t.integer  "created_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
