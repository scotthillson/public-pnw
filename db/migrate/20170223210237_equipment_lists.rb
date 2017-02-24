class EquipmentLists < ActiveRecord::Migration
  def change
    create_table :equipment_categories, force: true do |t|
      t.string   :category_name
      t.string   :display_name
      t.string   :team_id
      t.integer  :created_by
      t.datetime :updated_at
      t.datetime :created_at
    end
    create_table :teams, force: true do |t|
      t.string   :team_name
      t.integer  :group_id
      t.integer  :created_by
      t.datetime :updated_at
      t.datetime :created_at
    end
    remove_column :equipment, :category, :string
    add_column :equipment, :name, :string
    add_column :equipment, :examples, :string
    add_column :equipment, :equipment_category_id, :integer
    add_column :equipment, :team_gear, :integer
  end
end
