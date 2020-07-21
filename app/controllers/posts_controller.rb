class PostsController < ApplicationController
    #checks if a user is logged in
    before_action :if_logged_in
    
    #this index method works for all posts or all posts for a specific artist
    def index
        if params[:artist_id]
            @posts = Post.where(artist: params[:artist_id])
        elsif 
            @posts = Post.all
        end 
    end 

    #similar to index, this method shows a specific post from the browse all paintings page, or a specific post from the artists' index page
    def show
        if params[:artist_id]
            @post = Post.find(params[:id])
        else
            @post = Post.find(params[:id])
        end
    end

    #creates new local object, does not save to database
    def new
        @post = Post.new
    end

    #associates current user with new post. also finds or creates an artist for the new post
    #if the post saves (validation) then it shows the newly created post. if not, an alert is flashed and user is redirected to the new post page (again)
    def create 
        @post = Post.new(post_params)
        @post.user = User.find(current_user.id)
        @post.artist = Artist.find_or_create_by(post_params[:artist_attributes])

        if @post.save
           render :show
        else
            flash[:alert] = 'Fill in all boxes!'
            redirect_to '/posts/new'
        end  
    end

    #user can delete their own posts
    def destroy
        @post = Post.find(params[:id])
        if current_user.id == @post.user_id
            @post.destroy
            redirect_to '/posts'
            flash[:error] = "Post was deleted."
        else
            flash[:error] = "You cannot delete others' posts!"
        end
    end

    private

    
    
    def post_params
        params.require(:post).permit(:title, :image, :user_id, :artist_id, :artist_attributes => [:name])
    end     
end