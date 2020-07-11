class SessionsController < ApplicationController 
    
    def new
        
    end

    def create
        user = User.find_by(email: params[:email])
        
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to '/posts'
        else
            flash[:alert] = 'Invalid Email/ Password Combination. Please try again!'
            redirect_to '/login'
            
        end 
    end 

    

    def destroy
        session.delete :user_id
        redirect_to '/login'
    end

    private
    
    

    def auth
        request.env['omniauth.auth']
    end

    

end 