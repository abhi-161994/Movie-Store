class MovieController < ApplicationController


  def new
    @movies = Movie.new
  end

  def index
  end

  def edit
  end

  def show
  end

  def create
    @home = Movie.new(movie_params)
    if @movies.save
      redirect_to @movie,notice: "Movie Successfully Saved"
    else
      render 'new'
  end
end


  def update
  end

  def destroy
  end

  private

  def movie_params
    params.require(:movie).permit(:title,:image,:genre,:plot,:rating,:web)
   end


  def set_id
    @movies = Movie.find(params[:id])
end
