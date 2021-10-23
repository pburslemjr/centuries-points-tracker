class Member < ApplicationRecord
    devise :omniauthable, omniauth_providers: [:google_oauth2]
  
    def self.from_google(uid:, full_name:, email:)
      print(email , "##############################################")
      create_with(uid: uid, name: full_name, email: email, isAdmin: Whitelist.find_by(email: email).isAdmin).find_or_create_by!(uid: uid)
    end
  end
