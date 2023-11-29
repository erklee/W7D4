class SessionsController < ApplicationController
    def new 
        @user = User.new 
        render :new
    end
    
    def create 
        email = params[:users][:email]
        password = params[:users][:password]
        @user = User.find_by_credentials(email,password)
        if @user.save 
            login!(@user)
            redirect_to user_url(@user)
        else
            @user = User.new(email: email)
            flash.now[:errors] = ["No"]
            render :new 
        end
    end

    def destroy
        logout! 
        redirect_to new_session_url 
    end
end
