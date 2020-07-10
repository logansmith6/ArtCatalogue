class ApplicationController < ActionController::Base
    
    

    def current_user
        @user = (User.find_by(id: session[:user_id]) || User.new)
      end

      def logged_in?
        current_user.id != nil
      end 

      def if_logged_in
        return redirect_to '/login' unless logged_in?
      end

    def home 
    end 


    

    
    
    
    

    
end
