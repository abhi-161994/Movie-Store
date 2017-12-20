class CommentController < ApplicationController
  before_action :authenticate_user!
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user_id
    @comment.movie_id = params[:movie_id]
    id @comment.save
      redirect_to_movie_path(params[:movie_id]),notice: "Review add Sucessfully"
    else
      redirect_to_movie_path(params[:movie_id]),alert: "Review cannot Saved"
    end
end
  private
     def comment_params
       params.require(:comment).permit(:body)
     end
   end
