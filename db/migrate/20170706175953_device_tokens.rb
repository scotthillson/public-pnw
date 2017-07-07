class DeviceTokens < ActiveRecord::Migration
  def change
    create_table :device_tokens, force: true do |t|
      t.string   "token"
      t.string   "code"
      t.string   "mobile_phone"
      t.integer  "expiry"
      t.integer  "user_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.datetime "verified_at"
    end
  end
end
