class PointTrackerController < ApplicationController

  def tracker
    @events = Event.all
    @service_hours = ServiceHour.all
    @member = Member.find_by(email_id: cookies[:current_member_id])
  end
  
end
