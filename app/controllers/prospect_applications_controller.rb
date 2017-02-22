class ProspectApplicationsController < ApplicationController
  
  before_action :advanced_only
  
  def index
    respond_to do |format|
      format.html
      format.json do
        render json: ProspectApplication.all
      end
    end
  end
  
  def show
    application = ProspectApplication.find params[:id]
    fields = Hash[application.attributes.map{|k,v| [k.camelize(:lower), v]}]
    render component: 'ReviewProspectApplication', props: { fields: fields}
  end
  
  def prospect_application
    render component: "ApplicationLanding"
  end
  
  def submit_application
    respond_to do |format|
      application = ProspectApplication.new(application_params)
      if application.save
        format.json { render json: {success: true}, status: :ok }
      else
        format.json { render json: {errors: application.errors}, status: :ok }
      end
    end
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
      :address_state,
      :postal,
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
      :reference_postal_one,
      :reference_two,
      :reference_phone_two,
      :reference_address_two,
      :reference_city_two,
      :reference_state_two,
      :reference_postal_two,
      :reference_three,
      :reference_phone_three,
      :reference_address_three,
      :reference_city_three,
      :reference_state_three,
      :reference_postal_three,
      :physical_shape,
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
      :d4h
    )
  end
  
end
