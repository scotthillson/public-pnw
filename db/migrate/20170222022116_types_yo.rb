class TypesYo < ActiveRecord::Migration
  def change
    rename_column :activities, :type, :activity_type
    rename_column :events, :type, :event_type
  end
end
