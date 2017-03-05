class IncidentsController < ApplicationController

  before_action :advanced_only

  def index
    render json: Incident.all, status: :ok
  end

  def callout
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
      render json: incident, status: :ok
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
      :attendance,
      :distance,
      :end_on,
      :start_on
    )
  end

end
