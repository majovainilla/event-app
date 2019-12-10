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
    @previous_events = Event.previous
    @upcoming_events = Event.upcoming
  end

  def attend
    @user = current_user
    @event = current_event
    attendance = @user.attended_events << @event
    if attendance
      flash[:success] = 'Congratulations you are in the list'
      redirect_back fallback_location: @user
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date, :location)
  end
end
