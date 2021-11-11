class Admin < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_google(uid:, full_name:)
    create_with(uid: uid, full_name: full_name,
                avatar_url: avatar_url).find_or_create_by!(email: email)
  end
end
