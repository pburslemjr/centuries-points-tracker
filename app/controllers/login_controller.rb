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
      
      if :doCreate == false
        if user = authenticate_with_google
          cookies.signed[:user_id] = user.id
          cookies[:debug] = "doCreate = f  auth = t"
          
                
          redirect_to(home_index_url)
        else
          cookies[:debug] = "doCreate = f  auth = f"
          cookies.signed[:user_id] = 'created account I think'
          redirect_to(home_index_url)
        end
      else
        if user = create
          cookies[:debug] = "doCreate = t  auth = t"
          cookies.signed[:user_id] = user.id
          redirect_to(home_index_url)
        else
          cookies[:debugNew] = flash[:google_sign_in][:id_token]
          cookies[:debug] = "doCreate = t  auth = f"
          cookies.signed[:user_id] = 'failed to create account'
          redirect_to(home_index_url)
        end
      end

    end
  
    private
      def authenticate_with_google
        if id_token = flash[:google_sign_in][:id_token]
          Member.find_by email_id: GoogleSignIn::Identity.new(id_token).user_id
          
        elsif error = flash[:google_sign_in][:error]
          logger.error "Google authentication error: #{error}"
          nil
        
        end
      end

      def create
        if id_token = flash[:google_sign_in][:id_token]
          cookies.signed[:user_id] = GoogleSignIn::Identity.new(id_token).user_id
          Member.create(name: GoogleSignIn::Identity.new(id_token).name, email_id: cookies.signed[:user_id])
          Member.find_by email_id: cookies.signed[:user_id]

          
        elsif error = flash[:google_sign_in][:error]
          logger.error "Google authentication error: #{error}"

          nil
          
          
        
        end
      end
  end
  