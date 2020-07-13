class LikesController < ApplicationController
    before_action :find_post
    before_action :get_like, only: [:destroy]

    def create
        if !like_once?  
            @post.likes.create(user_id: current_user.id)
            redirect_to post_path(@post)
        end 
    end

    def destroy
        if like_once?
            @like.destroy
            redirect_to post_path(@post)
        end  
    end

   



    private

    def get_like
        @like = @post.likes.find(params[:id])
    end

    def find_post
        @post = Post.find(params[:post_id])
    end

    def like_once?
        Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
    end
end
