class ActivitiesController < ApplicationController
  
  before_action :advanced_only
  
  def update_activities
    if params[:year]
      year = params[:year]
    else
      year = Date.today.year
    end
    Activity.get_activities
    activities = Activity.where("start_on > ?","#{year}-01-01").order(:start_on)
    render json: activities, include: :event
  end
  
  def index
    if params[:year]
      year = params[:year]
    else
      year = Date.today.year
    end
    respond_to do |format|
      format.html
      format.json do
        activities = Activity.where("start_on > ?","#{year}-01-01").order(:start_on)
        render json: activities, include: :event
      end
    end
  end
  
  private
  
  def set_activity
  end
  
end
