class SponsorsController < ApplicationController
  
  before_action :advanced_only, only: [:new, :edit, :update, :destroy]
  before_action :set_sponsor, only: [:show, :edit, :update, :destroy]
  
  def index
    @sponsors = Sponsor.all
  end
  
  def new
    @sponsor = Sponsor.new
    @images = Dir.entries('public/logos')
  end
  
  def create
    @sponsor = Sponsor.new(sponsor_params)
    @sponsor.created_at = current_user
    @sponsor.image = "logos/#{@sponsor.image}"
    if @sponsor.save
      redirect_to sponsors_url
    else
      render :new
    end
  end
  
  def edit
    @images = Dir.entries('public/logos') - ['.'] - ['..']
  end
  
  def update
    if @sponsor.update(sponsor_params)
      @sponsor.image = "logos/#{@sponsor.image}"
      @sponsor.save
      redirect_to sponsors_url
    else
      render :edit
    end
  end
  
  def destroy
    @sponsor.destroy
    redirect_to sponsors_url
  end
  
  private
  
  def set_sponsor
    @sponsor = Sponsor.find(params[:id])
  end
  
  def sponsor_params
    params.require(:sponsor).permit(:name, :sponsor_url, :image)
  end
  
end
