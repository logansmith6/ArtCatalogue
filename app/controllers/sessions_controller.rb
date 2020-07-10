class SessionsController < ApplicationController 

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(email: params[:email])
        
        if @user && @user.authenticate(params[:password])
            login(@user)
            flash[:success] = 'You are now signed in.'
            redirect_to '/posts'
        else
            flash[:warning] = 'Invalid Username or Password'
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
        reset_session
        redirect_to '/login'
    end

    private

    def auth
        request.env['omniauth.auth']
    end

    

end 