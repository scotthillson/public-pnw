class IncidentsController < ApplicationController

  before_action :advanced_only

  def index
    render json: Incident.all, status: :ok
  end

  def active
    render json: Incident.active, include: [:incident_members, :messages], status: :ok
  end

  def callout
  end

  def show
    incident = Incident.find params[:id]
    render json: incident, include: [:incident_members, :messages], status: :ok
  end

  def add_members
    incident = Incident.find params[:id]
    if incident.add_members(params[:member_ids])
      render json: incident, include: [:incident_members, :messages], status: :ok
    else
      render json: incident, status: :unprocessable_entity
    end
  end

  def remove_member
    incident = Incident.find params[:id]
    if incident.remove_member(params[:member_id])
      render json: incident, include: [:incident_members, :messages], status: :ok
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
      render json: incident, include: [:incident_members, :messages], status: :ok
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
