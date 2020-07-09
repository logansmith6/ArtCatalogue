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
        artist = Artist.find_or_create_by(name: painting_params[:artist_name])
        @painting = artist.paintings.build(painting_params)
        
        #respond_to do |format|
            if @painting.save
                redirect_to @painting, notice: 'Painting was successfully added.'
                render :show
            else
               render :new
                
            end
        #end
    end

    private

    def painting_params
        params.require(:painting).permit(:title, :rating, :image, :artist_name)
    end     
end