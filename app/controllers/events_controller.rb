class EventsController < ApplicationController
  def index
    puts "Current time #{Time.now}"

    @my_events = []
    Member.find_by(uid: cookies[:current_member_id]).attendance_list.each do |e|
      @my_events.append(e.event)
    end
    @upcoming_events = Event.order(:datetime).where('datetime > ? or datetime IS NULL', Time.now)
    @past_events = Event.order(:datetime).where('datetime <= ?', Time.now)
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
      flash[:errors] = ['Please enter both a day and time, or enter neither.']
      render(new_event_path)
      return
    end

    @event.createDateTime

    if @event.save
      
      member = Member.find_by(uid: cookies[:current_member_id])

      attendance = AttendanceList.new(event: @event)
      # attendance.members << member
      attendance.save
      # member.attendance_list << attendance
      # member.save


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

  def attend
    puts "Hello World"

    @event = Event.find(params[:id])
    member = Member.find_by(uid: cookies[:current_member_id])

    attendance = @event.attendance_list
    attendance.members << member
    attendance.save

    member.attendance_list << attendance
    member.save

    redirect_to(events_path)
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date, :isMandatory, :time, :location)
  end
end
