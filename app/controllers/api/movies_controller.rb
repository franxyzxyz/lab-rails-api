module API
  class MoviesController < ApplicationController
    def index
      render json: Movie.all
    end

    def show
      render json: Movie.find(params[:id])
    end

    def create
      movie = Movie.new(movie_params)
      if movie.save
        render json: movie, status:202, location: [:api, movie]
      else
        render json: movie.errors, status:442
      end
    end

    def update
      movie = Movie.find(params[:id])
      if movie.update(movie_params)
        render json: movie, status:202, location: [:api, movie]
      else
        render json: movie.errors, status:442
      end
    end

    def destroy
      movie = Movie.find(params[:id])
      movie.destroy
      head 204
    end

    private
    def movie_params
      params.require(:movie).permit(:title, :summary, :youtube_embed_id, :thumbnail)
    end
  end
end