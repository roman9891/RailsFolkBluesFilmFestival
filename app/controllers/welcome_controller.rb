class WelcomeController < ApplicationController
    def welcome 

    end

    def premier
        @movie = Showing.today.movie
        @comments = Showing.today.comments
    end

    def login

    end
end