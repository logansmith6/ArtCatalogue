class SessionsController < ApplicationController 

        skip_before_action :verified_user, only: [:new, :create]
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(email: params[:email])
        
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to '/paintings'
        else
            flash[:warning] = 'Invalid Username or Password'
            redirect_to '/login'
        end 
    end

    def destroy
        
        reset_session
        
        
        redirect_to '/login'
    end

    

end 