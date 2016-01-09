class ImagesController < ApplicationController
  
  def index
  end
  
  def show
  end
  
  def import
    Media.import_file(params[:file])
  end
  
  def edit
  end
  
  def create
  end
  
  def update
  end
  
  def destroy
    form = Media.find params[:id]
    redirect_to forms_path if !form # form not found
    redirect_to forms_path if form.in_use # form is in use
    form.destroy
    redirect_to forms_path # successful
  end
  
end
