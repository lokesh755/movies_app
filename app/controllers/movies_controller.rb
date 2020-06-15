class MoviesController < ApplicationController

    def show
        @movies = ["Parasite", "Titanic"]
        @movieDirectors = ["Bong Joon-Ho", "James Cameron"]
        @movieId = params[:id].to_i
        @movieName = @movies[@movieId - 1]
        @movieDirector = @movieDirectors[@movieId - 1]
    end 
end