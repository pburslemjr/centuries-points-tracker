class Member < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:google_oauth2]
  has_and_belongs_to_many :events

  def self.from_google(uid:, full_name:, email:)
    # print("UID '#{uid}', full_name '#{full_name}', email '#{email}'\n")

    return nil if Whitelist.where('lower(email) = ?', email.downcase).empty?

    create_with(uid: uid, name: full_name, email: email.downcase, isAdmin: false).find_or_create_by!(uid: uid)
  end

  def sort_service
    Service.where(member_id: id).sum(:hours)
  end

  def sort_pp
    ordered = Event.order(:datetime)

    @past_events = ordered.where('datetime <= ?',
                                 Time.zone.now).or(ordered.where(datetime: nil)).where(isMandatory: false)

    return 'Past events is Nil!' if @past_events.nil?

    if @past_events.length.zero?
      '100'
    else
# rubocop:disable Layout/LineLength
      100*current_member.events.where('datetime < ?', Time.now).where(isMandatory: false).length / Event.where('datetime < ?', Time.zone.now).where(isMandatory: false).length
# rubocop:enable Layout/LineLength      
    end
  end

  def sort_mm(uid:)
    return nil if Member.find_by(uid: uid).nil?

    @curr_member = Member.find_by(uid: uid)
    ordered = Event.order(:datetime)
    @past_m = ordered.where(isMandatory: true).where('datetime <= ?', Time.zone.now).length
    @member_mandatory_event_num = @curr_member.events.where(isMandatory: true).where('datetime <= ?',
                                                                                     Time.zone.now).length

    return 'Past mandatory events is Nil!' if @past_m.nil?

    if @past_m.zero?
      'No mandatory events have happened yet!'
    elsif @member_mandatory_event_num.zero?
      @past_m
    else
      @past_m - @member_mandatory_event_num
    end
  end

  # rubocop:disable Naming/AccessorMethodName
  def get_mm
    sort_mm(uid: Member.find_by(id: id).uid)
  end
  # rubocop:enable Naming/AccessorMethodName
end
