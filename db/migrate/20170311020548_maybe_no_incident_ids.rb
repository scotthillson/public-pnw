class MaybeNoIncidentIds < ActiveRecord::Migration
  def change
    remove_column :messages, :incident_id, :integer
    remove_column :groups, :custom, :boolean
    add_column :groups, :equipment_note, :string
  end
end
