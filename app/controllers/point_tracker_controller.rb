class PointTrackerController < ApplicationController

  def tracker
    
    @events = Event.all
    @service_hours = Service.where(member_id:current_member.id)
  end
  
end
