class PostsController < ApplicationController

  #### Make the logo about 10% bigger
  # Use a larger font size for our name, use a more aggressive font
  # Make the top photo gallery a bit smaller
  # Make the rest of the photos on the front page smaller
  # Put the "who we are" text right under the top photo gallery
  # Put a "Donate" button somewhere on the home page
  # Put our latest tweets on the left side
  # Put announcements on the right side
  #### Sheriff is misspelled
  #### No images of Al Tong or Jamien

  before_action :turn_back, only: [:new, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy, :activate, :deactivate]

  def index
    @posts = Post.all
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

  def download_application
    send_file 'public/application.pdf', type: 'application/pdf', filename: 'pnwsar-application.pdf'
  end

  def download_equipment
    send_file 'public/equipment.pdf', type: 'application/pdf', filename: 'equipment-list.pdf'
  end

  def download_donation
    send_file 'public/donate.pdf', type: 'application/pdf', filename: 'donation-form.pdf'
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
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet.
    def post_params
      params.require(:post).permit(:title, :author, :body)
    end
end
