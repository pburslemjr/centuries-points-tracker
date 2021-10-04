class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find_by_id(params[:id])
    if @event.nil?
      flash[:not_found] = "Not found"
      redirect_to(events_path)
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to(events_path)
    else
      flash[:errors] = @event.errors.full_messages
      redirect_to new_event_path
    end
  end

  def edit
    @event = Event.find_by_id(params[:id])
    if @event.nil?
      flash[:not_found] = "Not found"
      redirect_to(events_path)
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to(event_path(@event))
    else
      flash[:errors] = @event.errors.full_messages
      redirect_to edit_event_path
    end
  end

  def delete
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to(events_path)
  end

  private
    def event_params
      params.require(:event).permit(:name, :description, :date, :isMandatory, :time, :location)
    end


end
