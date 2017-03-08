class MessagesController < ApplicationController

  before_action :advanced_only

  def index
    render json: Message.inbound, include: :member, status: :ok
  end

  def sent_messages
    render json: Message.outbound, include: :member, status: :ok
  end

  def update_messages
    if Message.get_messages
      render json: { success: true }, status: :ok
    else
      render json: { success: false }, status: :unprocessable_entity
    end
  end

  def create
    message = Message.new(message_params)
    if message.save
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
