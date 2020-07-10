class ArtistsController < ApplicationController

    def index
        @artists = Artist.all
    end 

    def show
        @artist = Artist.find_by(params[:id])
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