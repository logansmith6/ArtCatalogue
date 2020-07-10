class SessionsController < ApplicationController 

    def new
    end

    def create
        @user = User.find_by(email: params[:email])
        
        if @user && @user.authenticate(params[:password])
            login(@user)
            flash[:success] = 'You are now signed in.'
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