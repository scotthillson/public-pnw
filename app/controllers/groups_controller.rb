class GroupsController < ApplicationController
  
  before_action :advanced_only
  
  def update_groups
    if Group.get_groups
      status = :ok
    else
      status = :unprocessable_entity
    end
    render json: Group.all, status: status
  end
  
  def index
      render json: Group.all, status: :ok
  end
  
end
