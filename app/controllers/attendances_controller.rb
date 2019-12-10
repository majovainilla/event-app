# frozen_string_literal: true

class AttendancesController < ApplicationController
  before_action :current_event

  def new
    @attendance = Attendance.new
  end

  def create
    @attendee = current_user
    @attendance = @attendee.attended_events << @event
    if @attendance.save
      flash[:success] = 'Congratulations you are in the list'
      redirect_to event_path
    end
  end

  private
end
