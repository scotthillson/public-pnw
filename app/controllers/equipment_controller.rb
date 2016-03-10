class EquipmentController < ApplicationController
  
  before_action :turn_back
  before_action :set_equipment, only: [:show, :edit, :update, :destroy]
  
  def index
    @equipment = Equipment.all
  end
  
  def show
  end
  
  def new
    @equipment = Equipment.new
  end
  
  def create
    @equipment = Equipment.new(equipment_params)
    if @equipment.save
      redirect_to @equipment
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @equipment.update(equipment_params)
      redirect_to @equipment
    else
      render :edit
    end
  end
  
  def destroy
    @equipment.destroy
    redirect_to equipment_url
  end
  
  private
  
  def set_equipment
    @equipment = Equipment.find params[:id]
  end
  
  def equipment_params
    params.require(:equipment).permit(:description)
  end
  
end
