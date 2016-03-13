class DiscussionsController < ApplicationController
  
  before_action :turn_back
  before_action :set_discussion, only: [:show, :edit, :update, :destroy]
  
  def index
    @dicussions = Discussion.all.reverse
  end
  
  def show
  end
  
  def new
    @discussion = Discussion.new
  end
  
  def create
    @discussion = Discussion.new(discussion_params)
    @discussion.created_by = user_session
    if @discussion.save
      redirect_to @discussion
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
    if @discussion.created_by = user_session
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
