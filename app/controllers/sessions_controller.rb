class SessionsController < ApplicationController 
    
    def new
    end
    #if user tries to sign in with facebook, their info is saved. if user already exists, they are logged in. if they do not, a new user is created.
    def create
        if auth_hash = request.env["omniauth.auth"]
            #logging in via facebook
            oauth_email = auth['info']['email']
            oauth_name = auth['info']['name']

            if user = User.find_by(:email => oauth_email)
                session[:user_id] = user.id
                redirect_to '/posts'
            else
                user = User.new(:email => oauth_email, :full_name => oauth_name, :password => SecureRandom.hex) 
                if user.save
                    session[:user_id] = user.id
                    redirect_to '/posts'
                end
            end
        else
        user = User.find_by(email: params[:email])
        
            if user && user.authenticate(params[:password])
             session[:user_id] = user.id
             redirect_to '/posts'
            else
             flash[:alert] = 'Invalid Email/ Password Combination. Please try again!'
             redirect_to '/login'
            
             end 
        end
    end 

    

    
    #session is deleted, user is redirected to login
    def destroy
        session.delete :user_id
        redirect_to '/login'
    end

    private
    
    
    #auth method requests info from omniauth (facebook)
    def auth
        request.env['omniauth.auth']
    end

    

end 