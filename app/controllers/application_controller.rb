class ApplicationController < ActionController::Base
    
    helper_method :current_user
    helper_method :logged_in?
    
      #checks if a user is currently logged in
      def logged_in?
        current_user != nil
      end 

      #redirects to login page if no user is logged in
      def if_logged_in
        return redirect_to '/login' unless logged_in?
      end

    private
    #returns current user or sets current user to be equal to session[:user_id]
    def current_user
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
     end

     

    

    
    
    
    

    
end
