class ActivitiesController < ApplicationController
  
  before_action :advanced_only
  
  def update_activities
    Activity.get_activities
    year = Date.today.year - 1
    activities = Activity.where("start_on > ?","#{year}-01-01").order(:start_on)
    render json: activities, include: :event
  end
  
  def index
    respond_to do |format|
      format.html
      format.json do
        year = Date.today.year
        activities = Activity.where("start_on > ?","#{year}-01-01").order(:start_on)
        render json: activities, include: :event
      end
    end
  end
  
  private
  
  def set_activity
  end
  
end
