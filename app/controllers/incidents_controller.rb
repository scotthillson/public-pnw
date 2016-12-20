class IncidentsController < ApplicationController
  
  before_action :advanced_only, only: [:new, :edit, :update, :destroy]
  before_action :set_incident, only: [:show, :edit, :update, :destroy]
  
  def index
    @incidents = Incident.all.order(:incident_date).reverse
  end
  
  def show
  end
  
  def new
    @incident = Incident.new
  end
  
  def edit
  end
  
  def create
    @incident = Incident.new(incident_params)
    if @incident.save
      redirect_to @incident, notice: 'Incident was successfully created.'
    else
      render :new
    end
  end
  
  def update
    if @incident.update(incident_params)
      redirect_to @incident, notice: 'Incident was successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    @incident.destroy
    redirect_to incidents_url, notice: 'Incident was successfully destroyed.'
  end
  
  private
  
  def set_incident
    @incident = Incident.find(params[:id])
  end
  
  def incident_params
    params.require(:incident).permit(:title, :author, :body, :incident_date)
  end
  
end
