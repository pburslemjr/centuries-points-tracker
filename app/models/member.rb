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
      ((events.where('datetime <= ?', Time.zone.now).length.to_f / @past_events.length) * 100.to_f).round(2)
      
    end
  end

  def sort_mm(uid:)
    return nil if Member.find_by(uid: uid).nil?
    @curr_member = Member.find_by(uid: uid)
    ordered = Event.order(:datetime)  
    @past_m = ordered.where(isMandatory: true).where('datetime <= ?', Time.zone.now).length
    @member_mandatory_event_num = @curr_member.events.where(isMandatory: true).where('datetime <= ?', Time.zone.now).length

    return 'Past mandatory events is Nil!' if @past_m.nil?

    if @past_m == 0
      'No mandatory events have happened yet!'
    else
      if @member_mandatory_event_num == 0
        @past_m
      else
      @past_m - @member_mandatory_event_num 
      end
    end
  end

  def get_mm
    return sort_mm(uid: Member.find_by(id: id).uid)
  end
end
