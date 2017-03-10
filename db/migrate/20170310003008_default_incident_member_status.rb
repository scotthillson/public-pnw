class DefaultIncidentMemberStatus < ActiveRecord::Migration
  def change
    change_column_default :incident_members, :status, 'unknown'
  end
end
