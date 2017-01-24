class MembersController < ApplicationController
  
  before_action :advanced_only
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  
  def index
    respond_to do |format|
      format.html do
        render component: 'Members'
      end
      format.json do
        Member.get_members('fast_update')
        render json: Member.where('d4h_id is not null').order(:name)
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
