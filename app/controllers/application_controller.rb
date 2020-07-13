class ApplicationController < ActionController::Base
    
    helper_method :current_user

    

      def logged_in?
        current_user != nil
      end 

      def if_logged_in
        return redirect_to '/login' unless logged_in?
      end

    private

    def current_user
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
     end

     

    

    
    
    
    

    
end
