class MessagesAndIncidentsAndStuff < ActiveRecord::Migration
  def change

    drop_table :forms

    create_table :incident_members, force: true do |t|
      t.string   :status
      t.integer  :incident_id
      t.integer  :member_id
      t.datetime :created_at
      t.datetime :updated_at
    end

    add_column :messages, :incident_id, :integer
    remove_column :incidents, :attendance, :integer
    remove_column :incidents, :attendance_percent, :integer
    remove_column :incidents, :distance, :integer
    add_column :incidents, :created_by, :integer
    add_column :incidents, :updated_by, :integer
    add_column :incidents, :utm, :string
    add_column :incidents, :alerted, :datetime
    add_column :incidents, :mobile, :datetime
    add_column :incidents, :at_base, :datetime
    add_column :incidents, :return_to_base, :datetime
    add_column :incidents, :leave_base, :datetime
    add_column :incidents, :home_at, :datetime

  end
end
