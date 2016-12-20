class Api::V1::MessagesController < Api::V1::BaseController
  
  def index
    @messages = User.all
    respond_to do |format|
      format.json { render json: @messages.as_json, status: :ok }
    end
  end
  
end
