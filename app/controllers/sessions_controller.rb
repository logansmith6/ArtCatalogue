class SessionsController < ApplicationController 

    def new
    end

    def create
        user = User.find_by(email: params[:email])
        
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            flash[:success] = 'You are now signed in.'
            redirect_to '/'
        else
            flash[:warning] = 'Invalid Username or Password'
            redirect_to '/login'
        end 
    end

    def destroy
        session[:user_id] = nil
        redirect_to '/login'
    end

    

end 