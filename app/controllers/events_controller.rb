class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy, :attend, :unattend]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.events.build
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_url, notice: 'Event was successfully destroyed.'
  end

  def attend
    current_user.attend_event(@event)
    redirect_to @event, notice: 'You have successfully attended the event.'
  end

  def unattend
    current_user.unattend_event(@event)
    redirect_to @event, notice: 'You have successfully unattended the event.'
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :location)
  end

  def set_event
    @event = Event.find(params[:id])
  end

end
