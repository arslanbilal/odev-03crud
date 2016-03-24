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
  end

  def create
  	# - 	POST   /movies(.:format)
    movie = Movie.new
    movie.title = params[:title]
    movie.director = params[:director]
    movie.description = params[:description]
    movie.country = params[:country]
    movie.date = params[:date]

    if movie.save
      redirect_to movies_path
    else
      redirect_to new_movie_path, notice: "Can not added."
    end
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
    movie = Movie.find(params[:id])
    message = ""
    if movie.destroy
      message = " succesfully deleted."
    else
      message = " cannot deleted."
    end

    redirect_to movies_path, notice: movie.title + message
  end

end
