class MessagesController < ApplicationController

  before_action :advanced_only

  def index
    respond_to do |format|
      format.html
    end
  end

end
