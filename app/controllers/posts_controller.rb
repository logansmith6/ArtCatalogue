class PostsController < ApplicationController

   
    before_action :if_logged_in
    
    def index
        if params[:artist_id]
            @posts = Post.where(artist: params[:artist_id])
        elsif 
            @posts = Post.all
        end 
    end 

    def show
        if params[:artist_id]
            @post = Post.find(params[:id])
        else
            @post = Post.find(params[:id])
        end
    end

    def new
        @post = Post.new
    end

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