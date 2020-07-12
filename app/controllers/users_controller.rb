class UsersController < ApplicationController
    
def most_posts
        @user = User.all.find.max_by {|user| user.posts.count}
        
        render template: 'users/show'
        
    
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
    end 
   
end

def show
    @user = User.find_by_id(params[:id])
end 

def index
    @users = User.all
end

private




def user_params
    params.require(:user).permit(:full_name, :email, :password, :user_id)
end 

end 