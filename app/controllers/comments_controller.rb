class CommentsController < ApplicationController
	def create
    comment = Comment.create(comment_params)
		redirect_to "/ramen/#{comment.ramen_id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, ramen_id: params[:raman_id])
  end
end
