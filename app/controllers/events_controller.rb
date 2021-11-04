class EventsController < ApplicationController
  def index
    member = Member.find_by(uid: cookies[:current_member_id])
    @my_events = member.events

    ordered = Event.order(:datetime)

    @upcoming_events = ordered.where('datetime > ? or datetime IS NULL', Time.now).reject do |w|
      @my_events.include? w
    end
    @past_events = ordered.where('datetime <= ?', Time.now).reject { |w| @my_events.include? w }
  end

  def show
    @event = Event.find_by_id(params[:id])
    if @event.nil?
      flash[:not_found] = 'Not found'
      redirect_to(events_path)
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.time.nil? ^ @event.date.nil?
      flash[:danger] = ['Please enter both a day and time, or enter neither.']
      render(new_event_path)
      return
    end

    @event.createDateTime

    if @event.save
      redirect_to(events_path)
    else
      render('new')
    end
  end

  def edit
    @event = Event.find_by_id(params[:id])
    render('edit') if @event.nil?
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    @event.date = params[:event][:date]
    @event.time = params[:event][:time]

    if @event.time.nil? ^ @event.date.nil?
      flash[:danger] = ['Please enter both a day and time, or enter neither.']
      render(new_event_path)
      return
    end

    @event.createDateTime

    if @event.save
      redirect_to(event_path(@event))
    else
      flash[:danger] = @event.errors.full_messages
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

  def attend
    @event = Event.find(params[:id])
    member = Member.find_by(uid: cookies[:current_member_id])
    member.events << @event
    member.save
    redirect_to(events_path)
  end

  def unattend
    @event = Event.find(params[:id])
    member = Member.find_by(uid: cookies[:current_member_id])
    member.events.delete(@event)
    member.save
    redirect_to(events_path)
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date, :isMandatory, :time, :location)
  end
end
