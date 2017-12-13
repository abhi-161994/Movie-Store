class MoviesController < ApplicationController

  before_action :set_id,except:[:new,:create,:index]

  def index
    @movies = Movie.new
  end

  def new
    @movies = Movie.new
  end

  def edit
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def create
    @movies = Movie.new(movie_params)
    if @movies.save
      redirect_to @movies,notice: "Movie Successfully Saved"
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


  def set_id #this is for call backs
    @movies = Movie.find(params[:id])
  end
end
