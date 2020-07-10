class UsersController < ApplicationController
    
 # GET /signup
 def new
    if session[:current_user_id]
        redirect_to "/", :notice => "Already logged in."
    end
end 

# POST /users
def create
    @user = User.new(user_params)
    
    if @user.save
        redirect_to '/login'
    else
        redirect_to '/signup'
    end 
   
end

def show
    @user = User.find_by(params[:user_id])
end 

def index
    @users = User.all
end

private




def user_params
    params.require(:user).permit(:email, :password)
end 

end 