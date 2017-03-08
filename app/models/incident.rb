# An incident is strictly a pnwsar.org admin-facing resource used for callouts.

class Incident < ActiveRecord::Base

  has_many :members, through: :incident_members

  def add_member(member_id)
    if id
      if Member.find(member_id)
        IncidentMember.find_or_create_by(incident_id: id, member_id: member_id)
      end
    end
  end

  def add_members(members)
    members.each do |member|
      add_member(member.id)
    end
  end

  def remove_member(member_id)
    if member_id
      incident_member = IncidentMember.find_by(incident_id: id, member_id: member_id)
      incident_member.destroy if incident_member
    end
  end

end
