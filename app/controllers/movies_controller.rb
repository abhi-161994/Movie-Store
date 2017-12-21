class MoviesController < ApplicationController

  before_action :set_id,except:[:new,:create,:index,:detail]
  before_action :get_toprated, only:[:index,:detail]
  before_action :get_topviewed, only:[:index,:detail]


  def index
    @movies = Movie.all.order('created _at desc').limit(3)
    @movie_toprated = @movies_toprated.limit(4)
    @movie_topviewed = @movies_topviewed.limit(4)

    @movie_search = Movie.all
    @srch = params[:search]
    if @srch
      @movie_search = Movie.search(@srch).order("created_at DESC")
    else
      @movie_search = Movie.all.order('created_at DESC')
    end
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

  def detail
    @movies_toprated = Movie.all.order('rating desc').search(params[:search])
    @movies_topviewed = Movie.all.order('rating asc').search(params[:search])
    if @movies_toprated.present?

  else

    @movies_toprated = Movie.all.order('rating desc')
    @movies_topviewed = Movie.all.order('rating asc')
    flash[:alert] = "There are no movies containing the term"
   end
    @view = params[:view]

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
