class PaintingsController < ApplicationController

    def index
        @paintings = Paintings.all
    end 

    def show
    end

    def new
        @painting = Painting.new
    end

    def edit
    end 

    def create
        @painting = Painting.new(painting_params)
        
        respond_to do |format|
            if @painting.save
                format.html {redirect_to @painting, notice: 'Painting was successfully added.'}
                format.json {render :show, status: :created, location: @painting}
            else
                format.html {render :new}
                format.json {render json: @painting.errors, status: :unrocessable_entity}
            end
        end
    end

    private

    def painting_params
        params.require(:painting).permit(:title, :rating, :image)
    end     
end