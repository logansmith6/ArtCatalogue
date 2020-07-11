class ArtistsController < ApplicationController


    def posts_index
        @artist = Artist.find(params[:id])
        @posts = @artist.posts
        render template: 'posts/index'
    end

    def post
        @artist = Artist.find(params[:id])
        @post = Post.find(params[:post_id])
        render template: 'posts/show'
    end

    def index
        @artists = Artist.all
    end 

    def show
        @artist = Artist.find_by_id(params[:id])
        @artist.posts.all
    end

    def new
        
    end


    

    
    def create
            @artist = Artist.create(artist_params)
        
    end

    private

    def artist_params
        params.require(:artist).permit(:name)
    end     
end