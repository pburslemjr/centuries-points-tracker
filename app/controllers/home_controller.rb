class HomeController < ApplicationController
  def index
  end

  def create
    if user = authenticate_with_google
      Member.memberID = user.id
      Member.name = user.name
      Member.email = user.email_address
      logger.info "Updated Member: create was called! ********************************"
      redirect_to point_tracker_tracker_url
    else
      redirect_to request.referrer, alert: 'authentication_failed'
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
