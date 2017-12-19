class MoviesController < ApplicationController

  before_action :set_id,except:[:new,:create,:index]
  before_action :get_toprated, only:[:index]
  before_action :get_topviewed, only:[:index]


  def index
    @movies = Movie.new
    @movie_toprated = @movies_toprated.limit(4)
    @movie_topviewed = @movies_topviewed.limit(4)
  end

  def new
    @movies = Movie.new
  end

  def edit
  end

  def show
    @movie_list = Movie.all.order('rating desc')
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
    params.require(:movie).permit(:title,:image,:genre,:plot,:rating,:web,:year,:cast)
   end


  def set_id #this is for call backs
    @movies = Movie.find(params[:id])
  end
  def get_toprated
   @movies_toprated = Movie.all.order('rating desc')
 end


 def get_topviewed
   @movies_topviewed = Movie.all.order('rating asc')
 end

end
