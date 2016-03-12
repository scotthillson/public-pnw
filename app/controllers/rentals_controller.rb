class RentalsController < ApplicationController
  
  before_action :turn_back
  before_action :set_rental, only: [:show, :edit, :update, :destroy, :reserve]
  
  def index
    @rentals = Rental.all
  end
  
  def show
  end
  
  def new
    @rental = Rental.new
  end
  
  def create
    @rental = Rental.new(rental_params)
    @rental.created_by = user_session
    if @rental.save
      redirect_to rentals_path
    else
      render :new
    end
  end
  
  def reserve
    if @rental.reserve(user_session)
      redirect_to rentals_path, notice: 'You successfully claimed this item, congrats!'
    else
      redirect_to rentals_path, notice: 'No dice muchacho'
    end
  end
  
  def edit
  end
  
  def update
    if @rental.update(rental_params)
      redirect_to @rental
    else
      render :edit
    end
  end
  
  def destroy
    if @rental.created_by = user_session
      @rental.destroy
    end
    redirect_to rentals_url
  end
  
  private
  
  def set_rental
    @rental = Rental.find params[:id]
  end
  
  def rental_params
    params.require(:rental).permit(:event,:event_date,:description,:notes)
  end
  
end
