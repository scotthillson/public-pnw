class MembersController < ApplicationController

  before_action :turn_back, only: [:new, :edit, :update, :destroy]
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  def index
    @page = Page.where(name:'About').order(:created_at).last.body.html_safe
  end

  def show
  end

  def new
    @member = Member.new
  end

  def edit
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to @member, notice: 'Member was successfully created.'
    else
      render :new
    end
  end

  def update
    if @member.update(member_params)
      redirect_to @member, notice: 'Member was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @member.destroy
    redirect_to members_url, notice: 'Member was successfully destroyed.'
  end

  private

  def set_member
    @member = Member.find(params[:id])
  end

  def member_params
    params.require(:member).permit(:name, :title, :image)
  end
end
