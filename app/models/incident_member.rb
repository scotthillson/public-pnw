class IncidentMember < ActiveRecord::Base

  has_many :incidents
  has_many :members

  def self.update_member(incident_id, member_id, role=null, status=null)
    if incident_id && member_id
      incident_member = find_by(incident_id: incident_id, member_id: member_id)
      if incident_member
        incident_member.update_member(role, status)
      end
    end
  end

  def update_member(new_role=null, new_status=null)
    if new_role
      role = new_role
    end
    if new_status
      status = new_status
    end
    save
  end

end
