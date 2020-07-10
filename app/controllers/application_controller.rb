class ApplicationController < ActionController::Base
    
   
    

    def home 
        
        
    end 


    private 

    def current_user
        if session[:current_user_id]
            @current_user = User.find(session[:current_user_id])
        else
            redirect_to '/login'
        end
    end 
    
    def login(user)
        session[:current_user_id] = @user.id
    end

    def authorize
        redirect_to '/login' unless current_user
    end
end
