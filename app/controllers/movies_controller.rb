class MoviesController < ApplicationController
    before_action :find_movie, only: [:show, :edit, :update, :destroy]
    #before_action :authorized
    before_action :admin_authorized, only: [:status]
    #before_action is_not_guest, only: [:new, :edit, :destroy]
    def index
        if @current_user.nil? || !@current_user.is_admin
            @movies = Movie.accepted
        else
            @movies = Movie.all
        end
    end

    def show

    end

    def new
        @movie = Movie.new
    end

    def create
        @movie = Movie.create(movie_params)
        
        if @movie.valid?
            redirect_to movie_path(@movie)
        else
            flash[:errors] = @movie.errors.full_messages
           redirect_to new_movie_path
        end
    end

    def edit
        correct_users_movie
    end

    def update
        if @movie.update(movie_params)
            redirect_to movie_path(@movie)
        else
            flash[:errors] = @movie.errors.full_messages
            redirect_to edit_movie_path 
        end
    end

    def destroy
        @movie.destroy
        redirect_to movies_path
    end

    def status
        @movies = Movie.all.select do |movie|
            movie.acceptance_status == params[:status]
        end
    end
    
    private
    def correct_users_movie
        if !(@movie.user == @current_user) && !@current_user.is_admin
            redirect_to unauthorized_path
        end
    end

    def movie_params
        params.require(:movie).permit(:title, :url, :user_id, :is_mature, :acceptance_status, :is_mature)
    end

    def find_movie
        @movie = Movie.find(params[:id])
    end
end
