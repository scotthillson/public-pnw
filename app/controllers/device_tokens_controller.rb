class DeviceTokensController < ApplicationController

  def verify
    token = DeviceToken.verify_token(token_params)
    if token
      render json: { success: true, token: token }, status: :ok
    else
      render json: { success: false }, status: :unprocessable_entity
    end
  end

  def generate
    if DeviceToken.request(token_params)
      render json: { success: true }, status: :ok
    else
      render json: { success: false }, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def token_params
    params.permit(
      :code,
      :mobile_phone
    )
  end

end
