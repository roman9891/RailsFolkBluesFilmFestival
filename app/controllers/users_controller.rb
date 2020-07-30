class UsersController < ApplicationController
    before_action :find_user, only: [:show,:edit,:update,:destroy]

    def index
        @users = User.all
    end

    def show
    end

    def new
        @user = User.new
        cookies[:fun] = 0
        session[:yooo] = 0
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            redirect_to user_path(@user)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def edit
    end

    def update
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to edit_user_path
        end
    end

    def destroy
        @user.destroy
        redirect_to welcome_path
    end






    private
    def user_params
        params.require(:user).permit(:name,:email,:password)
    end

    def find_user
        @user = User.find(params[:id])
    end
end
