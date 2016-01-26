class FormsController < ApplicationController
  
  #before_action :turn_back
  
  def index
    @forms = Form.all
  end
  
  def show
  end
  
  def new
    @form = Form.new
  end
  
  def dup
    dups = Dir.entries('public').include? params[:file]
    render json: dups
  end
  
  def upload
    result = Form.upload(params[:file],params[:page])
    if result == 'no pdf'
      redirect_to new_form_path, notice: 'The file must be a PDF'
    elsif result == 'no page'
      redirect_to new_form_path, notice: 'Please choose what form this will be'
    else
      redirect_to forms_path
    end
  end
  
  def destroy
    form = Form.find params[:id]
    redirect_to forms_path if !form
    form.destroy
    redirect_to forms_path
  end
  
end
