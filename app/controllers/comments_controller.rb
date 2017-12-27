class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.movie_id = params[:movie_id]
    if @comment.save
      redirect_to movie_path(params[:movie_id]),notice: "your review saved"
    else
      redirect_to movie_path(params[:movie_id]),alert: "Your review not saved"
    end
end
def destroy
  @movie = Movie.find(params[:movie_id])
  @comment = @movie.comments.find(params[:id])
  @comment.destroy
  redirect_to movie_path(@movie)
end

  private
     def comment_params
       params.require(:comment).permit(:body)
     end
   end
