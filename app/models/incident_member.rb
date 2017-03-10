class IncidentMember < ActiveRecord::Base

  belongs_to :member

  def self.update_member(params)
    if params[:incident_id] && params[:member_id]
      incident_member = find_by(incident_id: params[:incident_id], member_id: params[:member_id])
      if incident_member
        incident_member.update_member(params)
      end
    end
  end

  def update_member(params)
    puts params[:status]
    if params[:role]
      self.role = params[:role]
    end
    if params[:status]
      self.status = params[:status]
    end
    save
  end

end
