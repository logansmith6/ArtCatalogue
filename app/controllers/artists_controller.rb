class ArtistsController < ApplicationController


    def posts_index
        @artist = Artist.find(params[:id])
        @posts = @artist.posts
        render template: 'posts/index'
    end

    def posts_new
        @artist = Artist.find(params[:id])
        @post = @artist.posts.new
        render template: 'posts/new'
    end

    def post
        @artist = Artist.find(params[:id])
        @post = Post.find(params[:post_id])
        render template: 'posts/show'
    end

    def index
        if params[:name]
            @artists = Artist.where('name LIKE ?', "%#{params[:name]}")
        else 
            @artists = Artist.all
        end
        
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