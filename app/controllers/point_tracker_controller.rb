class PointTrackerController < ApplicationController
  def tracker
    redirect_to point_tracker_admin_url if current_member.isAdmin

    @mandatory_event_num = Event.where(isMandatory: true).where('datetime < ?', Time.zone.now).length
    @member_mandatory_event_num = current_member.events.where(isMandatory: true).where('datetime < ?',
                                                                                       Time.zone.now).length

    ordered = Event.order(:datetime)
    @upcoming_events = ordered.where('datetime > ? or datetime IS NULL', Time.zone.now).limit(5)
    @service_hours = Service.where(member_id: current_member.id).order('date desc')
  end

  def admin
    redirect_to root_path unless current_member.isAdmin

    @events = Event.all
    @mandatory_event_num = Event.where(isMandatory: true).where('datetime < ?', Time.zone.now).length
    @event_num = Event.where('datetime < ?', Time.zone.now).length
    @members = Member.all
    @service_hours = Service.all
    Rails.logger.debug 'Service is in admin view'
  end
end
