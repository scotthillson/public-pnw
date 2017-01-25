class CarpoolsController < ApplicationController
  
  before_action :turn_back
  before_action :set_carpool, only: [:show, :edit, :update, :destroy, :reserve]
  
  def index
    @carpools = Carpool.where('event_date >= ?', Date.today)
  end
  
  def manage_carpools
    @carpools = Carpool.all
  end
  
  def show
  end
  
  def new
    @carpool = Carpool.new
    @carpool.event_date = Date.today
  end
  
  def create
    @carpool = Carpool.new(carpool_params)
    @carpool.created_by = current_user
    if @carpool.save
      redirect_to carpools_url
    else
      render :new
    end
  end
  
  def reserve
    if @carpool.reserve(current_user)
      redirect_to carpools_url, notice: 'You successfully reserved a seat!'
    else
      redirect_to carpools_url, notice: 'No dice'
    end
  end
  
  def edit
  end
  
  def update
    if @carpool.update(carpool_params)
      redirect_to carpools_url
    else
      render :edit
    end
  end
  
  def destroy
    if @carpool.created_by = current_user
      @carpool.destroy
    end
    redirect_to carpools_url
  end
  
  private
  
  def set_carpool
    @carpool = Carpool.find params[:id]
  end
  
  def carpool_params
    params.require(:carpool).permit(:event,:event_date,:address,:notes,:depart,:return,:seats_offered)
  end
  
end
