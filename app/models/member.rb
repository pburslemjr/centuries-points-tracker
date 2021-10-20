class Member < ApplicationRecord
    devise :omniauthable, omniauth_providers: [:google_oauth2]
  
    def self.from_google(uid:, full_name:)
      create_with(email_id: uid, name: full_name).find_or_create_by!(email_id: uid)
    end
  end