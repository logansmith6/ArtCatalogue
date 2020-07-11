class ArtistsController < ApplicationController

    def index
        @artists = Artist.all
    end 

    def show
        @artist = Artist.find_by(params[:artist_id])
    end

    def new
        
    end


    

    
    def create
        @artist = Artist.create(artist_params)
    end

    private

    def artist_params
        params.require(:artist).permit(:name, :post_id)
    end     
end