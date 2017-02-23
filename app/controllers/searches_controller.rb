class SearchesController < ApplicationController
  
  def index
    @searches = Event.incidents.order(:start_on).reverse
  end
  
  def show
    @search = Event.find(params[:id])
  end
  
end
