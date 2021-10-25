class PointTrackerController < ApplicationController
  def tracker
    @events = Event.all
    if !current_member.isAdmin
      @service_hours = Service.where(member_id: current_member.id).order('date desc')
    else
      @service_hours = Service.all.order('date desc')
      print('Service is in admin view')
    end
  end
end
