class PostsController < ApplicationController

    before_action  :if_logged_in
    helper_method :current_user
    helper_method :artist_name
    


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
        raise @post.artist_name.inspect
        render :show
            
    end

    private

    

    def post_params
        params.require(:post).permit(:title, :rating, :image, :artist_name, :user_id)
    end     
end