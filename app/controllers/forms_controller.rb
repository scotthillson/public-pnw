class FormsController < ApplicationController
  
  before_action :turn_back
  
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
    form = Form.find params[:id]
    redirect_to forms_path if !form
    form.destroy
    redirect_to forms_path
  end
  
end
