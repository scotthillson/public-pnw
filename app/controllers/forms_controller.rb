class FormsController < ApplicationController
  
  before_action :admin_only
  
  def index
    @forms = Form.all
  end
  
  def show
  end
  
  def new
    @form = Form.new
  end
  
  def dup_form_check
    dups = Dir.entries('public').include? params[:file]
    render json: dups
  end
  
  def prospect_application
    settings = []
    render component: 'ProspectApplication', props: { settings: settings }
  end
  
  def create
    result = Form.upload(params[:image][:file],params[:image][:page])
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
