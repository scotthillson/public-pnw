class ImagesController < ApplicationController
  
  before_action :turn_back
  
  def index
    @images = Image.all
  end
  
  def manage_images
    @images = Image.all
  end
  
  def show
  end
  
  def new
  end
  
  def upload
    result = Image.upload(params[:file])
    if result == 'dup'
      redirect_to new_image_path, notice: 'An image with that name already exists'
    elsif result == 'small'
      redirect_to new_image_path, notice: 'The image must be at least 1000px wide'
    else
      redirect_to images_path
    end
  end
  
  def edit
  end
  
  def create
  end
  
  def update
  end
  
  def destroy
    image = Image.find params[:id]
    redirect_to images_path if !image
    image.delete
    image.destroy
    redirect_to images_path
  end
  
end
