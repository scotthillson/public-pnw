class ImagesController < ApplicationController
  
  def index
    @images = Image.all
  end
  
  def show
  end
  
  def new
  end
  
  def upload
    Image.import_file(params[:file])
    redirect_to images_path
  end
  
  def edit
  end
  
  def create
  end
  
  def update
  end
  
  def destroy
    image = Image.find params[:id]
    redirect_to images_path if !image # form not found
    redirect_to images_path if image.in_use # form is in use
    image.destroy
    redirect_to images_path # successful
  end
  
end
