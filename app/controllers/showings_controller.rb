class ShowingsController < ApplicationController
    before_action :find_showing, only: [:show,:edit,:update,:destroy]
    
    def index
        @showings = Showing.all
    end
    
    def show
        
    end

    def new
        @showing = Showing.new
        @movies = Movie.accepted
    end
    
    def create
        @showing = Showing.create(showing_params)
        if @showing.valid?
            redirect_to showing_path(@showing)
        else
            flash[:errors] = @showing.errors.full_messages
            redirect_to new_showing_path
        end
    end

    def edit
        @movies = Movie.accepted
    end
    
    def update
        if @showing.update(showing_params)
            redirect_to showing_path(@showing)
        else
            flash[:errors] = @showing.errors.full_messages
            redirect_to edit_showing_path
        end

    end

    def destroy
        @showing.destroy
        redirect_to showings_path
    end





    private
    
    def showing_params
        params.require(:showing).permit(:time,:movie_id)
    end

    def find_showing
        @showing = Showing.find(params[:id])
    end
end
