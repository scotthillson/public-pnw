class RentalsController < ApplicationController
  
  before_action :turn_back
  before_action :set_rental, only: [:show, :edit, :update, :destroy, :claim]
  
  def index
    @rentals = Rental.all
  end
  
  def show
  end
  
  def new
    @rentals = Rental.new
  end
  
  def create
    @rental = Rental.new(rental_params)
    if @rental.save
      redirect_to @rental
    else
      render :new
    end
  end
  
  def claim
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
    @rental.destroy
    redirect_to rentals_url
  end
  
  private
  
  def set_rental
    @rental = Rental.find params[:id]
  end
  
  def rental_params
    params.require(:rental).permit(:name,:notes,:event,:claimed_by)
  end
  
end
