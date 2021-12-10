class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])

    if params[:name]
      @actor = Actor.find_by_name(params[:name])
      @movie.actors << @actor
      redirect_to "/movies/#{@movie.id}"
    end
  end
end