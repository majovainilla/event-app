class AttendancesController < ApplicationController
 before_action :current_event

  def new
    @attendance = Attendance.new
  end

  def create
    @attendee = current_user
    @attendance = @event.attendances.create(:attendee)
    if @attendance.save
      flash[:success] = 'Congratulations you are in the list'
      redirect_to user_path
    end
  end

  private

  def attendance_params
    params.require(:attendance).permit(:attendee, :attended_event)
  end

  private

  def current_event
    @event = Event.find_by_id(params[:id])
  end


end
