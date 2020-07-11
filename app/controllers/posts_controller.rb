class PostsController < ApplicationController

    before_action  :if_logged_in
    helper_method :current_user
    helper_method :artist_name
    


    def index
        @posts = Post.all
        
    end 

    def show
         @post = Post.find_by_id(params[:id])
         
    end

    def new
        @post = Post.new
    end

    def edit
    end 

    def create
        
        @post = current_user.posts.build(post_params)
        @post.artist.name = post_params[artist_attributes: [:name]]
        @post.save!
        #raise Artist.find_or_create_by(params[:artist_name]).name
        redirect_to @post
            
    end

    private

    

    def post_params
        params.require(:post).permit(:title, :rating, :image, :user_id, artist_attributes: [:name])
    end     
end