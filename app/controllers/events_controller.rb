class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @user = User.find_by(remember_token: cookies[:remember_token])
    @event = @user.events.build(event_params)
    if @event.save
      flash[:success] = 'Event successfully created'
      redirect_to @event
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @user = @event.creator
  end

  def index
    @events = Event.all
    @upcoming_events = []
    @previous_events = []
    @events.each do |event|
      if event.past?
        @previous_events << event 
      else
        @upcoming_events << event
      end
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date, :location)
  end
end