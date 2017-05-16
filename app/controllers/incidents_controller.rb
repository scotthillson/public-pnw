class IncidentsController < ApplicationController

  before_action :advanced_only

  def index
    respond_to do |format|
      format.html do
        render layout: "incidents"
      end
      format.json do
        render json: Incident.all
      end
    end
  end

  def active
    render json: Incident.all, include: :incident_members, status: :ok
  end

  def show
    incident = Incident.find params[:id]
    render json: incident, include: :incident_members, status: :ok
  end

  def add_members
    incident = Incident.find params[:id]
    if incident.add_members(params[:member_ids])
      render json: incident, include: :incident_members, status: :ok
    else
      render json: incident, status: :unprocessable_entity
    end
  end

  def remove_member
    incident = Incident.find params[:id]
    if incident.remove_member(params[:member_id])
      render json: incident, include: :incident_members, status: :ok
    else
      render json: incident, status: :unprocessable_entity
    end
  end

  def create
    incident = Incident.new(incident_params)
    if incident.save
      render json: incident, status: :ok
    else
      render json: incident, status: :unprocessable_entity
    end
  end

  def update
    incident = Incident.find(params[:id])
    if incident.update(incident_params)
      render json: incident, include: :incident_members, status: :ok
    else
      render json: incident, status: :unprocessable_entity
    end
  end

  private

  def incident_params
    params.permit(
      :d4h_id,
      :reference,
      :description,
      :lat,
      :lng,
      :utm,
      :end_on,
      :start_on,
      :alerted,
      :home
    )
  end

end
