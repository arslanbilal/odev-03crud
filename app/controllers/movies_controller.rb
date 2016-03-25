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
    movie = Movie.create(movie_params(params))

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
    movie = Movie.find(params[:id])

    if movie.update(movie_params(params))
      redirect_to movie_path(movie)
    else
      movie = Movie.find(params[:id])
      redirect_to edit_movie_path(movie), notice: "Can not updated."
    end

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

  def movie_params(p) 
    params = {title: p[:title], director: p[:director], description: p[:description], country: p[:country], date: p[:date]}
    return params
  end

end
