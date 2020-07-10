class PostsController < ApplicationController

    before_action  :if_logged_in
    


    def index
        @posts = Post.all
    end 

    def show
         @post = Post.find_by(params[:id])
    end

    def new
        @post = Post.new
    end

    def edit
    end 

    def create
        
        @post = current_user.posts.build(post_params)
        
        render :show
            
    end

    private

    

    def post_params
        params.require(:post).permit(:title, :rating, :image, :artist_name, :user_id, :artist_id)
    end     
end