class EquipmentLog < ActiveRecord::Migration
  def change
    create_table :equipment_logs, force: true do |t|
      t.string   "note"
      t.string   "status"
      t.boolean  "used"
      t.integer  "minutes"
      t.integer  "equipment_id"
      t.integer  "user_id"
      t.integer  "created_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
    add_column :equipment, :purchased_at, :datetime
    add_column :equipment, :manufactured_at, :datetime
    add_column :equipment, :supplier, :string
    add_column :equipment, :value, :decimal
    add_column :equipment, :identifier, :string
    add_column :equipment, :marks, :string
  end
end
