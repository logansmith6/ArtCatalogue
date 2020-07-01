class ApplicationController < ActionController::Base
    before_action :current_user

    def home 
        @magic = "Suprise"
    end 

    def current_user
        if session[:current_user_id]
            @current_user = User.find(session[:current_user_id])
        end
    end 
    helper_method :current_user 

    def authorize
        redirect_to '/login' unless current_user
    end
end
