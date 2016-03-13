class CommentsController < ApplicationController
  
  before_action :turn_back
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(comment_parmas)
    @comment.created_by = user_session
    if @comment.save
      redirect_to @comment.discussion
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @comment.update(comment_params)
      redirect_to @comment.discussion
    else
      render :edit
    end
  end
  
  def destroy
    discussion = @comment.discussion
    if @comment.created_by = user_session
      @comment.destroy
    end
    redirect_to discussion
  end
  
  private
  
  def set_comment
    @comment = Comment.find params[:id]
  end
  
  def comment_params
    params.require(:comment).permit(:body, :discussion_id)
  end
  
end
