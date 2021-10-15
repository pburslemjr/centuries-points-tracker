class PointTrackerController < ApplicationController

  def tracker
    @events = Event.all
    @service_hours = ServiceHour.all
    @admin = Admin.find_by(uid: cookies[:current_admin_id])
  end
  
end
