class MessagesController < ApplicationController

  before_action :advanced_only, except: [:index, :new_with_token]

  def incident
    render json: Message.all, status: :ok
  end

  def index
    messages = User.my_messages(params)
    if messages
      render json: messages, status: :ok
    else
      render json: { error: "Unauthorized" }, status: 401
    end
  end

  def new
    render json: { success: true }, status: :ok
  end

  def new_with_token
    if Message.create_with_token(message_params)
      render json: { success: true, messages: User.my_messages(params) }, status: :ok
    else
      render json: { success: false }, status: :unprocessable_entity
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
      :date_sent,
      :to,
      :from,
      :body,
      :token,
      :direction
    )
  end

end
