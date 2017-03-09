class IncidentMembersController < ApplicationController

  before_action :advanced_only

  def update_member
    incident_member = IncidentMember.update_member(params)
    render json: incident_member, status: :ok
  end

  private

  def incident_member_params
    params.permit(
      :member_id,
      :incident_id,
      :role,
      :status
    )
  end

end
