class PointTrackerController < ApplicationController
  def tracker
    redirect_to point_tracker_admin_url if current_member.isAdmin

    @events = Event.all
    @service_hours = Service.where(member_id: current_member.id).order('date desc')
  end

  def admin
    redirect_to root_path unless current_member.isAdmin

    @events = Event.all
    @members = Member.all
    @service_hours = Service.all
    Rails.logger.debug 'Service is in admin view'
  end
end
