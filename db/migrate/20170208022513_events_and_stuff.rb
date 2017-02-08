class EventsAndStuff < ActiveRecord::Migration
  def change
    create_table :d4hs, force: true do |t|
      t.datetime :last_activity_sync
      t.datetime :last_group_sync
      t.datetime :last_member_sync
      t.datetime :last_incident_sync
      t.datetime :last_search_sync
      t.datetime :updated_at
      t.datetime :created_at
    end
    add_column :events, :d4h_id, :integer
    record = D4h.new
    record.last_activity_sync = DateTime.now
    record.last_group_sync = DateTime.now
    record.last_member_sync = DateTime.now
    record.last_incident_sync = DateTime.now
    record.last_search_sync = DateTime.now
    record.save
  end
end
