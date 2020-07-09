class PaintingsController < ApplicationController

    
    skip_before_action :verified_user, only: [:new, :create]
    


    def index
        @paintings = Painting.all
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
        
            if @painting.save
                render :show  
            else
                
               render :new
            end
    end

    private

    

    def painting_params
        params.require(:painting).permit(:title, :rating, :image, :artist_name)
    end     
end