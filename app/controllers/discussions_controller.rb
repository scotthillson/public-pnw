class DiscussionsController < ApplicationController
  
  before_action :turn_back
  before_action :set_discussion, only: [:show, :edit, :update, :destroy]
  
  def index
    @discussions = Discussion.all.reverse
  end
  
  def show
  end
  
  def new
    @discussion = Discussion.new
  end
  
  def create
    @discussion = Discussion.new(discussion_params)
    @discussion.created_by = current_user
    if @discussion.save
      redirect_to discussions_url
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @discussion.update(discussion_params)
      redirect_to @discussion
    else
      render :edit
    end
  end
  
  def destroy
    if @discussion.created_by = current_user
      @discussion.destroy
    end
    redirect_to discussions_url
  end
  
  private
  
  def set_discussion
    @discussion = Discussion.find params[:id]
  end
  
  def discussion_params
    params.require(:discussion).permit(:subject,:body)
  end
  
end
