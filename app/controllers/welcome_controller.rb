class WelcomeController < ApplicationController
    def welcome 

    end

    def premier
        @movie = Showing.today.movie
        @comments = Showing.today.comments
    end

    def login
        @user = User.new
    end

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user
            session[:user_id] = @user.id
            redirect_to welcome_path
        else
            flash[:error] = "Invalid Login"
            redirect_to login_path
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to welcome_path
    end

    def unauthorized
  
    end
end