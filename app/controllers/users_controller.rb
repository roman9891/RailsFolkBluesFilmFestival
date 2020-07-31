class UsersController < ApplicationController
    before_action :find_user, only: [:show,:edit,:update,:destroy]
    #skip_before_action :authorized, only: [:new]

    #admin
    def index
        @users = User.all
    end

    def show
    end

    def new
        @user = User.new
    end

    #add authentication
    #redirect to welcome??
    def create
        @user = User.create(user_params)
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end

    #only for current user in before 
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
    def correct_user
        if !@current_user == params[:id] || !@current_user.is_admin
            redirect_to unauthorized_path
        end
    end

    def user_params
        params.require(:user).permit(:name,:email,:password)
    end

    def find_user
        @user = User.find(params[:id])
    end
end
