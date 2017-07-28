class ProspectApplicationsController < ApplicationController

  before_action :advanced_only, except: [:prospect_application, :submit_application]

  def index
    respond_to do |format|
      format.html
      format.json do
        render json: ProspectApplication.all
      end
      format.csv do
        send_data ProspectApplication.csv_export
      end
    end
  end

  def show
    application = ProspectApplication.find(params[:id])
    @fields = Hash[application.attributes.map{|k,v| [k.camelize(:lower), v]}]
    @application = application
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
        puts application.errors.inspect
        format.json { render json: {errors: application.errors}, status: :ok }
      end
    end
  end

  def update
    application = ProspectApplication.find(params[:id])
    if application
      if application.update(application_params.except(:id, :created_at, :updated_at))
        render json: application, status: :ok
      else
        render json: {errors: application.errors}, status: :unprocessable_entity
      end
    else
      render json: {errors: 'record not found'}, status: :unprocessable_entity
    end
  end

  private

  def application_params
    params.permit(
      :id,
      :first_name,
      :last_name,
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
      :d4h,
      :updated_at,
      :created_at,
      :status,
      :approved_by
    ).merge(
      client_ip: request.remote_ip
    )
  end

end
