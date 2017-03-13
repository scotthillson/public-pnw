class EquipmentController < ApplicationController

  before_action :turn_back, only: [:create, :update, :destroy]
  before_action :set_equipment, only: [:update, :destroy]

  def show
  end

  def index
    respond_to do |format|
      format.html { @advanced = advanced? }
      format.json do
        render json: {
          equipment: Equipment.all,
          categories: EquipmentCategory.all,
          teams: Group.all,
          session: session[:equipment]
        }, status: :ok
      end
    end
  end

  def session_equipment
    session[:equipment] = params[:equipment]
    render json: session[:equipment], status: :ok
  end

  def create
    equipment = Equipment.new(equipment_params)
    equipment.name = equipment.name.downcase
    equipment.created_by = current_user
    if equipment.save
      render json: { success: true }, status: :ok
    end
  end

  def update
    if @equipment.update(equipment_params)
      render json: { success: true }, status: :ok
    end
  end

  def destroy
    @equipment.destroy
    render json: { success: true }, status: :ok
  end

  private

  def set_equipment
    @equipment = Equipment.find params[:id]
  end

  def equipment_params
    params.permit(
      :description,
      :examples,
      :equipment_category_id,
      :expiration,
      :importance,
      :name,
      :notes,
      :quantity,
      :status,
      :team_gear
    )
  end

end
