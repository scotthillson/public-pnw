class MembersController < ApplicationController

  before_action :turn_back
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  def update_members
    if Member.get_members
      status = :ok
    else
      status = :unprocessable_entity
    end
    render json: Member.where('d4h_id is not null').order(:name), status: status
  end

  def index
    respond_to do |format|
      format.html
      format.json do
        render json: Member.members, status: :ok
      end
    end
  end

  private

  def set_member
    @member = Member.find(params[:id])
  end

  def member_params
    params.require(:member).permit(:name)
  end

end
