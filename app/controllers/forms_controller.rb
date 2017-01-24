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
  
  def submit_application
    respond_to do |format|
      application = Application.new_with_params(application_params)
      if application.save
        format.json { render json: application, status: :ok }
      else
        format.json { render json: {errors: 'error'}, status: :ok }
      end
    end
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
  
  private
  
  def application_params
    params.permit(
      :name,
      :email,
      :birthday,
      :mobile_phone,
      :home_phone,
      :work_phone,
      :address,
      :city,
      :state,
      :zip,
      :employer,
      :job,
      :emergency_one,
      :emergency_phone_one,
      :emergency_relationship_one,
      :emergency_two,
      :emergency_phone_two,
      :emergency_relationship_two,
      :reference_one,
      :reference_phone_one,
      :reference_address_one,
      :reference_city_one,
      :reference_state_one,
      :reference_zip_one,
      :reference_two,
      :reference_phtwo_two,
      :reference_address_two,
      :reference_city_two,
      :reference_state_two,
      :reference_zip_two,
      :reference_three,
      :reference_phthree_three,
      :reference_address_three,
      :reference_city_three,
      :reference_state_three,
      :reference_zip_three,
      :phyiscal_shape,
      :explain_physical,
      :first_aid,
      :first_aid_issued,
      :certifications,
      :special_skills,
      :license,
      :felony,
      :felony_conviction,
      :primary_reason,
      :liability,
      :acknowledge,
      :photo_taken_at,
      :waiver_signed_at,
      :dues_paid_at,
      :approved_at,
      :d4h,
      :created_at,
      :updated_at
    )
  end
  
end
