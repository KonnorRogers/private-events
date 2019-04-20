class EventsController < ApplicationController
  before_action :logged_in_user?, only: %i[create show index]

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      flash[:success] = "Event created!"
      redirect_to @event
    else
      flash.now[:danger] = "Unable to create event. Try again"
      render 'events/create'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
  end

  private

  def event_params
    params.require(:event).permit(:day, :location)
  end
end
