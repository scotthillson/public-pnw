class IncidentsController < ApplicationController
  
  before_action :advanced_only
  before_action :set_incident, only: [:show, :edit, :update, :destroy]
  
  def index
    render json: Incident.all, status: :ok
  end
  
  def show
    render json: @incident, status: :ok
  end
  
  def create
    @incident = Incident.new(incident_params)
    if @incident.save
      render json: @incident, status: :ok
    else
      render json: @incident, status: :unprocessable_entity
    end
  end
  
  def update
    if @incident.update(incident_params)
      render json: @incident, status: :ok
    else
      render json: @incident, status: :unprocessable_entity
    end
  end
  
  def destroy
    @incident.destroy
  end
  
  private
  
  def set_incident
    @incident = Incident.find(params[:id])
  end
  
  def incident_params
    params.require(:incident).permit(:title, :author, :body, :incident_date)
  end
  
end
