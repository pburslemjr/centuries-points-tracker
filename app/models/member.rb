class Member < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:google_oauth2]
  has_and_belongs_to_many :events

  def self.from_google(uid:, full_name:, email:)
    # print("UID '#{uid}', full_name '#{full_name}', email '#{email}'\n")

    return nil if Whitelist.find_by(email: email).nil?

    create_with(uid: uid, name: full_name, email: email,
                isAdmin: Whitelist.find_by(email: email).isAdmin).find_or_create_by!(uid: uid)
  end
end
