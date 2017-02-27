class GroupsController < ApplicationController

  before_action :advanced_only

  def index
    if Group.get_groups
      status = :ok
    else
      status = :unprocessable_entity
    end
    render json: Group.all, include: :members, status: status
  end

end
