class PointTrackerController < ApplicationController

  def tracker
    @member = Member.find_by(email_id: cookies[:current_member_id])
    @events = Event.all
    @service_hours = Service.where(member_id: @member.id)
  end
  
end
