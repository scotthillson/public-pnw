class EventsController < ApplicationController
  
  before_action :turn_back
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
    @event.created_by = user_session
    if @event.save
      redirect_to @event
    else
      render :new
    end
  end
  
  def join
    if @event.join(user_session)
      redirect_to @event, notice: 'Nice work'
    else
      redirect_to @event, notice: 'something went wrong -_-'
    end
  end
  
  def edit
  end
  
  def update
    if @event.update(event_params)
      @event.updated_by = user_session
      redirect_to @event
    else
      render :edit
    end
  end
  
  def destroy
    @event.destroy
    redirect_to root_url
  end
  
  private
  
  def set_event
    @event = Ride.find params[:id]
  end
  
  def event_params
    params.require(:event).permit(:name,:category,:start_hour,:start_time,:address,:notes,:weather,:hours,:link,:miles)
  end
  
end
