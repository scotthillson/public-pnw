class PostsController < ApplicationController

  before_action :turn_back, only: [:new, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy, :activate, :deactivate]

  def index
    @posts = Post.all.reverse
  end

  def home
    @posts = Post.active
  end

  def show
  end

  def activate
    @post.active = true
    @post.save
    redirect_to posts_path
  end

  def deactivate
    @post.active = false
    @post.save
    redirect_to posts_path
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def sponsors
  end

  def application_download
    send_file "#{Rails.root}/public/application.pdf",
    type: 'application/pdf',
    filename: 'pnwsar-application.pdf'
  end

  def equipment_download
    send_file "#{Rails.root}/public/equipment.pdf",
    type: 'application/pdf',
    filename: 'equipment-list.pdf'
  end

  def donation_download
    send_file "#{Rails.root}/public/donate.pdf",
    type: 'application/pdf',
    filename: 'donation-form.pdf'
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :author, :body)
  end

end
