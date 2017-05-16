class LocationsController < ApplicationController

  def new_with_token
    if Location.create_with_token(location_params)
      render json: { success: true }, status: :ok
    else
      render json: { success: false }, status: :unprocessable_entity
    end
  end

  private

  def location_params
    params.permit(
      :token,
      :horizon_accuracy,
      :vert_accuracy,
      :course,
      :speed,
      :time,
      :alt,
      :lat,
      :lng
    )
  end

end
