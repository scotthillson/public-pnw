class EquipmentCategoriesController < ApplicationController
  
  before_action :turn_back
  before_action :set_category, only: [:update, :destroy]
  
  def index
    render json: EquipmentCategory.all, status: :ok
  end
  
  def create
    category = EquipmentCategory.new(category_params)
    category.created_by = current_user
    if category.save
      render json: { success: true }, status: :ok
    end
  end
  
  def update
    if @category.update(category_params)
      render json: { success: true }, status: :ok
    end
  end
  
  def destroy
    @category.destroy
    render json: { success: true }, status: :ok
  end
  
  private
  
  def set_equipment
    @category = EquipmentCategory.find params[:id]
  end
  
  def category_params
    params.permit(
      :display_name,
      :category_name,
      :team_id
    )
  end
  
end
