class PostsController < ApplicationController

    before_action  :if_logged_in
    helper_method :current_user
    
    
    


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
        
        @post = Post.new(post_params)
        @post.user = User.find(current_user.id)
        @post.artist = Artist.find_or_create_by(post_params[:artist_attributes])
        #raise @post.artist.inspect
        if @post.save
            render :show 
        else
            redirect_to '/posts/new'
        end


            
    end

    private

    

    def post_params
        params.require(:post).permit(:title, :rating, :image, :user_id, :artist_id, :artist_attributes => [:name])
    end     
end