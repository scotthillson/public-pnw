class EventsController < ApplicationController
  
  before_action :turn_back, except: [:index, :show]
  before_action :set_event, only: [:show, :edit, :update, :destroy, :join]
  
  def index
    @events = Event.all
  end
  
  def show
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    @event.created_by = current_user
    if @event.save
      render json: @event
    else
      render json: @event
    end
  end
  
  def join
    if @event.join(current_user)
      redirect_to @event, notice: 'Nice work'
    else
      redirect_to @event, notice: 'something went wrong -_-'
    end
  end
  
  def edit
  end
  
  def update
    if @event.update(event_params)
      @event.updated_by = current_user
      render json: @event
    else
      render json: @event
    end
  end
  
  def destroy
    if @event.destroy
      render json: {success: true}
    else
      render json: {success: false}
    end
  end
  
  private
  
  def set_event
    @event = Event.find params[:id]
  end
  
  def event_params
    params.permit(
      :name,
      :category,
      :start_hour,
      :start_time,
      :address,
      :notes,
      :weather,
      :hours,
      :link,
      :miles,
      :d4h_id,
      :reference,
      :description,
      :lat,
      :lng,
      :start_on,
      :end_on,
      :activity_id
    )
  end
  
end
