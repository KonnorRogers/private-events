class EventsController < ApplicationController
  def new
  end

  def create
    current_user.events.build(events_params)
  end

  def show
  end

  def index
  end

  private

  def events_params
    params.require(:event).permit(:name, :location)
  end
end
