class SessionsController < ApplicationController 
    
    def new
        
    end

    def create
        user = User.find_by(email: params[:email])
        
        if user && user.authenticate(params[:password])
            
            session[:user_id] = user.id
            redirect_to '/posts'
        else
            flash[:notice] = 'Invalid Email/ Password Combination. Please try again!'
            redirect_to '/login'
        end 
    end 

    def create_facebook
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            #u.name = auth['info']['name']
            u.email = auth['info']['email']
            #u.image = auth['info']['image']
        end 
        login(@user)
        redirect_to '/posts'
    end

    def destroy
        session.delete :user_id
        redirect_to '/login'
    end

    private
    
    

    def auth
        request.env['omniauth.auth']
    end

    

end 