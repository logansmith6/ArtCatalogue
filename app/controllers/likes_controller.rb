class LikesController < ApplicationController
    before_action :find_post

    def create
        if like_once?
            flash[:notice] = "You already liked!"
        else
            @post.likes.create(user_id: current_user.id)
            redirect_to post_path(@post)
        end
        
    end

    private

    def find_post
        @post = Post.find(params[:post_id])
    end

    def like_once?
        Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
    end
end
