class SponsorsController < ApplicationController
  
  def index
    @sponsors = Sponsor.all
  end
  
  def new
    @sponsor = Sponsor.new
  end
  
  def create
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
end
