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
        @artist = Artist.find_or_create_by(artist_params)
    end

    private

    def artist_params
        params.require(:artist).permit(:name, :artist_id)
    end     
end