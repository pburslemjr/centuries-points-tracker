class Member < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:google_oauth2]
  has_and_belongs_to_many :events

  def self.from_google(uid:, full_name:, email:)
    # print("UID '#{uid}', full_name '#{full_name}', email '#{email}'\n")

    return nil if Whitelist.find_by(email: email).nil?

    create_with(uid: uid, name: full_name, email: email,
                isAdmin: Whitelist.find_by(email: email).isAdmin).find_or_create_by!(uid: uid)
  end

  def getService
    return Service.where(member_id: self.id).sum(:hours)
  end

  def getPP
    ordered = Event.order(:datetime)
   
    @past_events = ordered.where('datetime <= ?', Time.now).or(ordered.where(datetime: nil))

    if @past_events.nil?
      return "Past events is Nil!"
    end
    if @past_events.length() == 0
      return "No events!"
    else
      return ((events.length().to_f / @past_events.length()) * 100.to_f).round(2)
    end
     
  end

  def getMM
    ordered = Event.order(:datetime)
   
    @past_events = ordered.where('datetime <= ?', Time.now).or(ordered.where(datetime: nil))

    if @past_events.nil?
      return "Past events is Nil!"
    end
    if @past_events.length() == 0
      return "No events!"
    else    
      return @past_events.select {|e| e.isMandatory}.length() - events.select {|e| e.isMandatory}.length()
    end
  end
end
