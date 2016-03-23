class MoviesController < ApplicationController

  def index
  	#movies GET    /movies(.:format)
  	@movies = Movie.all
  end
  
  def show
  	# movie GET    /movies/:id(.:format)
  	@movie = Movie.find(params[:id])
  end

  def new
  	# new_movie GET    /movies/new(.:format)
  	@movie = Movie.new
  end

  def create
  	# - 	POST   /movies(.:format)
  end

  def edit
  	# edit_movie GET    /movies/:id/edit(.:format)
  	@movie = Movie.find(params[:id])
  end

  def update
  	# PUT    /movies/:id(.:format)
  end
    
  def destroy
  	# DELETE /movies/:id(.:format)
  end

end
