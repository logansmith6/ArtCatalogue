class UsersController < ApplicationController

    # GET /signup
    def new
        if session[:current_user_id]
            redirect_to "/", :notice => "Already logged in."
        end
    end 

    # POST /users
    def create
        @user = User.new 
        @user.email = params[:email]
        @user.password_digest = params[:password_digest]
        @user.save

        redirect_to "/login"
       
    end

end 