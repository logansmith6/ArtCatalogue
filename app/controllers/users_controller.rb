class UsersController < ApplicationController

    skip_before_action :verified_user, only: [:new, :create]
    # GET /signup
    def new
        @user = User.new
    end 

    # POST /users
    def create
       
        
        if @user = User.create(user_params)
            session[:user_id] = @user.id
        else
            redirect_to '/signup'
        end 
       
    end

    private

    def current_user
        session[:current_user_id]
    end

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end 

end 