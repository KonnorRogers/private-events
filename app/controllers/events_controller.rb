class EventsController < ApplicationController
  def create
    current_user.events.build(events_params)
  end

  def show
  end

  def index
  end

  private

  def events_params
    params.require(:event)
  end
end
