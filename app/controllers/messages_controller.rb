class MessagesController < ApplicationController

  before_action :advanced_only

  def index
    render json: Message.all, include: :member, status: :ok
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
      params[:incident_id]
      message = Message.send_message(params[:to], params[:from], params[:body], params[:incident_id])
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
