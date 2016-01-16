class FormsController < ApplicationController
  
  def index
    @forms = Form.all
  end
  
  def show
  end
  
  def new
  end
  
  def upload
    Form.upload(params[:file])
    redirect_to forms_path
  end
  
  def edit
  end
  
  def create
  end
  
  def update
  end
  
  def destroy
    form = Upload.find params[:id]
    redirect_to forms_path if !form # form not found
    redirect_to forms_path if form.in_use # form is in use
    form.destroy
    redirect_to forms_path # successful
  end
  
end
