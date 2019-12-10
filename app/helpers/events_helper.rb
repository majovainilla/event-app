# frozen_string_literal: true

module EventsHelper
  def current_event
    @event = Event.find(params[:id])
  end
end
