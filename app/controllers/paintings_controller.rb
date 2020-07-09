class PaintingsController < ApplicationController

    before_action :authorize


    def index
        @paintings = Painting.all
    end 

    def show
        @painting = Painting.find_by(params[:id])
    end

    def new
        @painting = Painting.new
    end

    def edit
    end 

    def create
        
        
        check_artist = Artist.find_or_create_by(name: painting_params[:artist_name])
        @painting = check_artist.paintings.build(painting_params)
        @painting = Painting.new(painting_params)
        
            if @painting.save
                redirect_to :logout  
            else
                raise "no"
               render :new
            end
    end

    private

    def painting_params
        params.require(:painting).permit(:title, :rating, :image, :artist_name)
    end     
end