class AttendancesController < ApplicationController
    before_action :authenticate_user! # Make sure the user is authenticated

    def create
      event = Event.find(params[:event_id])
      current_user.attendances.create(attended_event: event)
      redirect_to event, notice: "You're now attending this event!"
    end
  
    def destroy
      attendance = current_user.attendances.find(params[:id])
      attendance.destroy
      redirect_to attendance.attended_event, notice: "You're no longer attending this event."
    end
end
