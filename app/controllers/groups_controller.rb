class GroupsController < ApplicationController

  before_action :advanced_only

  def index
    if Group.get_groups
      status = :ok
    else
      status = :unprocessable_entity
    end
    respond_to do |format|
      format.html
      format.json do
        render json: Group.all, include: :members, status: status
      end
    end
  end

  def create
    group = Group.new(group_params)
    if group.save
      render json: { success: true }, status: :ok
    end
  end

  def update
    group = Group.find(params[:id])
    if group.update(group_params)
      render json: { success: true }, status: :ok
    end
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy
    render json: { success: true }, status: :ok
  end

  private

  def group_params
    params.permit(
      :name,
      :local_name,
      :first_aid_kit,
      :id,
      :d4h_id
    )
  end

end
