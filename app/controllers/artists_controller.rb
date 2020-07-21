class ArtistsController < ApplicationController

    #from homepage, users can search by artist. so, if the user searches (by name) then that Artist will be displayed.
    #if there are no results, an alert flashes and All artists are displayed. 
    def index
        if params[:name]
            @artists = Artist.where('name LIKE ?', "%#{params[:name]}")
            if @artists == []
                flash[:alert] = 'No results.'
                @artists = Artist.all
                
            end
        else 
            @artists = Artist.all
        end
        
    end 
    #shows all of the posts for a specific artist
    def show
        @artist = Artist.find_by_id(params[:id])
        @artist.posts.all
    end

    #creates local object, does not save to database
    def new
        @artist = Artist.new
    end

    #saves new artist to database
    def create
            @artist = Artist.create(artist_params)
    end

    private

    #name is required attribute for artist to be saved
    def artist_params
        params.require(:artist).permit(:name)
    end     
end