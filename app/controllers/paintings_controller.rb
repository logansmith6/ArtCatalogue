class PaintingsController < ApplicationController

    helper_method :current_user
    skip_before_action :verified_user, only: [:new, :create]
    


    def index
        @paintings = Painting.all
    end 

    def show
        @painting 
       
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
        redirect_to @painting
            
    end

    private

    

    def painting_params
        params.require(:painting).permit(:title, :rating, :image, :user_id)
    end     
end