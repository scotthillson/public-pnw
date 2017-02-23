class SearchesController < ApplicationController
  
  def index
    @searches = Event.incidents.order(:start_on).reverse
  end
  
end
