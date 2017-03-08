class MessagesController < ApplicationController

  before_action :advanced_only

  def index
    render json: Message.last(9999)
  end

  def create
    message = Message.new(message_params)
    if message.save
      render json: message
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
