class UsersController < ApplicationController
    #sets @user to be equal to user with most posts, then renders show page
    def most_posts
        @user = User.most_posts
         render :show
     end

    # GET /signup
    def new
    end 

    # POST /users
    def create

     @user = User.new(user_params)
    
     if @user.save
            redirect_to '/login'
     else
         redirect_to '/signup'
         flash[:error] = "Please try again."
     end 
   
    end

    #shows specific user, finds by id
    def show
         @user = User.find_by_id(params[:id])   
    end 
    #shows all users
    def index
       @users = User.all
    end

    private

    
    def user_params
      params.require(:user).permit(:full_name, :email, :password, :id)
    end 

end 