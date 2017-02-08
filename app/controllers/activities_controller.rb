class ActivitiesController < ApplicationController
  
  before_action :advanced_only
  
  def index
    respond_to do |format|
      format.html do
        render component: 'Activities'
      end
      format.json do
        #Activity.get_activities
        year = Date.today.year - 1
        render json: Activity.where("start_on > ?","#{year}-01-01").order(:start_on)
      end
    end
  end
  
  private
  
  def set_activity
  end
  
end
