class Member < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:google_oauth2]
  has_and_belongs_to_many :events

  def self.from_google(uid:, full_name:, email:)
    # print("UID '#{uid}', full_name '#{full_name}', email '#{email}'\n")

    return nil if Whitelist.find_by(email: email).nil?

    create_with(uid: uid, name: full_name, email: email, isAdmin: false).find_or_create_by!(uid: uid)
  end

  def sort_service
    Service.where(member_id: id).sum(:hours)
  end

  def sort_pp
    ordered = Event.order(:datetime)

    @past_events = ordered.where('datetime <= ?', Time.zone.now).or(ordered.where(datetime: nil))

    return 'Past events is Nil!' if @past_events.nil?

    if @past_events.length.zero?
      'No events!'
    else
      ((events.length.to_f / @past_events.length) * 100.to_f).round(2)
    end
  end

  def sort_mm
    ordered = Event.order(:datetime)

    @past_events = ordered.where('datetime <= ?', Time.zone.now).or(ordered.where(datetime: nil))

    return 'Past events is Nil!' if @past_events.nil?

    if @past_events.length.zero?
      'No events!'
    else
      @past_events.count(&:isMandatory) - events.count(&:isMandatory)
    end
  end
end
