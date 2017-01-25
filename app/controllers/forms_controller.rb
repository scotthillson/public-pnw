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
      application = Application.new(application_params)
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
      {name: [:check, :value]},
      {email: [:check, :value]},
      {birthday: [:check, :value]},
      {mobile_phone: [:check, :value]},
      {home_phone: [:check, :value]},
      {work_phone: [:check, :value]},
      {address: [:check, :value]},
      {city: [:check, :value]},
      {state: [:check, :value]},
      {zip: [:check, :value]},
      {employer: [:check, :value]},
      {job: [:check, :value]},
      {emergency_one: [:check, :value]},
      {emergency_phone_one: [:check, :value]},
      {emergency_relationship_one: [:check, :value]},
      {emergency_two: [:check, :value]},
      {emergency_phone_two: [:check, :value]},
      {emergency_relationship_two: [:check, :value]},
      {reference_one: [:check, :value]},
      {reference_phone_one: [:check, :value]},
      {reference_address_one: [:check, :value]},
      {reference_city_one: [:check, :value]},
      {reference_state_one: [:check, :value]},
      {reference_zip_one: [:check, :value]},
      {reference_two: [:check, :value]},
      {reference_phtwo_two: [:check, :value]},
      {reference_address_two: [:check, :value]},
      {reference_city_two: [:check, :value]},
      {reference_state_two: [:check, :value]},
      {reference_zip_two: [:check, :value]},
      {reference_three: [:check, :value]},
      {reference_phthree_three: [:check, :value]},
      {reference_address_three: [:check, :value]},
      {reference_city_three: [:check, :value]},
      {reference_state_three: [:check, :value]},
      {reference_zip_three: [:check, :value]},
      {phyiscal_shape: [:check, :value]},
      {explain_physical: [:check, :value]},
      {first_aid: [:check, :value]},
      {first_aid_issued: [:check, :value]},
      {certifications: [:check, :value]},
      {special_skills: [:check, :value]},
      {license: [:check, :value]},
      {felony: [:check, :value]},
      {felony_conviction: [:check, :value]},
      {primary_reason: [:check, :value]},
      {liability: [:check, :value]},
      {acknowledge: [:check, :value]},
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
