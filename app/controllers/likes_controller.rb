class LikesController < ApplicationController
    #before anything can happen, the specific post for a new like is identified
    before_action :find_post
    before_action :get_like, only: [:destroy]

    #if a user has not already liked this post, a new like is created
    def create
        if !like_once?  
            @post.likes.create(user_id: current_user.id)
            redirect_to post_path(@post)
        end 
    end

    #if the user has already liked the post, it can be destroyed (unliked)
    def destroy
        if like_once?
            @like.destroy
            redirect_to post_path(@post)
        end  
    end

   

    private
    #returns the amount of likes for a specific post
    def get_like
        @like = @post.likes.find(params[:id])
    end
    #as stated above, specific post is identified
    def find_post
        @post = Post.find(params[:post_id])
    end
    #returns true if current user has already liked specific post
    def like_once?
        Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
    end
end
