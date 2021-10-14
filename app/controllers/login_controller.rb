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
      if :doCreate
        if user = authenticate_with_google
          cookies.signed[:user_id] = user.id
          
                
          redirect_to(home_index_url)
        else
          
          cookies.signed[:user_id] = 'created account I think'
          redirect_to(home_index_url)
        end
      else
        if user = create
          cookies.signed[:user_id] = user.id
          redirect_to(home_index_url)
        else
          
          cookies.signed[:user_id] = 'failed to create account'
          redirect_to(home_index_url)
        end
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

      def create
        if flash[:google_sign_in] && id_token = flash[:google_sign_in][:id_token]
          Member.create(name: GoogleSignIn::Identity.new(id_token).name, email_id: GoogleSignIn::Identity.new(id_token).user_id)
          
          
        elsif flash[:google_sign_in] && error = flash[:google_sign_in][:error]
          logger.error "Google authentication error: #{error}"
          nil
        
        end
      end
  end
  