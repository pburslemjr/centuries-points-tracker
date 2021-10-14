class PointTrackerController < ApplicationController

  def tracker
    @events = Event.all
    @service_hours = ServiceHour.all
  end
  
end
