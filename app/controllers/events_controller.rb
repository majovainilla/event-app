class EventsController < ApplicationController
  def new
    @event = Event.new(event_params)
  end

  def show
  end

  def index
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date, :location)
  end
end
