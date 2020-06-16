class MoviesController < ApplicationController
    def show
      movie = Movie.find(params[:id])
  
      render :show, locals: { movie: movie }
    end

    def index
        movies = Movie.all 
        render :index, locals: { movies: movies }
    end

    def new
        @movie = Movie.new
    end

    def create
        attributes = { title: params[:movie][:title], director: params[:movie][:director] }
        movie = Movie.create(attributes)
        render :success
    end

  end