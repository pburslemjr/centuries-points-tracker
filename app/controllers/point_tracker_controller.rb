class PointTrackerController < ApplicationController
  def tracker
    if current_member.isAdmin
      redirect_to point_tracker_admin_url
    end

    @events = Event.all
    @service_hours = Service.where(member_id: current_member.id).order('date desc')

  end

  def admin
    if !current_member.isAdmin
      redirect_to root_path
    end

    @events = Event.all
    @members = Member..where(isAdmin: false)
    @service_hours = Service.all
    Rails.logger.debug 'Service is in admin view'
  end
end
