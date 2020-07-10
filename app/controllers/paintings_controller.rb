class PaintingsController < ApplicationController

    
    


    def index
        
        @paintings = Painting.all
    end 

    def show
    @painting = Painting.find_by(id: params[:id])
       
    end

    def new
        @painting = Painting.new
    end

    def edit
    end 

    def create
        
        user = current_user
        @painting = user.paintings.new(painting_params)
        @painting.save!
        render :show
            
    end

    private

    

    def painting_params
        params.require(:painting).permit(:title, :rating, :image, :user_id)
    end     
end