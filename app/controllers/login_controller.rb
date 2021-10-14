class LoginController < ApplicationController
    def new
    end

    def logout
      puts "Current time #{Time.now}"
      
      redirect_to(login_index_path)

      
    end
    def index

    end
  
    def click
      if user = authenticate_with_google
        cookies.signed[:user_id] = user.id
        
               
        redirect_to(login_index_url)
      else
        
        cookies.signed[:user_id] = 'this is a test user id'
        redirect_to(home_index_url)
      end
    end
  
    private
      def authenticate_with_google
        if flash[:google_sign_in] && id_token = flash[:google_sign_in][:id_token]
          Member.find_by email_id: GoogleSignIn::Identity.new(id_token).user_id
          
        elsif flash[:google_sign_in] && error = flash[:google_sign_in][:error]
          logger.error "Google authentication error: #{error}"
          nil
        end
      end
  end
  