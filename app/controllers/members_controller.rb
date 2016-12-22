class MembersController < ApplicationController
  
  before_action :advanced_only
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  
  def index
    Member.fast_sync
    @members = Member.where('d4h_id is not null').order(:name)
    render component: 'Members', props: { members: @members }
  end
  
  private
  
  def set_member
    @member = Member.find(params[:id])
  end
  
  def member_params
    params.require(:member).permit(:name)
  end
  
end
