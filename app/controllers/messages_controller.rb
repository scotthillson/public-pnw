class MessagesController < ApplicationController

  before_action :advanced_only, except: [:index]

  def index
    if valid_api_token
      render json: { data: Message.all }, include: :member, status: :ok
    else
      render json: { error: "Unauthorized" }, status: 401
    end
  end

  def update_messages
    if Message.get_messages
      render json: Message.all, include: :member, status: :ok
    else
      render json: { success: false }, status: :unprocessable_entity
    end
  end

  def send_message
    if params[:to] &&
      params[:from] &&
      params[:body] &&
      message = Message.send_message(params[:to], params[:from], params[:body])
      render json: message, status: :ok
    else
      render json: message, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.permit(
      :date_created,
      :date_updated,
      :date_sent,
      :to,
      :from,
      :body,
      :token,
      :direction
    )
  end

end
