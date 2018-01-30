class MoviesController < ApplicationController

  before_action :set_id,except:[:index,:detail,:create,:chart]
  before_action :authenticate_admin_user!,only: [:create]
  before_action :get_toprated, only:[:index,:detail]
  before_action :get_topviewed, only:[:index,:detail]


  def index

    @movies = Movie.all.order('created _at desc').limit(3)
    @movie_toprated = @movies_toprated.limit(4)
    @movie_topviewed = @movies_topviewed.limit(4)
    @movie_search = Movie.all
    @srch = params[:search]
    # @top_views = @movies_top_viewed('rating desc').limit(6)
       render layout: "index_layout"
  end

  def new
    @movies = Movie.new
    end

  def edit
  end

def chart
@top_views = Movie.all.order('view DESC').limit(6)
end

  def show
    @movie_list = Movie.all.order('rating desc')
    mm = @movies.view + 1
    @movies.view = mm
    @movies.save

  end

  def create
    if params[:view] =="automatic"

      @mv = OtherServiceCall.new.api_call(params[:movie][:title])
      if @mv == true
        redirect_to 'http://localhost:3000/admin/movies',notice: "Movies Successfully Saved"
      else
        redirect_to new_admin_movie_path(view: params[:view]),alert: "Movie Not Found Please Verify it."
      end
    else
    @movies = Movie.new(movie_params)
        if @movies.save
        redirect_to 'http://localhost:3000/admin/movies',notice: "Movies Successfully Saved"
      else
          redirect_to new_admin_movie_path
      end
  end
end

  def update
  end



  def detail
    @movies_toprated =@movies_toprated.search(params[:search])
    @movies_topviewed =  @movies_topviewed .search(params[:search])
    if @movies_toprated.present?
  else
    @movies_toprated  =  @movies_toprated
    @movies_topviewed = @movies_topviewed
    flash[:alert] = "There are no movies containing the term"
   end
    @view = params[:view]

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
   @movies_topviewed = Movie.all.order('view desc')
 end

end
