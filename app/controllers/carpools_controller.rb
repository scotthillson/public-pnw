class CarpoolsController < ApplicationController
  
  before_action :turn_back
  before_action :set_carpool, only: [:show, :edit, :update, :destroy, :reserve]
  
  def index
    departs = Carpool.arel_table[:depart]
    @carpools = Carpool.where(departs.lt(Time.now))
  end
  
  def manage_carpools
    @carpools = Carpool.all
  end
  
  def show
  end
  
  def new
    @carpool = Carpool.new
  end
  
  def create
    @carpool = Carpool.new(carpool_params)
    @carpool.created_by = user_session
    if @carpool.save
      redirect_to @carpool
    else
      render :new
    end
  end
  
  def reserve
    if @carpool.reserve(user_session)
      redirect_to @carpool, notice: 'You successfully reserved a seat!'
    else
      redirect_to @carpool, notice: 'No dice'
    end
  end
  
  def edit
  end
  
  def update
    if @carpool.update(carpool_params)
      redirect_to @carpool
    else
      render :edit
    end
  end
  
  def destroy
    if @carpool.created_by = user_session
      @carpool.destroy
    end
    redirect_to carpools_url
  end
  
  private
  
  def set_carpool
    @carpool = Carpool.find params[:id]
  end
  
  def carpool_params
    params.require(:carpool).permit(:address,:notes,:leave,:return,:seats)
  end
  
end
