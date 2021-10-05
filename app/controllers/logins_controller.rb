class LoginsController < ApplicationController
    def new
    end
  
    def create
      if user = authenticate_with_google
        Member.memberID = user.id
        Member.name = user.name
        Member.email = user.email_address
        
        redirect_to(point_tracker_tracker_url)
      else
        #redirect_to(login_url)
      end
    end
  
    private
      def authenticate_with_google
        if id_token = flash[:google_sign_in][:id_token]
          Member.find_by memberID: GoogleSignIn::Identity.new(id_token).user_id
          
        elsif error = flash[:google_sign_in][:error]
          logger.error "Google authentication error: #{error}"
          nil
        end
      end
  end
  