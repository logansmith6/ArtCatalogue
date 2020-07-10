class PostsController < ApplicationController

    
    


    def index
        
        @posts = Posts.all
    end 

    def show
    @painting_post = Post.find_by(id: params[:id])
       
    end

    def new
        @post = Post.new
    end

    def edit
    end 

    def create
        
        user = current_user
        @post = user.post.new(psot_params)
        @post.save!
        render :show
            
    end

    private

    

    def post_params
        params.require(:post).permit(:title, :rating, :image, :user_id)
    end     
end