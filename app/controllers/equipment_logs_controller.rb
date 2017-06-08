class EquipmentLogsController < ApplicationController

  before_action :turn_back, only: [:create, :update, :destroy]

  def create
    equipment_log = EquipmentLog.new(equipment_log_params)
    equipment_log.created_by = current_user
    if equipment_log.save
      render json: { success: true }, status: :ok
    end
  end

  def update
    if @equipment_log.update(equipment_log_params)
      render json: { success: true }, status: :ok
    end
  end

  def destroy
    @equipment_log.destroy
    render json: { success: true }, status: :ok
  end

  private

  def set_equipment
    @equipment_log = EquipmentLog.find params[:id]
  end

  def equipment_log_params
    params.permit(
      :note,
      :equipment_id,
      :status
    )
  end

end
