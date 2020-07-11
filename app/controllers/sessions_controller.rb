class SessionsController < ApplicationController 
    
    def new
        
    end

    def create
        if auth_hash = request.env["omniauth.auth"]
            #logging in via facebook
            oath_email = auth['info']['email']
            oath_name = auth['info']['name']

            if user = User.find_by(:email => oath_email)
                session[:user_id] = user.id
                redirect_to '/posts'
            else
                user = User.new(:email => oauth_email, :password => SecureRandom.hex) 
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

    

    

    def destroy
        session.delete :user_id
        redirect_to '/login'
    end

    private
    
    

    def auth
        request.env['omniauth.auth']
    end

    

end 